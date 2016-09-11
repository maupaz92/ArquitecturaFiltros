


`timescale 1ns / 1ps


module control_lecturas_mem_externa_TEST;

	// Inputs
	reg clk;
	reg reset;
	reg iniciar;
	reg buf_space_available;
	reg [20:0] direccion_mem_inicio_img;
	reg [20:0] lecturas_totales_mem;
	reg lectura_mem_completada;

	//outputs
	wire read_mem;
	wire [20:0] address_mem;
	wire save_mem_data;

	
	control_lecturas_mem_externa control_lecturas_mem_externa_inst
	(
		.clk(clk),
		.reset(reset),
		.iniciar(iniciar),
		.buf_space_available(buf_space_available),
		.direccion_mem_inicio_img(direccion_mem_inicio_img),
		.lecturas_totales_mem(lecturas_totales_mem),
		.lectura_mem_completada(lectura_mem_completada),
		//
		.read_mem(read_mem),
		.address_mem(address_mem),
		.save_mem_data(save_mem_data)
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
		iniciar = 0;
		buf_space_available = 1;
		direccion_mem_inicio_img  = 1;
		lecturas_totales_mem = 2;
		lectura_mem_completada = 0;
		
		repeat(2) @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		//
		repeat(2) @(posedge clk);
		iniciar = 1;
		@(posedge clk);
		iniciar = 0;
//
		repeat(4) @(posedge clk);
		lectura_mem_completada = 1;
		@(posedge clk);
		lectura_mem_completada = 0;
		
		//
		repeat(4) @(posedge clk);
		lectura_mem_completada = 1;
		@(posedge clk);
		lectura_mem_completada = 0;
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);
		
		
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);
		
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);

		
	end
      
endmodule



