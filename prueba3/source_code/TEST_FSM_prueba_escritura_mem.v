`timescale 1ns / 1ps


module TEST_FSM_prueba_escritura_mem;

	// Inputs
	reg clk;
	reg reset;
	reg iniciar_prueba;
	reg operacion_completada;
	reg [63:0] datos_leidos;

	//outputs
	wire leer;
	wire escribir;
	wire [63:0] datos_por_escribir;
	wire [17:0] direccion_memoria;
	

	
	FSM_prueba_escritura_mem FSM_prueba_escritura_mem_inst
	(
		.clk(clk),
		.reset(reset),
		.iniciar_prueba(iniciar_prueba),
		.operacion_completada(operacion_completada),
		.datos_leidos(datos_leidos),
		//
		.leer(leer),
		.escribir(escribir),
		.datos_por_escribir(datos_por_escribir),
		.direccion_memoria(direccion_memoria)
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
		datos_leidos = 7;
		operacion_completada = 0;
		iniciar_prueba = 0;
		
		repeat(2) @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		//
		repeat(2) @(posedge clk);
		iniciar_prueba = 1;
		@(posedge clk);
		iniciar_prueba = 0;
		
		repeat(4) @(posedge clk);
		operacion_completada = 1;
		@(posedge clk);
		operacion_completada = 0;
		
		
		repeat(6) @(posedge clk);
		operacion_completada = 1;
		@(posedge clk);
		operacion_completada = 0;
		

		
	end







	
endmodule

















