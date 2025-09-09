`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2025 12:44:05
// Design Name: 
// Module Name: seven_seg_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module seven_segment_display_tb;
reg [3:0] binary_input;
wire [6:0] seg_output;
seven_segment_display uut (
    .binary_input(binary_input),
    .seg_output(seg_output)
);
initial begin
    binary_input = 4'b0000;
    #10 binary_input = 4'b0000;
    #10 binary_input = 4'b0001; 
    #10 binary_input = 4'b0010;
    #10 binary_input = 4'b0011; 
    #10 binary_input = 4'b0100;
    #10 binary_input = 4'b0101; 
    #10 binary_input = 4'b0110; 
    #10 binary_input = 4'b0111; 
    #10 binary_input = 4'b1000; 
    #10 binary_input = 4'b1001; 
    #10 $stop;
end
initial begin
    $monitor("Time=%0t | binary_input=%b | seg_output=%b", $time, binary_input, seg_output);
end
endmodule