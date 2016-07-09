`timescale 1ns / 1ps

/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: comparador_num_mayor

==========================================================================
PARAMETROS

*BITS_NUMERO cantidad de bits que tendran los numeros que se estan comparando
==========================================================================
PUERTOS FISICOS EN USO: 

==========================================================================
ENTRADAS: 

*entrada_1: numero que se va a comparar

*entrada_2: numero que se va a comparar
==========================================================================
SALIDAS: 

*mayor: numero que sea mayor en magnitud entre los dos numeros de entrada.
==========================================================================
DESCRIPCION

Modulo combinacional que se encarga de determinar cual es el mayor de dos numeros. 
En caso de igualdad se escoge arbitrariamente.
*/


module comparador_num_mayor(
	entrada_1,
	entrada_2,
	mayor
    );

	parameter BITS_NUMERO = 8;
	
	input [BITS_NUMERO-1:0] entrada_1;
	input [BITS_NUMERO-1:0] entrada_2;
	output [BITS_NUMERO-1:0] mayor;
	
	assign mayor = entrada_1 > entrada_2 ? entrada_1 : entrada_2;

endmodule