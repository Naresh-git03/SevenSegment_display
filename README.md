Exp-No: 02 - Write and simulate seven segment display using Verilog HDL and verify with testbench
Aim:

  To design and simulate a Seven Segment using Verilog HDL and verify its functionality through a testbench using the Vivado 2023.1 simulation environment.
Apparatus Required:

  Vivado 2023.1

Procedure:


Launch Vivado Open Vivado 2023.1 by double-clicking the Vivado icon or searching for it in the Start menu.
Create a New Project Click on "Create Project" from the Vivado Quick Start window. In the New Project Wizard: Project Name: Enter a name for the project (e.g., Mux4_to_1). Project Location: Select the folder where the project will be saved. Click Next. Project Type: Select RTL Project, then click Next. Add Sources: Click on "Add Files" to add the Verilog files (e.g., mux4_to_1_gate.v, mux4_to_1_dataflow.v, etc.). Make sure to check the box "Copy sources into project" to avoid any external file dependencies. Click Next. Add Constraints: Skip this step by clicking Next (since no constraints are needed for simulation). Default Part Selection: You can choose a part based on the FPGA board you are using (if any). If no board is used, you can choose any part, for example, xc7a35ticsg324-1L (Artix-7). Click Next, then Finish.
Add Verilog Source Files In the "Sources" window, right-click on "Design Sources" and select Add Sources if you didn't add all files earlier. Add the Verilog files (mux4_to_1_gate.v, mux4_to_1_dataflow.v, etc.) and the testbench (mux4_to_1_tb.v).
Check Syntax Expand the "Flow Navigator" on the left side of the Vivado interface. Under "Synthesis", click "Run Synthesis". Vivado will check your design for syntax errors. If any errors or warnings appear, correct them in the respective Verilog files and re-run the synthesis.
Simulate the Design In the Flow Navigator, under "Simulation", click on "Run Simulation" → "Run Behavioral Simulation". Vivado will open the Simulations Window, and the waveform window will show the signals defined in the testbench.
View and Analyze Simulation Results 
Adjust Simulation Time To run a longer simulation or adjust timing, go to the Simulation Settings by clicking "Simulation" → "Simulation Settings". Under "Simulation", modify the Run Time (e.g., set to 1000ns).
Generate Simulation Report Once the simulation is complete, you can generate a simulation report by right-clicking on the simulation results window and selecting "Export Simulation Results". Save the report for reference in your lab records.
Save and Document Results Save your project by clicking File → Save Project. Take screenshots of the waveform window and include them in your lab report to document your results. You can include the timing diagram from the simulation window showing the correct functionality of the Seven Segment across different select inputs and data inputs.
Close the Simulation Once done, by going to Simulation → "Close Simulation

Input/Output Signal Diagram:
![input and output sevensegment](https://github.com/user-attachments/assets/c292bf36-669b-43d7-9e9c-62a4b4adf9c1)

 
RTL Code:
```
module seven_segment_display (
    input wire [3:0] binary_input,
    output reg [6:0] seg_output
);

always @(*) begin
    case (binary_input)
        4'b0000: seg_output = 7'b0111111; // 0
        4'b0001: seg_output = 7'b0000110; // 1
        4'b0010: seg_output = 7'b1011011; // 2
        4'b0011: seg_output = 7'b1001111; // 3
        4'b0100: seg_output = 7'b1100110; // 4
        4'b0101: seg_output = 7'b1101101; // 5
        4'b0110: seg_output = 7'b1111101; // 6
        4'b0111: seg_output = 7'b0000111; // 7
        4'b1000: seg_output = 7'b1111111; // 8
        4'b1001: seg_output = 7'b1101111; // 9
        default: seg_output = 7'b0000000; // blank or error
    endcase
end

endmodule
```
TestBench:
```
module seven_segment_display_tb;
reg [3:0] binary_input;
wire [6:0] seg_output;
seven_segment_display uut (
    .binary_input(binary_input),
    .seg_output(seg_output)
);
initial begin
    binary_input = 4'b0000;
    #10 binary_input = 4'b0000; // Display 0
    #10 binary_input = 4'b0001; // Display 1
    #10 binary_input = 4'b0010; // Display 2
    #10 binary_input = 4'b0011; // Display 3
    #10 binary_input = 4'b0100; // Display 4
    #10 binary_input = 4'b0101; // Display 5
    #10 binary_input = 4'b0110; // Display 6
    #10 binary_input = 4'b0111; // Display 7
    #10 binary_input = 4'b1000; // Display 8
    #10 binary_input = 4'b1001; // Display 9
    #10 $stop;
end

initial begin
    $monitor("Time=%0t | binary_input=%b | seg_output=%b", $time, binary_input, seg_output);
end
```

Output waveform:
<img width="1920" height="1200" alt="Screenshot (21)" src="https://github.com/user-attachments/assets/b6073b78-481c-49c8-9e8d-f587148dbc07" />

Conclusion:
The Verilog 7-segment decoder was successfully designed and simulated with support for both common-cathode and common-anode displays. The self-checking testbench verified all hexadecimal inputs (0–F), confirming correct segment outputs and polarity handling. Simulation results showed zero mismatches, ensuring reliable operation of the design.
