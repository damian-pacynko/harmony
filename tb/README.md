## Compiling and running a unit test:
  1. Run sim in command line: make DUT=\<name of dut\>
  
  2. Run sim in Questa gui:   make DUT=\<name of dut\> gui

The Makefile will set the path of the Questa home directory and license file. If make is not working, please update the makefile $QUESTA_HOME and $LM_LICENSE_FILE variables to point to those two paths.

The unit tests are meant to test only one verilog source file at a time. The Makefile compiles both the src file and the tb and then simulates them. You can update the wave.do file to modify the simulation to your needs. The verilog src file must be in placed in the */src* folder and should comply with the following name convention:
    
- harmony/src/\<DUT\>.v
- harmony/tb/\<DUT\>/\<DUT\>_tb.v

(where \<DUT\> is the name of the module)
