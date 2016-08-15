
`timescale 1ns / 1ps


module buffer_unidad_TEST;

	// Inputs
	reg clk;
	reg reset;
	reg push;
	reg write_en;
	reg read_en;
	reg pop;
	reg [7:0] data_in;

	
	//outputs
	wire [7:0] data_out;
	wire buffer_full;
	wire buffer_empty;
	wire [2:0] data_in_buffer;
	wire buffer_change;

	
	buffer_unidad buffer
	(
		.clk(clk) ,
		.reset(reset) ,
		.data_in(data_in) ,
		.read_req(pop) ,
		.read_en(read_en) ,
		.write_req(push) ,
		.write_en(write_en),
		//
		.data_out(data_out) ,
		.fifo_full(buffer_full) ,
		.fifo_empty(buffer_empty),
		.data_in_buffer(data_in_buffer),
		.buffer_change(buffer_change)
	);
	
	localparam T = 20;
	
	always begin
		clk = 1;
		#(T/2);
		clk = 0;
		#(T/2);
	end


	initial begin
	
		reset = 0;
		push = 0;
		pop = 0;
		write_en = 1;
		read_en = 1;
		
		data_in = 128;
		
		repeat(2) @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 1;
		
//		repeat(2) @(posedge clk);
//		pop = 1;
//		@(posedge clk);
//		pop = 0;
		
		repeat(4) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 2;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 3;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 4;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 5;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 6;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 7;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 8;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		data_in = 9;
		
		repeat(2) @(posedge clk);
		push = 1;
		@(posedge clk);
		push = 0;
		
		repeat(2) @(posedge clk);
		pop = 1;
		@(posedge clk);
		pop = 0;	
		
		
	
		

		
	end
      
endmodule
