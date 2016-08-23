`timescale 1ns / 1ps


module mascara_filtro_TEST;

	// Inputs
	reg clk;
	reg reset;

	reg [2:0] tamano_mascara;
	reg [9:0] direccion_inicio_mascara;
	reg iniciar_lectura_mascara;
	reg lectura_completada;
	reg [31:0] datos_memoria;
	
	
	//outputs
	wire [9:0] salida_1;
	wire [9:0] salida_2;
	wire [9:0] salida_3;
	wire [9:0] salida_4;
	wire [9:0] salida_5;
	wire [9:0] salida_6;
	wire [9:0] salida_7;
	wire [9:0] salida_8;
	wire [9:0] salida_9;
	wire [9:0] salida_10;
	wire [9:0] salida_11;
	wire [9:0] salida_12;
	wire [9:0] salida_13;
	wire [9:0] salida_14;
	wire [9:0] salida_15;
	wire [9:0] salida_16;
	wire [9:0] salida_17;
	wire [9:0] salida_18;
	wire [9:0] salida_19;
	wire [9:0] salida_20;
	wire [9:0] salida_21;
	wire [9:0] salida_22;
	wire [9:0] salida_23;
	wire [9:0] salida_24;
	wire [9:0] salida_25;
	wire [9:0] salida_26;
	wire [9:0] salida_27;
	
	wire [9:0] direccion_mem_fisica;
	wire leer;
	wire mascara_valida;
	
	

	
	mascara_filtro mascara_filtro_inst
	(
		.clk(clk),
		.reset(reset),
		.tamano_mascara(tamano_mascara),
		.direccion_mem_inicio_mascara(direccion_inicio_mascara),
		.iniciar_lectura(iniciar_lectura_mascara),
		.lectura_completada(lectura_completada),
		.datos_memoria(datos_memoria),
		//
		.direccion_mem_fisica(direccion_mem_fisica),
		.leer(leer),
		.mascara_valida(mascara_valida),
		.valor_mascara_1(salida_1),
		.valor_mascara_2(salida_2),
		.valor_mascara_3(salida_3),
		.valor_mascara_4(salida_4),
		.valor_mascara_5(salida_5),
		.valor_mascara_6(salida_6),
		.valor_mascara_7(salida_7),
		.valor_mascara_8(salida_8),
		.valor_mascara_9(salida_9),
		.valor_mascara_10(salida_10),
		.valor_mascara_11(salida_11),
		.valor_mascara_12(salida_12),
		.valor_mascara_13(salida_13),
		.valor_mascara_14(salida_14),
		.valor_mascara_15(salida_15),
		.valor_mascara_16(salida_16),
		.valor_mascara_17(salida_17),
		.valor_mascara_18(salida_18),
		.valor_mascara_19(salida_19),
		.valor_mascara_20(salida_20),
		.valor_mascara_21(salida_21),
		.valor_mascara_22(salida_22),
		.valor_mascara_23(salida_23),
		.valor_mascara_24(salida_24),
		.valor_mascara_25(salida_25),
		.valor_mascara_26(salida_26),
		.valor_mascara_27(salida_27)
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
		iniciar_lectura_mascara = 0;
		tamano_mascara = 5;
		direccion_inicio_mascara = 2;
		datos_memoria = 32'hffff_ffff;
		lectura_completada = 0;
		
		repeat(2) @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		//
		repeat(4) @(posedge clk);
		iniciar_lectura_mascara = 1;
		@(posedge clk);
		iniciar_lectura_mascara = 0;
		
		
		repeat(4) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		repeat(5) @(posedge clk);
		lectura_completada = 1;
		@(posedge clk);
		lectura_completada = 0;
		
		
	
		
		

		
	end
      
endmodule
