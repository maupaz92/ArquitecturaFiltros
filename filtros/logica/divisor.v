`timescale 1ns / 1ps

/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: divisor

==========================================================================
PARAMETROS

*
==========================================================================
PUERTOS FISICOS EN USO: 

*
==========================================================================
ENTRADAS: 

*datos: 64 bits de entrada, que se quieren separar

*seleccion: numero que configura las salidas de los mux, hay 4 posibles
configuraciones
==========================================================================
SALIDAS: 

*byte_1

*byte_2

*byte_3

*byte_4

*byte_5
==========================================================================
DESCRIPCION

Modulo que recibe 64 bits de datos(8 bytes) y unicamente muestra 5 bytes en la
salida. Esto porque la ventana del kernel es de 5x5, por lo que solo se ocupan
5 bytes de momento. Los 3 bytes restantes se ocultan mediante 3 multiplexores.
Se utiliza la entrada 'seleccion' para alternar entre los demas bytes ocultos
*/


module divisor(
	datos,
	seleccion,
	byte_1,
	byte_2,
	byte_3,
	byte_4,
	byte_5
    );


	input [63:0] datos;
	input [1:0] seleccion;
	
	output [7:0] byte_1;
	output [7:0] byte_2;
	output [7:0] byte_3;
	output [7:0] byte_4;
	output [7:0] byte_5;

	
	wire [2:0] configuracion_mux;

	assign byte_4 = datos[39:32];
	assign byte_5 = datos[31:24];


	deco_seleccion_byte seleccion_mux (
		 .seleccion(seleccion), 
		 .configuracion(configuracion_mux)
		 );


	mux_2_1 mux_1 (
		 .entrada_1(datos[63:56]), 
		 .entrada_2(datos[23:16]), 
		 .seleccion(configuracion_mux[0]), 
		 .salida(byte_1)
		 );
		 
	mux_2_1 mux_2 (
		 .entrada_1(datos[55:48]), 
		 .entrada_2(datos[15:8]), 
		 .seleccion(configuracion_mux[1]), 
		 .salida(byte_2)
		 );
	 
	 mux_2_1 mux_3 (
		 .entrada_1(datos[47:40]), 
		 .entrada_2(datos[7:0]), 
		 .seleccion(configuracion_mux[2]), 
		 .salida(byte_3)
    );
	 
endmodule











