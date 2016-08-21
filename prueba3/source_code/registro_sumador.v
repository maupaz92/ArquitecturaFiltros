`timescale 1ns / 1ps

/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: 

==========================================================================
PARAMETROS

*INICIO_REGISTRO: valor en el que debe de iniciar el registro cuando se
haga un reset. 
==========================================================================
PUERTOS FISICOS EN USO: 

*clk

*reset
==========================================================================
ENTRADAS: 

*clk

*reset

*sumar: pulso que indica cuando se debe de modificar el valor del registro,
por el valor actual mas 16 unidades
==========================================================================
SALIDAS: 

*resultado: valor que se encuentre guardado en el registro
==========================================================================
DESCRIPCION
Modulo que mantiene un valor guardado, y cuando se le indica, a este valor se 
le suman 16 unidades. Se usan 16 unidades por la forma en la que se definio la 
memoria. 0-16-32-48... cada 16 posiciones inicia una nueva fila de la imagen.
Ya que una fila se compone de 16 posicion de memoria de 64 bits, lo q da 128bytes,
para una imagen de 512

Cambiar esto
*/


module registro_sumador(
	clk,
	reset,
	sumar,
	resultado
    );
	
	parameter INICIO_REGISTRO = 0;
	parameter BITS_DATOS = 11;
	parameter CANTIDAD_SUMA = 16;
	
	input clk;
	input reset;
	input sumar;
	output [BITS_DATOS-1:0] resultado;


	wire [BITS_DATOS-1:0] valor_siguiente;

/*
CONTEXTO
==========================================================================

*/	
	FlipFlopD_Habilitado reg_suma (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(sumar), 
		 .datos_entrada(valor_siguiente), 
		 .datos_salida(resultado)
		 );

	defparam reg_suma.VALOR_EN_RESET = INICIO_REGISTRO;
	defparam reg_suma.BITS_EN_REGISTRO = BITS_DATOS;
	
//==========================================================================	
	assign valor_siguiente = resultado + CANTIDAD_SUMA;
	


endmodule
