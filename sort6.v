`timescale 1ns / 1ps
module sort6(CLK,nRST,sort_begin,node0,node1,node2,node3,node4,node5,new1,new2,new3,new4,new5,new6,sort_over);
	input	CLK;
	input	nRST;
	input sort_begin;
	input [12:0] node0;
	input [12:0] node1;
	input [12:0] node2;
	input [12:0] node3;
	input [12:0] node4;
	input [12:0] node5;
	output [12:0] new1;
	output [12:0] new2;
	output [12:0] new3;
	output [12:0] new4;
	output [12:0] new5;
	output [12:0] new6;
	output sort_over;
	reg sort_over;
	
	reg [12:0] new1;
	reg [12:0] new2;
	reg [12:0] new3;
	reg [12:0] new4;
	reg [12:0] new5;
	reg [12:0] new6;
	
	reg [12:0] temp;
	
	wire [12:0] temp1;
	wire [12:0] temp2;
	wire [12:0] temp3;
	wire [12:0] temp4;
	wire [12:0] temp5;
	wire sort5_over;
	
	sort5 s5_1(
		.CLK(CLK),
		.nRST(nRST),
		.sort_begin(sort_begin),
		.node0(node0),
		.node1(node1),
		.node2(node2),
		.node3(node3),
		.node4(node4),
		.new1(temp1),
		.new2(temp2),
		.new3(temp3),
		.new4(temp4),
		.new5(temp5),
		.sort_over(sort5_over)
	);
	
	always @(posedge CLK or negedge nRST)
	begin
		if(!nRST)
			begin
			new1 <= 13'b0;
			new2 <= 13'b0;
			new3 <= 13'b0;
			new4 <= 13'b0;
			new5 <= 13'b0;
			new6 <= 13'b0;
			end
		else
		begin
		if(sort5_over) begin
			temp <= node5;
			if(temp[12:5] <= temp1[12:5])
				begin
				new1 <= temp;
				new2 <= temp1;
				new3 <= temp2;
				new4 <= temp3;
				new5 <= temp4;
				new6 <= temp5;
				end
			else if(temp[12:5] > temp1[12:5] && temp[12:5] <= temp2[12:5])
				begin
				new1 <= temp1;
				new2 <= temp;
				new3 <= temp2;
				new4 <= temp3;
				new5 <= temp4;
				new6 <= temp5;
				end
			else if(temp[12:5] > temp2[12:5] && temp[12:5] <= temp3[12:5])
				begin
				new1 <= temp1;
				new2 <= temp2;
				new3 <= temp;
				new4 <= temp3;
				new5 <= temp4;
				new6 <= temp5;
				end
			else if(temp[12:5] > temp3[12:5] && temp[12:5] <= temp4[12:5])
				begin
				new1 <= temp1;
				new2 <= temp2;
				new3 <= temp3;
				new4 <= temp;
				new5 <= temp4;
				new6 <= temp5;
				end
			else if(temp[12:5] > temp4[12:5] && temp[12:5] <= temp5[12:5])
				begin
				new1 <= temp1;
				new2 <= temp2;
				new3 <= temp3;
				new4 <= temp4;
				new5 <= temp;
				new6 <= temp5;
				end
			else
				begin
				new1 <= temp1;
				new2 <= temp2;
				new3 <= temp3;
				new4 <= temp4;
				new5 <= temp5;
				new6 <= temp;
				end
			sort_over <= #1 1'b1;
			end
			else ;
			end
	end
	
endmodule

