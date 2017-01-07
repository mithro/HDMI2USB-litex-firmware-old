#!/usr/bin/env python3
from opsis_video import *

from litex.soc.interconnect import stream

from gateware.encoder import EncoderDMAReader, EncoderBuffer, Encoder
from gateware.streamer import USBStreamer


base_cls = VideoMixerSoC

class HDMI2USBSoC(base_cls):
    csr_peripherals = (
        "encoder_reader",
        "encoder",
        "analyzer",
    )
    csr_map_update(base_cls.csr_map, csr_peripherals)
    mem_map = {
        "encoder": 0x50000000,  # (shadow @0xd0000000)
    }
    mem_map.update(base_cls.mem_map)

    def __init__(self, platform, **kwargs):
        base_cls.__init__(self, platform, **kwargs)

        encoder_port = self.sdram.crossbar.get_port()
        self.submodules.encoder_reader = EncoderDMAReader(encoder_port)
        encoder_cdc = stream.AsyncFIFO([("data", 128)], 4)
        encoder_cdc = ClockDomainsRenamer({"write": "sys",
                                           "read": "encoder"})(encoder_cdc)
        encoder_buffer = ClockDomainsRenamer("encoder")(EncoderBuffer())
        encoder = Encoder(platform)
        encoder_streamer = USBStreamer(platform, platform.request("fx2"))
        self.submodules += encoder_cdc, encoder_buffer, encoder, encoder_streamer

        self.comb += [
            self.encoder_reader.source.connect(encoder_cdc.sink),
            encoder_cdc.source.connect(encoder_buffer.sink),
            encoder_buffer.source.connect(encoder.sink),
            encoder.source.connect(encoder_streamer.sink)
        ]
        self.add_wb_slave(mem_decoder(self.mem_map["encoder"]), encoder.bus)
        self.add_memory_region("encoder",
            self.mem_map["encoder"] + self.shadow_base, 0x2000)

        self.platform.add_period_constraint(encoder_streamer.cd_usb.clk, 10.0)

        self.specials += Keep(encoder_streamer.cd_usb.clk)
        self.specials += Keep(self.crg.cd_encoder.clk)
        self.platform.add_false_path_constraints(
            self.crg.cd_sys.clk,
            self.crg.cd_encoder.clk,
            encoder_streamer.cd_usb.clk)

def main():
    parser = argparse.ArgumentParser(description="Opsis LiteX SoC")
    builder_args(parser)
    soc_sdram_args(parser)
    parser.add_argument("--nocompile-gateware", action="store_true")
    args = parser.parse_args()

    platform = opsis_platform.Platform()
    soc = HDMI2USBSoC(platform, **soc_sdram_argdict(args))
    builder = Builder(soc, output_dir="build",
                      compile_gateware=not args.nocompile_gateware,
                      csr_csv="test/csr.csv")
    vns = builder.build()
    soc.do_exit(vns)

if __name__ == "__main__":
    main()
