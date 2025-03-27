# VSDSquadron-FM-research-Internship

<details>
<summary>Task 1 </summary>
# VSDFPGA Task 1 - VSDSquadron FPGA Mini: Verilog and PCF Task 

# 1. Understanding the Verilog Code

## Verilog Code and its functions:
The Verilog code it  has a blinking blue led. It’s main features are:  
**Clock Division:** A clock divider is implemented to reduce the input clock frequency to a lower frequency suitable for driving the LED.  
**Blinking Mechanism:** the clock makes an input signal  

### Key Signals:
**Clock (clk):** The clock signal oF the FPGA.  
**Reset (reset):** resets the clock divider for it to stop blinking  
**LED Output (led_blue):** Output Signal of the blue led  

# 2. PCF FILE:
The PCF file (VSDSquadronFM.pcf) means the pins and the mapping of the Verilog design. mappings are:  
**clk:** Connected to clock input pin.  
**reset:** Connected to a GPIO pin.  
**led_blue:** Connected to the pin where it makes the blue LED glow.  

### Sample PCF File Content:
set_io clk 21       (this is the clock input pin)  
set_io reset 35     (this is the reset input pin)  
set_io led_blue 25  (this is the blue LED output pin)  

### Observations:
Pin numbers correspond to specific physical locations on the FPGA Mini board.  
Proper mapping ensures the FPGA design interacts correctly with external components.  

# 3. Integration Steps and Observations While Working with the FPGA Mini Board
## Integration Steps
### 1.	Setup:
Install Yosys to upload the code into the Verilog  
Used nextpnr-ice40 for place-and-route.  
Timing analysis for ice-time.  
Converts bitstream through icepack and programme it using the FPGA with the iceprog.  

### 2.	Verilog Code Compilation and Build:
Ran the build target in the Makefile to synthesize the Verilog code and generate the necessary files (JSON, ASC, BIN).  

### 3.	Programming the FPGA:
Uploaded the binary bitstream file (top.bin) to the FPGA Mini board using iceprog.  

### 4.	Testing the Design:
Verified that the blue LED blinked at the expected frequency  

# Outcome
The clock divider's parameters required fine-tuning to achieve the desired LED blinking rate.  
Correctly matching the PCF file to the FPGA board layout was critical to ensuring proper functionality.  
The reset signal was tested successfully, halting and resuming the blinking as expected.  


## Step 1: Open Xubuntu:
![1](https://github.com/user-attachments/assets/27cf8fc3-be4d-479c-ad1a-8dfe8508bb10)

## Step 2: Open terminal and open VSDSquadron_FM: 
![2](https://github.com/user-attachments/assets/c21363c5-f374-47f9-b071-6d8949accb05)

## Step 3: Then open blink led in VSDSQUADRON_FM: 
![3](https://github.com/user-attachments/assets/fae4b7e4-3d5b-4c29-a122-1633afe1186c)

## Step 4: Now we need to let the power reach the board: 
![4](https://github.com/user-attachments/assets/5e59f8b8-2f8b-4262-9cb7-833274dba7f4)

## Step 5: Then use the command lsusb to check if the code can reach the board: 
![5](https://github.com/user-attachments/assets/e1a36a33-1410-4cec-80c3-23d5f631c776)

## Step 6: Then clean all the extra builds using make clean: 
![6](https://github.com/user-attachments/assets/68059760-7f32-4a5c-848a-c4a2457c4d55)

## Step 7: Then use the command make build: 
![7](https://github.com/user-attachments/assets/81624409-6cbc-4088-b8ef-855a1beb3348)

## Step 8: Finally use the command sudo make flash then enter sudo password: 
![8](https://github.com/user-attachments/assets/52f68700-b628-49fb-bc87-02247eb28aad)


# 4. Challenges Faced and Solutions Implemented
## Challenges
### 1.	USB option:
The USB option to select.  
**Solution:** Checking in device Manager of windows.  
### 2.	Wrong version:
Testing with the old version.  
**Solution:** creating a new version.  
### 3.	Serial Communication:
Difficulty in establishing UART communication for debugging.  
**Solution:** Configured picocom with the correct baud rate and port settings specified in the Makefile.  

## Working Verilog Code:
Working of the LED blinking along with clock division and reset.  
2.	Pin limitation File (VSDSquadronFM.pcf):  
Provides us with the exact pin mappings for the FPGA Mini board.  
3.	Makefile:  
Automates the ‘make clean’ and ‘make build’
</details>
