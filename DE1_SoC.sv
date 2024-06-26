// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
output logic [9:0] LEDR;
input logic [3:0] KEY;
input logic [9:0] SW;
// Default values, turns off the HEX displays

seg7 ex (.bcd(SW[3:0]), .hex0(HEX0));
seg7 xyz (.bcd(SW[7:4]), .hex0(HEX1));

endmodule
module DE1_SoC_testbench();
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
logic [9:0] LEDR;
logic [3:0] KEY;
logic [9:0] SW;
DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR,
.SW);
// Try all combinations of inputs.
integer i;
initial begin
for(i = 0; i <256; i++) begin
{SW[7:4],SW[3:0]} = i; #10;
end
end
endmodule