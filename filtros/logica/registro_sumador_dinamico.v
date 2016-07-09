`timescale 1ns / 1ps

/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: registro_sumador_dinamico

==========================================================================
PARAMETROS

*BITS_DATOS: cantidad de bits necesarios para poder guardar los datos

*CANTIDAD_SUMA: cantidad de unidades que se sumaran al registro en cada ocasion
que se indique
==========================================================================
PUERTOS FISICOS EN USO: 

*clk

*reset
==========================================================================
ENTRADAS: 

*clk

*reset

*base: valor de inicio del registro

*guardar: pulso que indica que debe de guardarse el valor de inicio y trabajar
con este valor hasta que se indique lo contrario

*sumar: pulso que indica cuando se debe de modificar el valor del registro,
por el valor actual mas el definido en el parametro CANTIDAD_SUMA
==========================================================================
SALIDAS: 

*resultado: valor que se encuentre guardado en el registro
==========================================================================
DESCRIPCION

Modulo que mantiene un valor guardado, y cuando se le indica, a este valor se 
suman una cantidad de unidades dadas por CANTIDAD_SUMA. El valor de inicio puede
ser modificado en tiempo de ejecucion

Cambiar esto
*/


module registro_sumador_dinamico(
	clk,
	reset,
	base,
	guardar,
	sumar,
	resultado
    );
	

	parameter BITS_DATOS = 18;
	parameter CANTIDAD_SUMA = 16;
	
	input clk;
	input reset;
	input sumar;
	input guardar;
	input [BITS_DATOS-1:0] base;
	
	
	//
	output [BITS_DATOS-1:0] resultado;

	
//==========================================================================
	wire [BITS_DATOS-1:0] valor_mux;
	wire [BITS_DATOS-1:0] valor_siguiente;
	

	/*
CONTEXTO
==========================================================================

*/
	mux_2_1 mux (
		 .entrada_1(valor_siguiente), 
		 .entrada_2(base), 
		 .seleccion(guardar), 
		 .salida(valor_mux)
		 );
	
	defparam mux.BITS_DATOS = BITS_DATOS;

	
/*
CONTEXTO
==========================================================================

*/	
	FlipFlopD_Habilitado reg_suma (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(sumar || guardar), 
		 .datos_entrada(valor_mux), 
		 .datos_salida(resultado)
		 );

	defparam reg_suma.BITS_EN_REGISTRO = BITS_DATOS;
	
//==========================================================================	
	assign valor_siguiente = resultado + CANTIDAD_SUMA;
	


endmodule
