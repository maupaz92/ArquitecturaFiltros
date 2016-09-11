`timescale 1ns / 1ps


module buffer_pixeles_mem_TEST;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] memory_data;
	reg save_mem_data;
	reg read_pixel;
	

	//outputs
	wire [7:0] pixel;
	wire space_available;
	wire data_available;
	

	buffer_pixeles_mem buffer_pixeles_mem_inst
	(
		.clk(clk),
		.reset(reset),
		.memory_data(memory_data),
		.read_pixel(read_pixel),
		.save_mem_data(save_mem_data),
		.pixel(pixel),
		.space_available(space_available),
		.data_available(data_available)
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
		memory_data = 32'haabbccdd;
		save_mem_data = 0;
		read_pixel = 0;
		
		repeat(2) @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		//
		repeat(2) @(posedge clk);
		save_mem_data = 1;
		@(posedge clk);
		save_mem_data = 0;
		
		memory_data = 32'habcdef77;
		
		repeat(2) @(posedge clk);
		read_pixel = 1;
		@(posedge clk);
		
//		//
//		repeat(2) @(posedge clk);
//		save_mem_data = 1;
//		@(posedge clk);
//		save_mem_data = 0;
//		
//		memory_data = 32'h12345678;
//		
//		//
//		repeat(2) @(posedge clk);
//		save_mem_data = 1;
//		@(posedge clk);
//		save_mem_data = 0;
//		
//		
//		memory_data = 32'h87654321;
//		
//		//
//		repeat(2) @(posedge clk);
//		save_mem_data = 1;
//		@(posedge clk);
//		save_mem_data = 0;
//		
//		//
//		repeat(2) @(posedge clk);
//		read_pixel = 1;
//		@(posedge clk);
//		
//		//
//		repeat(2) @(posedge clk);
//		
//		@(posedge clk);
//		
//		//
//		repeat(2) @(posedge clk);
//		
//		@(posedge clk);
		

		
	end
      
endmodule
