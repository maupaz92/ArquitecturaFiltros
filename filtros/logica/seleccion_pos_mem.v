`timescale 1ns / 1ps

/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: 

==========================================================================
PARAMETROS

* BITS_DATOS: numero de bits para guardar la cantidad de buses que quieren
utilizar la memoria
==========================================================================
PUERTOS FISICOS EN USO: 

* clk

* reset 
==========================================================================
ENTRADAS: 

* sumar: actualiza al siguiente de bus para memoria permitido

* seleccion: valor que indica cual de los dos valores se muestra en el 
resultado, ya sea el bus actual o el siguiente
==========================================================================
SALIDAS: 

* resultado: bus que puede acceder a memoria
==========================================================================
DESCRIPCION
Modulo que guarda cual es el bus de las diferentes ventanas que puede acceder
a memoria. Es controlado por el modulo 'FSM_control_pos_memoria'. Se mantiene
la posicion actual y la siguiente, esto para que haya un timing adecuado. Una vez 
que se reciba la senal de 'sumar' se debe de mostrar en el resultado el sig bus
que puede usar mem, esto no podria hacerse solo con logica secuencial, asi que
se mantiene el valor siguiente con una suma(combinacional), y la senal seleccion
es la que se encarga de cambiar adecuadamente para mostrar el valor correspondiente.
*/


module seleccion_pos_mem(
	clk,
	reset,
	sumar,
	seleccion,
	
	resultado
    );
	
	
	parameter BITS_DATOS = 1;
	localparam CANTIDAD_SUMA = 1;
	
//=========================================================================

	input clk;
	input reset;
	input sumar;
	input seleccion;
	
	output [BITS_DATOS-1:0] resultado;

//=========================================================================

	wire [BITS_DATOS-1:0] valor_siguiente;
	wire [BITS_DATOS-1:0] valor_actual;

/*
CONTEXTO
==========================================================================
guarda el # del bus que puede accerde a mem
*/	
	FlipFlopD_Habilitado reg_suma (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(sumar), 
		 .datos_entrada(valor_siguiente), 
		 //
		 .datos_salida(valor_actual)
		 );

	
	defparam reg_suma.BITS_EN_REGISTRO = BITS_DATOS;
	
/*
CONTEXTO
==========================================================================
Segun el valor de la seleccion, muestra el valor del bus actual o del sig
*/		
	mux_2_1 mux (
		 .entrada_1(valor_actual), 
		 .entrada_2(valor_siguiente), 
		 .seleccion(seleccion), 
		 .salida(resultado)
		 );
		 
	defparam mux.BITS_DATOS = BITS_DATOS;
	
	
//==========================================================================
// mantiene el valor del siguiente bus a meme
	assign valor_siguiente = valor_actual + CANTIDAD_SUMA;
	


endmodule
