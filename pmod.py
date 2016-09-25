
class Connector:
    pass

class PmodConnector(Connector):
    # 1,2,3,4,5,6
    ['io1','io2','io3','io4','gnd','vcc']
    pass

# --------------
# IO layouts
# All LVCMOS/LVTTL 3.3V with +/- 5mA to 10mA

class PmodSingle(Connector):
    # Pin 1 - IO
    # Pin 2 - IO
    # Pin 3 - IO
    # Pin 4 - IO
    # Pin 5 - GND
    # Pin 6 - VCC
    pass

class PmodDouble(PmodDouble):
    # Pin  7 - IO
    # Pin  8 - IO
    # Pin  9 - IO
    # Pin 10 - IO
    # Pin 11 - GND
    # Pin 12 - VCC
    pass

class PmodLVDS_Horizontal(PmodSingle):
    # Pin 1 - LVDS1_N
    # Pin 2 - LVDS1_P
    # Pin 3 - LVDS2_N
    # Pin 4 - LVDS2_P
    # Pin 5 - GND
    # Pin 6 - VCC
    pass

class PmodLVDS_Vertical(PmodDouble):
    # Pin  1 - LVDS1_N
    # Pin  2 - LVDS2_N
    # Pin  3 - LVDS3_N
    # Pin  4 - LVDS4_N
    # Pin  5 - GND
    # Pin  6 - VCC
    # Pin  7 - LVDS1_P
    # Pin  8 - LVDS2_P
    # Pin  9 - LVDS3_P
    # Pin 10 - LVDS4_P
    # Pin 11 - GND
    # Pin 12 - VCC
    pass

class Pmod_Analog(PmodDouble):
    pass

# --------------

class PmodI2C(Connector):
    # Pin 1 - SCL1
    # Pin 2 - SCL2
    # Pin 3 - SDA1
    # Pin 4 - SDA2
    # Pin 5 - GND
    # Pin 6 - GND
    # Pin 7 - VCC
    # Pin 8 - VCC
    pass

class PmodType1_GPIO(PmodSingle):
    # Pin 1 - IO1 - Bidir
    # Pin 2 - IO2 - Bidir
    # Pin 3 - IO3 - Bidir
    # Pin 4 - IO4 - Bidir
    # Pin 5 - GND
    # Pin 6 - VCC
    pass

class PmodType2_SPI(PmodSingle):
    # Pin 1 - SS   - Out
    # Pin 2 - MOSI - Out
    # Pin 3 - MISO - In
    # Pin 4 - SCK  - Out
    # Pin 5 - GND
    # Pin 6 - VCC
    pass

class PmodType2A_SPIExpanded(PmodDouble, PmodType2_SPI):
    # Pin  7 - INT   - In
    # Pin  8 - RESET - Out
    # Pin  9 - IO1   - BiDir
    # Pin 10 - IO2   - BiDir
    # Pin 11 - GND
    # Pin 12 - VCC
    pass

class PmodType3_UART(PmodSingle):
    # Pin 1 - CTS - Out
    # Pin 2 - RTS - In
    # Pin 3 - RXD - In
    # Pin 4 - TXD - Out
    # Pin 5 - GND
    # Pin 6 - VCC
    pass

class PmodType4_UART(PmodSingle):
    # Pin 1 - CTS - In  - Peripheral can transmit
    # Pin 2 - TXD - Out - Data - Host to peripheral
    # Pin 3 - RXD - In  - Data - Peripheral to host
    # Pin 4 - RTS - Out - Peripheral ready for data
    # Pin 5 - GND
    # Pin 6 - VCC
    pass

class PmodType4A_UART(PmodDouble, PmodUART_Type4):
    # Pin  7 - INT   - In
    # Pin  8 - RESET - Out
    # Pin  9 - IO1   - BiDir
    # Pin 10 - IO2   - BiDir
    # Pin 11 - GND
    # Pin 12 - VCC
    pass

class PmodType5_HBridge(PmodSingle):
    # Pin 1 - DIR - Out
    # Pin 2 - EN  - Out
    # Pin 3 - SA  - In  - Feedback Sense A
    # Pin 4 - SB  - In  - Feedback Sense B
    # Pin 5 - GND
    # Pin 6 - VCC
    pass

class PmodType6_DualHBridge(PmodSingle):
    # Pin 1 - DIR1 - Out
    # Pin 2 - EN1  - Out
    # Pin 3 - DIR2 - Out
    # Pin 4 - EN2  - Out
    # Pin 5 - GND
    # Pin 6 - VCC
    pass



class PmodPeripheral(object):
    pass

pmodusbuart = {
    # 1    2     3     4
    ['rts','rxd','txd','cts']
}

def add_pmodusbuart(config, pmod):
    config.append(
        ("serial", 0,
            Subsignal("tx", Pins()),
            Subsignal("rx", Pins()),
            Subsignal("rts", Pins()),
            Subsignal("cts", Pins()),
            IOStandard("LVCMOS33")
        ),
    )

