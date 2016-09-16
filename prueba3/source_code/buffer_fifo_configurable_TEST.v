
`timescale 1ns / 1ps


module buffer_fifo_configurable_TEST;

	// Inputs
	reg clk;
	reg reset_config;
	reg reset_data;
	reg push;
	reg pop;
	reg [7:0] data_in;
	reg [2:0] configuration;
	reg save_config;
	
	//outputs
	wire [7:0] data_out;
	wire buffer_full;
	wire no_config;

	integer conteo;
	
	buffer_fifo_configurable buffer_fifo_configurable_inst
	(
		.clk(clk),
		.reset_data(reset_data),
		.reset_config(reset_config),
		.push(push),
		.pop(pop),
		.data_in(data_in),
		.configuration(configuration),
		.save_config(save_config),
		//
		.data_out(data_out),
		.buffer_full(buffer_full),
		.no_config(no_config)
	);
	
	localparam T = 20;
	
	always begin
		clk = 1;
		#(T/2);
		clk = 0;
		#(T/2);
	end


	initial begin
	
		reset_data = 0;
		reset_config = 0;
		push = 0;
		pop = 0;
		data_in = 1;
		configuration = 0;
		save_config = 0;
		conteo = 0;
		
		repeat(2) @(posedge clk);
		save_config = 1;
		configuration = 2;
		@(posedge clk);
		save_config = 0;
		
		repeat(2) @(posedge clk);
		
		for (conteo = 0; conteo < 260; conteo = conteo + 1) begin		
			repeat(2) @(posedge clk);
			push = 1;
			@(posedge clk);
			push = 0;
			data_in = conteo[7:0];
		end
		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 3;
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 4;
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 5;
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 6;
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 7;
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 8;
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 9;
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 10;
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 11;
//		
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 12;
//		
//		
//		repeat(2) @(posedge clk);
//		push = 1;
//		@(posedge clk);
//		push = 0;
//		data_in = 13;
		
		
		repeat(2) @(posedge clk);
		pop = 1;
		@(posedge clk);
		pop = 0;
		
		repeat(2) @(posedge clk);
		pop = 1;
		@(posedge clk);
		pop = 0;
		
		
		repeat(2) @(posedge clk);
		pop = 1;
		@(posedge clk);
		pop = 0;
		
		
		repeat(2) @(posedge clk);
		pop = 1;
		@(posedge clk);
		pop = 0;
		
		
		repeat(2) @(posedge clk);
		pop = 1;
		@(posedge clk);
		pop = 0;
		
		
		
		
		
		
		
	
		

		
	end
      
endmodule
