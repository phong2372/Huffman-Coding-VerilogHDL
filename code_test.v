`timescale 1ns / 1ps
module code_test;

	// Inputs
	reg CLK;
	reg nRST;
	reg [27:0] node_1;
	reg [27:0] node_2;
	reg [27:0] node_3;
	reg [27:0] node_4;
	reg [27:0] node_5;
	reg [27:0] node_6;
	reg [27:0] node_7;
	reg [27:0] node_8;
	reg [27:0] node_9;
	reg [27:0] node_10;
	reg [27:0] node_11;
	reg [27:0] node_12;
	reg [27:0] node_13;
	reg [27:0] node_14;
	reg [27:0] node_15;
	reg [27:0] node_16;
	reg [27:0] node_17;
	reg [27:0] node_18;
	reg [27:0] node_19;
	reg tree_over;

	// Outputs
	wire [129:0] CODE_TABLE;
	wire over;

	generate_code uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.node_1(node_1), 
		.node_2(node_2), 
		.node_3(node_3), 
		.node_4(node_4), 
		.node_5(node_5), 
		.node_6(node_6), 
		.node_7(node_7), 
		.node_8(node_8), 
		.node_9(node_9), 
		.node_10(node_10), 
		.node_11(node_11), 
		.node_12(node_12), 
		.node_13(node_13), 
		.node_14(node_14), 
		.node_15(node_15), 
		.node_16(node_16), 
		.node_17(node_17), 
		.node_18(node_18), 
		.node_19(node_19), 
		.tree_over(tree_over),
		.CODE_TABLE(CODE_TABLE),
		.over(over)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		node_1 = 28'b1001011111111110000101000001;
		node_2 = 28'b1001011111111110000100000010;
		node_3 = 28'b1000111111111110000011000011;
		node_4 = 28'b1000011111111110000010100100;
		node_5 = 28'b0111111111111110000001000101;
		node_6 = 28'b0110011111111110000000000110;
		node_7 = 28'b0110011111111110000000000111;
		node_8 = 28'b0110111111111110000000001000;
		node_9 = 28'b0101111111111110000000001001;
		node_10 = 28'b0101111111111110000000001010;
		node_11 = 28'b0110101001010100000000001011;
		node_12 = 28'b0111000111001100000000001100;
		node_13 = 28'b0111001000010110000000001101;
		node_14 = 28'b0111101101011000000000001110;
		node_15 = 28'b1000000101011100000001001111;
		node_16 = 28'b1000100100011110000011110000;
		node_17 = 28'b1001110000000110000110110001;
		node_18 = 28'b1001100001000100001001010010;
		node_19 = 28'b0000010010100010001111110011;
		tree_over = 1'b1;
		
		// Wait 100 ns for global reset to finish
		#100;
		nRST = 1;
		// Add stimulus here
		#1000;
		$display("CODE TABLE = %b", CODE_TABLE);
		if(over == 1'b1) begin
		  $display("CODE TABLE = %b", CODE_TABLE);
		end
	end
	parameter DELAY = 1;
	always 
		#DELAY CLK = ~ CLK;
      
endmodule

