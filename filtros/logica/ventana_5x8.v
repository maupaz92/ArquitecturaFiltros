`timescale 1ns / 1ps

/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: ventana_5x8

==========================================================================
PARAMETROS

*
==========================================================================
PUERTOS FISICOS EN USO: 

*
==========================================================================
ENTRADAS: 

*
==========================================================================
SALIDAS: 

*
==========================================================================
DESCRIPCION

*/


module ventana_5x8(
	clk,
	reset,
	guardar,
	datos_entrada,
	fila_1,
	fila_2,
	fila_3,
	fila_4,
	fila_5
    );

	input clk;
	input reset;
	input guardar;
	input [63:0] datos_entrada;
	output [63:0] fila_1;
	output [63:0] fila_2;
	output [63:0] fila_3;
	output [63:0] fila_4;
	output [63:0] fila_5;

//==========================================================================
	wire [4:0] registro_siguiente;
	wire [4:0] registro_actual;
	
/*
CONTEXTO
==========================================================================
Guarda cual es el registro que debe de habilitarse para guardar el numero de 
entrada. cuando se hace reset su valor predeterminado es 00001: Esto para iniciar
con la habilitacion del primero. Son 5 bits para 5 registros. 
*/	
	FlipFlopD_Habilitado reg_actual (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(guardar), 
	 .datos_entrada(registro_siguiente),
	 .datos_salida(registro_actual)
	);
	
	defparam reg_actual.BITS_EN_REGISTRO = 5;
	defparam reg_actual.VALOR_EN_RESET = 1;

/*
CONTEXTO
==========================================================================
Prepara la habilitacion del siguiente registro al desplazar un bit a la izq
de la habilitacion del registro actual. De 5 bits para manejar los 5 registros
*/	
	shift_bits_left shift_siguiente (
		 .entrada(registro_actual), 
		 .salida(registro_siguiente)
		 );
	
	//defparam shift_siguiente.BITS_DATOS = 5;


	
/*
CONTEXTO
==========================================================================
Registro para guardar un byte de datos.
*/	
	FlipFlopD_Habilitado reg_fila_1 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(registro_actual[0] && guardar), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(fila_1)
	);
	
	defparam reg_fila_1.BITS_EN_REGISTRO = 64;


/*
CONTEXTO
==========================================================================
Registro para guardar un byte de datos.
*/	
	FlipFlopD_Habilitado reg_fila_2 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(registro_actual[1] && guardar), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(fila_2)
	);
	
	defparam reg_fila_2.BITS_EN_REGISTRO = 64;

/*
CONTEXTO
==========================================================================
Registro para guardar un byte de datos.
*/	
	FlipFlopD_Habilitado reg_fila_3 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(registro_actual[2] && guardar), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(fila_3)
	);
	
	defparam reg_fila_3.BITS_EN_REGISTRO = 64;
	
	
/*
CONTEXTO
==========================================================================
Registro para guardar un byte de datos.
*/	
	FlipFlopD_Habilitado reg_fila_4 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(registro_actual[3] && guardar), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(fila_4)
	);
	
	defparam reg_fila_4.BITS_EN_REGISTRO = 64;
	
	
	
/*
CONTEXTO
==========================================================================
Registro para guardar un byte de datos.
*/	
	FlipFlopD_Habilitado reg_fila_5 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(registro_actual[4] && guardar), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(fila_5)
	);
	
	defparam reg_fila_5.BITS_EN_REGISTRO = 64;


endmodule



















