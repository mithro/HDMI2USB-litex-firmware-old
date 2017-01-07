import sys
sys.path.append("../")
from core import *

from litex.build.generic_platform import *
from litex.build.xilinx.common import *
from litex.build.xilinx.platform import XilinxPlatform

from litex.soc.integration.soc_core import SoCCore


_io = [
    ("sys_clock", 0, Pins(1)),
    ("sys_reset", 0, Pins(1)),

    ("encoder_clock", 0, Pins(1)),
    ("encoder_reset", 0, Pins(1)),

    ("wishbone", 0,
        Subsignal("stb", Pins(1)),
        Subsignal("sel", Pins(4)),
        Subsignal("we",  Pins(1)),
        Subsignal("ack", Pins(1)),
        Subsignal("err", Pins(1)),
        Subsignal("cyc", Pins(1)),
        Subsignal("adr", Pins(32)),
        Subsignal("dat_w", Pins(32)),
        Subsignal("dat_r", Pins(32))
    ),

    ("sink", 0,
        Subsignal("valid", Pins(1)),
        Subsignal("ready", Pins(1)),
        Subsignal("data", Pins(16))
    ),

    ("source", 0,
        Subsignal("valid", Pins(1)),
        Subsignal("ready", Pins(1)),
        Subsignal("data", Pins(8))
    ),
]


class CorePlatform(XilinxPlatform):
    name = "core"
    def __init__(self):
        XilinxPlatform.__init__(self, "", _io)

    def do_finalize(self, *args, **kwargs):
        pass


class Core(SoCCore):
    platform = CorePlatform()
    def __init__(self, platform, clk_freq=100*1000000):
        self.clock_domains.cd_sys = ClockDomain("sys")
        self.clock_domains.cd_encoder = ClockDomain("encoder")
        self.comb += [
            self.cd_sys.clk.eq(platform.request("sys_clock")),
            self.cd_sys.rst.eq(platform.request("sys_reset")),
            self.cd_encoder.clk.eq(platform.request("encoder_clock")),
            self.cd_encoder.rst.eq(platform.request("encoder_reset")),
        ]
        SoCCore.__init__(self, platform, clk_freq,
            cpu_type=None,
            with_uart=False,
            with_timer=False
        )
        # encoder
        encoder = Encoder(platform)
        self.submodules += encoder
        
        # wishbone
        wishbone = platform.request("wishbone")
        self.comb += [
            encoder.bus.stb.eq(wishbone.stb),
            encoder.bus.sel.eq(wishbone.sel),
            encoder.bus.we.eq(wishbone.we),
            wishbone.ack.eq(encoder.bus.ack),
            wishbone.err.eq(encoder.bus.err),
            encoder.bus.adr.eq(wishbone.adr),
            encoder.bus.dat_w.eq(wishbone.dat_w),
            wishbone.dat_r.eq(encoder.bus.dat_r),
            encoder.bus.cyc.eq(wishbone.cyc)
        ]

        # sink
        sink = platform.request("sink")
        self.comb += [
            encoder.sink.valid.eq(sink.valid),
            encoder.sink.data.eq(sink.data),
            sink.ready.eq(encoder.sink.ready)
        ]

        # source
        source = platform.request("source")
        self.comb += [
            source.valid.eq(encoder.source.valid),
            source.data.eq(encoder.source.data),
            encoder.source.ready.eq(source.ready)
        ]

# build core
platform = CorePlatform()
core = Core(platform)
core_fragment = core.get_fragment()
platform.finalize(core_fragment)
v_output = platform.get_verilog(core_fragment, name="core")
v_output.write("core.v")