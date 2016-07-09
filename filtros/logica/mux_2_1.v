`timescale 1ns / 1ps



module mux_2_1(
	entrada_1,
	entrada_2,
	seleccion,
	salida
    );	
	
	parameter BITS_DATOS = 8;
	
	input [BITS_DATOS-1:0] entrada_1;
	input [BITS_DATOS-1:0] entrada_2;
	input seleccion;
	output [BITS_DATOS-1:0] salida;
	
	assign salida = seleccion == 1 ? entrada_2 : entrada_1;

endmodule
