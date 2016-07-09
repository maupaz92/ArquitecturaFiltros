`timescale 1ns / 1ps

/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: 

==========================================================================
PARAMETROS

*
==========================================================================
PUERTOS FISICOS EN USO: 

*
==========================================================================
ENTRADAS: 

*entrada: bits que se quieren desplazar a la izq
==========================================================================
SALIDAS: 

*salida: 
==========================================================================
DESCRIPCION

*/

module shift_bits_left(
	entrada,
	salida
    );
	
	input  [4:0] entrada;
	output [4:0] salida;
	
	assign salida = {entrada[3],entrada[2],entrada[1],entrada[0],entrada[4]};
	
	
endmodule
