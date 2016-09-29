`timescale 1ns / 1ps


module program_counter_TEST;

	// Inputs
	reg clk;
	reg reset;
	reg iniciar;
	reg reiniciar;
	reg lectura_completada;
	reg [31:0] instruccion_actual;

	//outputs
	wire leer_siguiente_inst;
	wire [13:0] direccion_siguiente_inst;
	integer conteo;

	
	program_counter program_counter_inst
	(
		.clk(clk),
		.reset(reset),
		.iniciar(iniciar),
		.reiniciar(reiniciar),
		.lectura_completada(lectura_completada),
		.instruccion_actual(instruccion_actual),
		//
		.leer_siguiente_inst(leer_siguiente_inst),
		.direccion_siguiente_inst(direccion_siguiente_inst)
	);

	
	localparam T = 20;
	
	always begin
		clk = 0;
		#(T/2);
		clk = 1;
		#(T/2);
	end


	initial begin
		conteo = 0;
		reset = 0;
		instruccion_actual = 10;
		iniciar = 0;
		reiniciar = 0;
		lectura_completada = 0;
		instruccion_actual = 2;
		
		repeat(2) @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		//
		repeat(2) @(posedge clk);
		iniciar = 1;
		@(posedge clk);
		iniciar = 0;
		
		repeat(3) @(posedge clk);
		
		for(conteo = 0; conteo < 5; conteo = conteo + 1) begin
			@(posedge clk);
			lectura_completada = 1;
			instruccion_actual = conteo;
			@(posedge clk);
			lectura_completada = 0;
			repeat(2) @(posedge clk);
		end
//
		repeat(3) @(posedge clk);
		lectura_completada = 1;
		instruccion_actual = 32'hffff_ffff;
		@(posedge clk);
		lectura_completada = 0;
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);
		
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




