`timescale 1ns / 1ps


module convolucion_mascara_ventana_TEST;


	localparam BITS_ELEMENTO_MASCARA = 10;
	localparam BITS_PIXEL = 8;	
	localparam BITS_MASCARA = 3;
	
	
	// Inputs
	reg clk;
	reg reset;
	reg ventana_pixeles_lista;
	reg [BITS_ELEMENTO_MASCARA-1:0] denominador;
	// valor que puede ser 3|5
	reg [BITS_MASCARA-1:0] tamano_mascara;
	
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_1;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_2;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_3;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_4;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_5;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_6;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_7;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_8;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_9;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_10;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_11;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_12;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_13;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_14;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_15;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_16;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_17;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_18;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_19;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_20;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_21;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_22;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_23;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_24;
	reg signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_25;
	
	
	reg [BITS_PIXEL-1:0] pixel_value_1;
	reg [BITS_PIXEL-1:0] pixel_value_2;
	reg [BITS_PIXEL-1:0] pixel_value_3;
	reg [BITS_PIXEL-1:0] pixel_value_4;
	reg [BITS_PIXEL-1:0] pixel_value_5;
	reg [BITS_PIXEL-1:0] pixel_value_6;
	reg [BITS_PIXEL-1:0] pixel_value_7;
	reg [BITS_PIXEL-1:0] pixel_value_8;
	reg [BITS_PIXEL-1:0] pixel_value_9;
	reg [BITS_PIXEL-1:0] pixel_value_10;
	reg [BITS_PIXEL-1:0] pixel_value_11;
	reg [BITS_PIXEL-1:0] pixel_value_12;
	reg [BITS_PIXEL-1:0] pixel_value_13;
	reg [BITS_PIXEL-1:0] pixel_value_14;
	reg [BITS_PIXEL-1:0] pixel_value_15;
	reg [BITS_PIXEL-1:0] pixel_value_16;
	reg [BITS_PIXEL-1:0] pixel_value_17;
	reg [BITS_PIXEL-1:0] pixel_value_18;
	reg [BITS_PIXEL-1:0] pixel_value_19;
	reg [BITS_PIXEL-1:0] pixel_value_20;
	reg [BITS_PIXEL-1:0] pixel_value_21;
	reg [BITS_PIXEL-1:0] pixel_value_22;
	reg [BITS_PIXEL-1:0] pixel_value_23;
	reg [BITS_PIXEL-1:0] pixel_value_24;
	reg [BITS_PIXEL-1:0] pixel_value_25;
	//outputs
	wire [BITS_PIXEL-1:0] pixel_resultado;
	wire pixel_calculado;
	

	convolucion_mascara_ventana convolucion_mascara_ventana_inst
	(
		.clk(clk),
		.reset(reset),
		.ventana_pixeles_lista(ventana_pixeles_lista),
		.denominador(denominador),
		.tamano_mascara(tamano_mascara),
		.mask_value_1(mask_value_1),
		.mask_value_2(mask_value_2),
		.mask_value_3(mask_value_3),
		.mask_value_4(mask_value_4),
		.mask_value_5(mask_value_5),
		.mask_value_6(mask_value_6),
		.mask_value_7(mask_value_7),
		.mask_value_8(mask_value_8),
		.mask_value_9(mask_value_9),
		.mask_value_10(mask_value_10),
		.mask_value_11(mask_value_11),
		.mask_value_12(mask_value_12),
		.mask_value_13(mask_value_13),
		.mask_value_14(mask_value_14),
		.mask_value_15(mask_value_15),
		.mask_value_16(mask_value_16),
		.mask_value_17(mask_value_17),
		.mask_value_18(mask_value_18),
		.mask_value_19(mask_value_19),
		.mask_value_20(mask_value_20),
		.mask_value_21(mask_value_21),
		.mask_value_22(mask_value_22),
		.mask_value_23(mask_value_23),
		.mask_value_24(mask_value_24),
		.mask_value_25(mask_value_25),
		.pixel_value_1(pixel_value_1),
		.pixel_value_2(pixel_value_2),
		.pixel_value_3(pixel_value_3),
		.pixel_value_4(pixel_value_4),
		.pixel_value_5(pixel_value_5),
		.pixel_value_6(pixel_value_6),
		.pixel_value_7(pixel_value_7),
		.pixel_value_8(pixel_value_8),
		.pixel_value_9(pixel_value_9),
		.pixel_value_10(pixel_value_10),
		.pixel_value_11(pixel_value_11),
		.pixel_value_12(pixel_value_12),
		.pixel_value_13(pixel_value_13),
		.pixel_value_14(pixel_value_14),
		.pixel_value_15(pixel_value_15),
		.pixel_value_16(pixel_value_16),
		.pixel_value_17(pixel_value_17),
		.pixel_value_18(pixel_value_18),
		.pixel_value_19(pixel_value_19),
		.pixel_value_20(pixel_value_20),
		.pixel_value_21(pixel_value_21),
		.pixel_value_22(pixel_value_22),
		.pixel_value_23(pixel_value_23),
		.pixel_value_24(pixel_value_24),
		.pixel_value_25(pixel_value_25),
		.pixel_resultado(pixel_resultado),
		.pixel_calculado(pixel_calculado)
	);
	
	localparam T = 20;
	
	always begin
		clk = 0;
		#(T/2);
		clk = 1;
		#(T/2);
	end


	initial begin


		ventana_pixeles_lista = 0;
		denominador = 1;
		tamano_mascara = 3;
		
		mask_value_1 = 0;
		mask_value_2 = -1;
		mask_value_3 = 0;
		mask_value_4 = -1;
		mask_value_5 = 5;
		mask_value_6 = -1;
		mask_value_7 = 0;
		mask_value_8 = -1;
		mask_value_9 = 0;
		
		mask_value_10 = 1;
		mask_value_11 = 1;
		mask_value_12 = 1;
		mask_value_13 = 1;
		mask_value_14 = 1;
		mask_value_15 = 1;
		mask_value_16 = 1;
		mask_value_17 = 1;
		mask_value_18 = 1;
		mask_value_19 = 1;
		mask_value_20 = 1;
		mask_value_21 = 1;
		mask_value_22 = 1;
		mask_value_23 = 1;
		mask_value_24 = 1;
		mask_value_25 = 1;
		
		
		pixel_value_1 = 93;
		pixel_value_2 = 148;
		pixel_value_3 = 250;
		pixel_value_4 = 102;
		pixel_value_5 = 136;
		pixel_value_6 = 242;
		pixel_value_7 = 104;
		pixel_value_8 = 134;
		pixel_value_9 = 230;
		
		pixel_value_10 = 1;
		pixel_value_11 = 1;
		pixel_value_12 = 1;
		pixel_value_13 = 1;
		pixel_value_14 = 1;
		pixel_value_15 = 1;
		pixel_value_16 = 1;
		pixel_value_17 = 1;
		pixel_value_18 = 1;
		pixel_value_19 = 1;
		pixel_value_20 = 1;
		pixel_value_21 = 1;
		pixel_value_22 = 1;
		pixel_value_23 = 1;
		pixel_value_24 = 1;
		pixel_value_25 = 1;	
		reset = 0;
		
		repeat(2) @(posedge clk);
		reset = 1;
		@(posedge clk);
		reset = 0;
		
		//
		repeat(4) @(posedge clk);
		ventana_pixeles_lista = 1;
		@(posedge clk);
		ventana_pixeles_lista = 0;
		
//
		repeat(2) @(posedge clk);
		denominador = 8;
		mask_value_1 = 1;
		mask_value_2 = 1;
		mask_value_3 = 1;
		mask_value_4 = 1;
		mask_value_5 = 1;
		mask_value_6 = 1;
		mask_value_7 = 1;
		mask_value_8 = 1;
		mask_value_9 = 1;
		@(posedge clk);
		
		//
		repeat(2) @(posedge clk);
		ventana_pixeles_lista = 1;
		@(posedge clk);
		ventana_pixeles_lista = 0;
		
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
