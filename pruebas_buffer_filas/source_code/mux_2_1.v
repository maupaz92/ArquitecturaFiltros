`timescale 1ns / 1ps

/*

Implementacion de un multiplexor 2 entradas - 1 una salida. El ancho del bus de datos
que se permiten es configurable segun el valor que haya en el parametro.

*/

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
