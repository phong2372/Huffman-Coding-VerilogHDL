`timescale 1ns / 1ps
module out_data_test;

	// Inputs
	reg CLK;
	reg nRST;
	reg over;
	reg [129:0] CODE_TABLE;
	reg [1023:0] character_in;

	// Outputs
	wire start;
	wire [1023:0] out;
	wire [10:0] count;

	// Instantiate the Unit Under Test (UUT)
	out_data uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.over(over), 
		.CODE_TABLE(CODE_TABLE), 
 		.character_in(character_in),
		.start(start), 
		.out(out),
		.count(count)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		over = 1'b1;
		character_in = 1024'b0101_0100_0011_0010_0001_0100_0011_0010_0001_0100_0011_0010_0001_0100_0011_0010_0001_0011_0010_0001_0010_0001_0010_0001_0001_0001_0101_0100_0011_0010_0001;
		CODE_TABLE = 130'b0100100000111010010100011101001100001100100010000110010000000011001010000001000110000000011000000000001010000000000101100000000010;

		// Wait 100 ns for global reset to finish
		#100;
	nRST = 1;
		// Add stimulus here

	end
	parameter DELAY = 1;
	always 
		#DELAY CLK = ~ CLK;
      
endmodule

