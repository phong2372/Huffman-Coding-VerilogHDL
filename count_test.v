`timescale 1ns / 1ps
module count_test;

	// Inputs
	reg CLK;
	reg nRST;
	reg input_over;
	reg [1023:0] CHARACTER_IN;

	// Outputs
	wire [129:0] FREQUENT_OUT;
	wire count_over;

	count uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.input_over(input_over),
		.CHARACTER_IN(CHARACTER_IN), 
		.FREQUENT_OUT(FREQUENT_OUT),
		.count_over(count_over)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		input_over = 1'b1;
		CHARACTER_IN = 1024'b0101_0100_0011_0010_0001_0100_0011_0010_0001_0100_0011_0010_0001_0100_0011_0010_0001_0011_0010_0001_0010_0001_0010_0001_0001_0001_0101_0100_0011_0010_0001;

		// Wait 100 ns for global reset to finish
		#100;
     nRST = 1;
		// Add stimulus here
		#1000;
   	$display("OUT = %b", FREQUENT_OUT);
	end
	parameter DELAY = 1;
	always 
		#DELAY CLK = ~ CLK;

      
endmodule

