`timescale 1ns / 1ps
module huffman(CLK,nRST,start,in,length,done);
	input CLK;
	input nRST;
	input start;
	input [3:0] in;
	output [10:0] length;
	output done;
	
	wire [1023:0] character;
	
	wire [129:0] frequent;
 
	wire [27:0] node_1;
	wire [27:0] node_2;
	wire [27:0] node_3;
	wire [27:0] node_4;
	wire [27:0] node_5;
	wire [27:0] node_6;
	wire [27:0] node_7;
	wire [27:0] node_8;
	wire [27:0] node_9;
	wire [27:0] node_10;
	wire [27:0] node_11;
	wire [27:0] node_12;
	wire [27:0] node_13;
	wire [27:0] node_14;
	wire [27:0] node_15;
	wire [27:0] node_16;
	wire [27:0] node_17;
	wire [27:0] node_18;
	wire [27:0] node_19;

	wire [129:0] CODE_TABLE;
	wire [1023:0] out;
	wire [10:0] count;
	wire over;
	wire count_over;
	wire tree_over;
	
	reg [11:0] j;
	reg input_over;
	reg [1023:0] mem[0:1023];
	
	initial
	begin
		$readmemb("code.txt",mem);
	end
	
	assign character[1023:0] = mem[in];
	
	always @(posedge CLK or negedge nRST)
	begin
		if(~nRST)
			begin		
			j <= 8'b0;
			input_over <= 1'b0;
			end
		else 
		begin
			if(start) begin
				  input_over <= 1'b1;		  
			end
			else ;
		end
	end
	count count_1(
		.CLK(CLK),
		.nRST(nRST),
		.input_over(input_over),
		.CHARACTER_IN(character[1023:0]),
		.FREQUENT_OUT(frequent[129:0]),
		.count_over(count_over)
	);
	
	generate_tree tree(
		.CLK(CLK),
		.nRST(nRST),
		.frequent(frequent),
		.count_over(count_over),
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
		.tree_over(tree_over)
	);
	
	generate_code code(
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
		.CODE_TABLE(CODE_TABLE[129:0]),
		.over(over)
	);
 
	out_data out_data1(
		.CLK(CLK),
		.nRST(nRST),
		.over(over),
		.CODE_TABLE(CODE_TABLE[129:0]),
		.character_in(character[1023:0]),
		.done(done),
		.out(out[1023:0]),
		.count(length[10:0])
	);

	 
endmodule

