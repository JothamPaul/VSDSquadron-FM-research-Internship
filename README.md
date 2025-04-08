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
  
  

https://github.com/user-attachments/assets/d148716a-8fc4-4241-81a6-2c84a56b3611


  
  
  
 
  
  
</details>


<details>

<summary>Task 2 </summary>

# Task List for Understanding and Implementing the Verilog Code on the VSDSquadron FPGA Mini Board

**Objective:** To understand and document the provided Verilog code, create the necessary PCF file, and integrate the design with the VSDSquadron FPGA Mini board.

## Introduction
The Universal Asynchronous Receiver-Transmitter (UART) loopback mechanism is an essential testing feature, enabling developers to verify data transmission and reception functionality within an FPGA-based system. This project involves designing, implementing, and testing a UART loopback system using Verilog, synthesizing it onto the VSDSquadron FPGA Mini, and verifying its functionality.  

## Code
**Repository Access:**
The uart_loopback project was downloaded from the VSDSquadron_FM repository.  
The Verilog files were cloned locally for analysis.  
### Key Modules:
**o	UART Transmitter (TX) and Receiver (RX):**  
The uart_trx.v file contains the implementation of both the UART transmitter and receiver functionalities. This module manages the data transmission and reception processes.  
**o	Top-Level Module:**
The top.v file serves as the top-level module, integrating the UART transceiver and establishing the loopback connection.  

•	Create a folder called uart_loopback then fill it with the makefile pcf file top.v and the uart_trx file:  
![image](https://github.com/user-attachments/assets/754e52b5-ca57-43a1-88b5-999cea567003)


## Block Diagram and Circuit Diagram
 
![image](https://github.com/user-attachments/assets/d6ddcf70-c489-488b-b58d-18fc90c117f1)


![image](https://github.com/user-attachments/assets/da454bb3-a3ed-44ee-bd5a-467f21a7f153)

 

## Hardware Implementation
### Hardware Setup:  
o	The VSDSquadron FPGA Mini was securely connected to a PC via a USB-UART converter.  

### Code Synthesis and Upload:  
o	The Verilog code was synthesized and  was uploaded to the FPGA

### Process:
•	Open terminal then enter the following code  
 ![image](https://github.com/user-attachments/assets/09a6e302-a5e5-487d-92bc-531789cbb17f)  

•	Then type lsusb then make build  
 ![image](https://github.com/user-attachments/assets/418f519e-e90e-47bf-86a9-f8e4520fcaef)  

•	Then type sudo make flash  
 ![image](https://github.com/user-attachments/assets/eb808561-da58-4a47-bf07-d182ba6437c9)  


## Testing and Verification
### Serial Terminal Configuration:  
Open docklight on windows then go to tools then project settings then type the required COM then fill in the baud rate:  
 ![image](https://github.com/user-attachments/assets/f71777b1-2c58-4c94-9659-e51f9e9061fe)  

Double click the box under name then fill in the following info:  
 ![image](https://github.com/user-attachments/assets/4dde2ff9-684a-4824-a942-87d13334b264)  


## Testing Process:  
o	Data was transmitted from the PC to the FPGA.  
o	Successful loopback was confirmed when the same data was received back on the serial terminal.  

Then click on apply and okay then click on the arrow next to the box:  
 ![image](https://github.com/user-attachments/assets/9e04e4e9-4244-48e6-afc4-120ebcfee559)  



https://github.com/user-attachments/assets/dca18de7-b7e4-4452-abef-6580c3c861f4



## Results
The UART loopback mechanism was successfully implemented and tested. The system consistently returned transmitted data without errors, validating the functionality of the TX and RX modules.  

## Conclusion  
This project demonstrated the successful implementation of a UART loopback system, achieving its objective of verifying UART functionality through hardware testing and documentation. The outcomes provide a reliable framework for further UART-based developments on the VSDSquadron FPGA Mini.  


</details>




<details>

<summary>Task 3 </summary>

# Task 3: Develop a UART transmitter module capable of sending serial data from the FPGA to an external device.

## Introduction:   
The Universal Asynchronous Receiver-Transmitter (UART) transmitter module is essential for serial communication, allowing FPGA-based systems to send data to external devices. This project involves designing, implementing, and testing a UART transmitter using Verilog, synthesizing it onto the VSDSquadron FPGA Mini, and verifying its functionality.  

## Study the Existing Code
### Repository Access:
o	The uart_tx project was accessed from the VSDSquadron_FM repository.

### Code Analysis:
o	Key modules, including the TX (transmitter), were identified.
o	The baud rate generator and clock divider were analyzed.
o	The sequential process of loading and shifting data was studied.

## Design Documentation
### Block Diagram:
o	A high-level block diagram was created to illustrate the UART transmission process, highlighting:  
	Data input.  
	Baud rate generator.  
	TX shift register.  
	Transmission to the external device.  
![image](https://github.com/user-attachments/assets/8248c442-5f2d-49f4-9934-8d0e106d3644)

### Circuit Diagram:
o	A detailed circuit diagram was developed, showing:  
	Connections between the FPGA TX pin and the receiving device.  
	Peripheral connections such as power and ground.  
![image](https://github.com/user-attachments/assets/192434e7-214e-4e52-854f-e02c9301b3d9)

## Hardware Implementation
### Hardware Setup:
o	The VSDSquadron FPGA Mini was connected to a PC via a USB-UART converter.
o	Connections were verified against the circuit diagram.
### Code Synthesis and Upload:
o	The following steps were followed:
1.	Open the uart_transmission file in the terminal.
2.	Connect the board and verify it through lsusb.
3.	Run the commands make build and sudo make flash to build and upload the Verilog code to the FPGA.

## Testing and Verification
### Serial Terminal Configuration:
o	You can download PuTTY from the URL- https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html 
o	A serial terminal (e.g., PuTTY) was configured with:
	Baud rate matching the Verilog UART setup.
	Correct data bits, stop bits, and parity settings.
o	The correct port was selected for communication.
### Testing Process:
o	Data was transmitted from the FPGA.
o	Successful transmission was confirmed by observing the expected output in the serial terminal.

First create a file known as uart_transmission:  
 ![image](https://github.com/user-attachments/assets/41fb3ed5-9ce5-4985-8014-bb47e6a9082e)  

Open the file in terminal:  
![image](https://github.com/user-attachments/assets/c3b2716a-fdc8-44eb-921f-631a773e85eb)  

 
Then connect the board and verify it through lsusb:  
 ![image](https://github.com/user-attachments/assets/e6b315dc-e2d7-4905-9b42-009d5cc6a753)  

Then use the commands make build and sudo make flash   
![image](https://github.com/user-attachments/assets/57f2857a-f5d5-464e-bfdf-f0fb7259b557)  

 
Then download putty in windows and follow the following instructions(you can change the port to your recuired port):  
![image](https://github.com/user-attachments/assets/d0de6e1d-45ba-4562-a9cf-d4fe92459893)  

 
If you have followed all these instructions correctly then you will see this:  
![image](https://github.com/user-attachments/assets/dc568e9a-e153-4668-9047-d51fd9619919)  



https://github.com/user-attachments/assets/35549a42-8596-4ec6-8d02-84e0988d58af



## Results
The UART transmitter module was successfully implemented and tested. The system consistently transmitted data without errors, verifying the proper functionality of the TX module.



</details>




<details>

<summary>Task 4 </summary>

# Task 4: Implement a UART transmitter that sends data based on sensor inputs, enabling the FPGA to communicate real-time sensor data to an external device.  


## Study of Existing Code
The uart_tx_sense module from the VSDSquadron_FM repository is reviewed to understand:  
•	Sensor data acquisition mechanisms  
•	UART transmission implementation  
•	Baud rate and data format configuration  
•	Handling of buffer storage and flow control  

## Design Documentation
### Block Diagram:
A block diagram is created to illustrate the data flow from the sensor to the FPGA and through the UART transmitter to the receiving device.  
 ![image](https://github.com/user-attachments/assets/bfa015e3-7b51-4371-9e20-93550abc1645)


### Circuit Diagram:
A detailed circuit schematic is developed  
 ![image](https://github.com/user-attachments/assets/27c5f542-f6aa-41c0-ab1f-14d8f053ecfc)


## Implementation
### Hardware Setup:
•	Connecting the sensor to the FPGA board
•	Ensuring power supply and signal integrity
### Verilog Code Implementation:
•	Data acquisition from the sensor
•	UART communication module with proper baud rate and frame settings
•	Buffer/FIFO implementation for stable data transmission
### Synthesis & Deployment:
•	Synthesis using FPGA toolchain (Vivado/Quartus/etc.)
•	Loading the bitstream onto the FPGA
•	Initial debugging using onboard LEDs or logic analyzers

### Create a new file in uart_transmission:  
![image](https://github.com/user-attachments/assets/9f818a6a-4922-46d6-b49c-4c6f43e1f70f)  

 
### Open this file in terminal:
![image](https://github.com/user-attachments/assets/3c11c89b-1f90-4e4c-8841-b58a03bd8fc6)  

 
### Use lsusb to verify that the board is connected and also use make build:  
![image](https://github.com/user-attachments/assets/76dcdac6-62f1-4ed8-b09f-4d67394be424)  

 
### Use the command sudo make flash:  
![image](https://github.com/user-attachments/assets/a065be11-2330-4681-9ce7-851d5372caec)  

 
### Open PuTTy in windows and follow the commands as given below:  
![image](https://github.com/user-attachments/assets/d624463f-5f27-4b5d-aabf-323a531bb72d)  

 
### Click open you will see as follows:
 ![image](https://github.com/user-attachments/assets/16cfae46-1c89-49d1-b884-8a302337db8f)



## Testing & Verification
### Sensor Data Validation:
•	Comparing raw sensor readings with UART-transmitted values
### Serial Terminal Monitoring:
•	Using PuTTY to capture transmitted data
### Edge Case Testing:
•	Handling sensor disconnections or incorrect data
•	Evaluating system response to noise and erroneous inputs



https://github.com/user-attachments/assets/46057fa7-9f81-4891-ae68-9de43c1ae93d


## Result: 
Here is the completed document outlining the implementation of the UART transmitter for sensor data communication.



</details>


<details>
<summary>Task 5 </summary>

# Project Themes:

**Real-Time Sensor Data Acquisition and Transmission System:** This theme focuses on developing systems that interface with various sensors to collect data, process it using the FPGA, and transmit the information to external devices through communication protocols like UART.​  


## Introduction
This project uses an FPGA to read sensor data and send it to another device like a PC using UART (Universal Asynchronous Receiver-Transmitter). It helps in sending real-time sensor data for display or analysis.
Research  
•	Code to read data from a sensor  
•	UART code to send data out  
•	How to set communication settings like speed and format  

[UART Serial Port Module Implementation] (https://nandland.com/uart-serial-port-module/)   
[Transmitter and receiver implementations] (https://www.instructables.com/UART-Communication-on-Basys-3-FPGA-Dev-Board-Power/)  
[Implementation of a UART controller, including aspects like baud rate support] (https://chipmunklogic.com/ip-cores/design-of-uart-controller/)  
[FPGA-Based Multi-Channel Real-Time Data Acquisition System] (https://www.mdpi.com/2079-9292/13/15/2950)
[UART Communication Link Implementation] (https://chandulanethmal.github.io/electronics/embedded/fpga/programming/UART-Communication-Link/)
[FPGA-Based Data Logger with LCD, ADC, UART & I2C] (https://www.youtube.com/watch?v=2Yd0p61pkWk)
[UART Protocol Implementation in Verilog] (https://github.com/ben-marshall/uart)
[Designing an RS232 UART Controller Using FPGA] (https://www.electronicsforu.com/electronics-projects/software-projects-ideas/designing-fpgas-rs232-uart-controller-part-3-5)


## Requirements  

### Hardware:  
•	FPGA board  
•	A sensor (temperature, IR, ultrasonic, tilt)  
•	USB-to-Serial converter   
•	PC or microcontroller  
•	Buzzer  
•	Led light  

### Software:    
•	Verilog  
•	Docklight  

 ## Block Diagram
 ![image](https://github.com/user-attachments/assets/c50ef49b-f918-40f9-9bff-b749ba8c58a6)


## Project Plan
**Research and Planning:** Study UART, sensor communication, and review existing Verilog implementations.  
**Component Collection and Diagram Design:** Collect all necessary hardware and software tools; create block and circuit diagrams.  
**Verilog Coding and Simulation:** Write code to acquire sensor data and implement UART transmission; simulate the design.  
**Hardware Setup and Testing:** Connect hardware as per the diagram; begin live testing, ensure reliable UART transmission.  
**Report and Demo Video:** Documenting the process and results; record a video demo showing real-time data output.  


</details>

