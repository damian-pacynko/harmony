# Path to Questa directoy
QUESTA_HOME=/home/damian/intelFPGA_lite/22.1std/questa_fse
# Path to license file. Needed for Questa to run
export LM_LICENSE_FILE=$(QUESTA_HOME)/licenses/LR-148679_License.dat

# Runs vsim in command line
run: clean
	$(QUESTA_HOME)/bin/vlib work
# 	Compile all verilog modules in 
	$(QUESTA_HOME)/bin/vlog ../../src/$(DUT).v $(DUT)_tb.v
	$(QUESTA_HOME)/bin/vsim -c -voptargs=+acc $(DUT)_tb $(DUT) -Lf verilog -do wave.do -do "run;exit"

# Run vsim and open Questa gui
gui: run
	$(QUESTA_HOME)/bin/vsim -view vsim.wlf

clean:
	rm -rf *log
	rm -rf work
	rm -rf transcript
	rm -rf *.wlf
