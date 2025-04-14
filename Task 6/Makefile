
TOP = top
PCF_FILE = VSDSquadronFM.pcf
BOARD_FREQ = 12
FPGA_VARIANT = up5k
FPGA_PACKAGE = sg48
VERILOG_FILE = top.v uart_tx.v ultrasonic_sensor.v buzzer.v

build:
	yosys -q -p "synth_ice40 -abc9 -top $(TOP) -json $(TOP).json" $(VERILOG_FILE)
	nextpnr-ice40 --json $(TOP).json --pcf $(PCF_FILE) --asc $(TOP).asc --freq $(BOARD_FREQ) --$(FPGA_VARIANT) --package $(FPGA_PACKAGE)
	icepack $(TOP).asc $(TOP).bin

flash:
	iceprog $(TOP).bin

clean:
	rm -f $(TOP).asc $(TOP).bin $(TOP).json
