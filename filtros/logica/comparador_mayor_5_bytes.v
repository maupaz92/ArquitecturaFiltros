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

*byte_1: numero de 8 bits

*byte_2: numero de 8 bits

*byte_3: numero de 8 bits

*byte_4: numero de 8 bits

*byte_5: numero de 8 bits

==========================================================================
SALIDAS: 

*byte_mayor: numero de 8 bits que sea mayor entre todas las comparaciones.
==========================================================================
DESCRIPCION

Modulo que instancia 4 comparadores para lograr comparar 5 numeros. Se retorna
el numero de mayor magnitud
*/


module comparador_mayor_5_bytes(

	byte_1,
	byte_2,
	byte_3,
	byte_4,
	byte_5,
	byte_mayor
    );

	input [7:0] byte_1;
	input [7:0] byte_2;
	input [7:0] byte_3;
	input [7:0] byte_4;
	input [7:0] byte_5;
	output [7:0] byte_mayor;
	
	wire [7:0] mayor_1;
	wire [7:0] mayor_2;
	wire [7:0] mayor_3;
	
	comparador_num_mayor comparador_1 (
    .entrada_1(byte_1), 
    .entrada_2(byte_2), 
    .mayor(mayor_1)
    );
	 
	 comparador_num_mayor comparador_2 (
    .entrada_1(byte_3), 
    .entrada_2(byte_4), 
    .mayor(mayor_2)
    );
	 
	 comparador_num_mayor comparador_3 (
    .entrada_1(mayor_1), 
    .entrada_2(mayor_2), 
    .mayor(mayor_3)
    );
	 
	 comparador_num_mayor comparador_4 (
    .entrada_1(mayor_3), 
    .entrada_2(byte_5), 
    .mayor(byte_mayor)
    );

endmodule




