
`timescale 1ns / 1ps


module control_mascara_TEST;

	// Inputs
	reg clk;
	reg reset;
	
	reg [10:0] direccion_registros;
	reg [20:0] datos_registros;
	reg habilitacion_registros;

	//outputs
	wire [9:0] direccion_mem;
	

	
	control_mascara control_mascara_inst
	(
		.clk(clk),
		.reset(reset),
		.direccion_registros(direccion_registros),
		.datos_registros(datos_registros),
		.habilitacion_registros(habilitacion_registros),
		//
		.direccion_mem(direccion_mem)
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
		direccion_registros = 0;
		datos_registros = 3;
		habilitacion_registros = 0;
		
		repeat(2) @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		repeat(2) @(posedge clk);
		habilitacion_registros = 1;
		@(posedge clk);
		habilitacion_registros = 0;
		datos_registros = 10;
		direccion_registros = 1;
		
		
		repeat(2) @(posedge clk);
		habilitacion_registros = 1;
		@(posedge clk);
		habilitacion_registros = 0;
		

		
	end
      
endmodule


