


`timescale 1ns / 1ps


module ventana_pixeles_TEST;

	// Inputs
	reg clk;
	reg reset;
	
	reg [7:0] pixel_entrada;
	reg [2:0] buffers_internos;
	reg [2:0] tamano_mascara;
	reg data_available;
	reg iniciar;
	reg siguiente_ventana;
	
	//outputs
	wire read_pixel;
	wire ventana_valida;
	
	wire [7:0] pix_1;
	wire [7:0] pix_2;
	wire [7:0] pix_3;
	wire [7:0] pix_4;
	wire [7:0] pix_5;
	wire [7:0] pix_6;
	wire [7:0] pix_7;
	wire [7:0] pix_8;
	wire [7:0] pix_9;
	wire [7:0] pix_10;
	wire [7:0] pix_11;
	wire [7:0] pix_12;
	wire [7:0] pix_13;
	wire [7:0] pix_14;
	wire [7:0] pix_15;
	wire [7:0] pix_16;
	wire [7:0] pix_17;
	wire [7:0] pix_18;
	wire [7:0] pix_19;
	wire [7:0] pix_20;
	wire [7:0] pix_21;
	wire [7:0] pix_22;
	wire [7:0] pix_23;
	wire [7:0] pix_24;
	wire [7:0] pix_25;
	
	
	//integer conteo;

	ventana_pixeles ventana_pixeles_inst
	(
		.clk(clk),
		.reset(reset),
		.cantidad_buffers_internos(buffers_internos),
		.tamano_mascara(tamano_mascara),
		.data_available(data_available),
		.iniciar(iniciar),
		.pixel_entrada(pixel_entrada),
		.siguiente_ventana(siguiente_ventana),
		//
		.read_pixel(read_pixel),
		.ventana_valida(ventana_valida),
		.pixel_1(pix_1),
		.pixel_2(pix_2),
		.pixel_3(pix_3),
		.pixel_4(pix_4),
		.pixel_5(pix_5),
		.pixel_6(pix_6),
		.pixel_7(pix_7),
		.pixel_8(pix_8),
		.pixel_9(pix_9),
		.pixel_10(pix_10),
		.pixel_11(pix_11),
		.pixel_12(pix_12),
		.pixel_13(pix_13),
		.pixel_14(pix_14),
		.pixel_15(pix_15),
		.pixel_16(pix_16),
		.pixel_17(pix_17),
		.pixel_18(pix_18),
		.pixel_19(pix_19),
		.pixel_20(pix_20),
		.pixel_21(pix_21),
		.pixel_22(pix_22),
		.pixel_23(pix_23),
		.pixel_24(pix_24),
		.pixel_25(pix_25)
	);

	
	localparam T = 20;
	
	always begin
		clk = 0;
		#(T/2);
		clk = 1;
		#(T/2);
	end


	initial begin
	
		reset = 0;
		buffers_internos = 1;
		tamano_mascara = 3;
		data_available = 1;
		iniciar = 0;
		pixel_entrada = 255;
		siguiente_ventana = 1;
		
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
		repeat(2) @(posedge clk);
		
		@(posedge clk);
		
		repeat(2) @(posedge clk);
		
//		for (conteo = 0; conteo < 1024; conteo = conteo + 1) begin		
//			repeat(2) @(posedge clk);
//			data_available = 1;
//			@(posedge clk);
//			data_available = 0;
//		end

		
	end
      
endmodule







