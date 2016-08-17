//`timescale 1ns / 1ps


/*
==========================================================================
NOMBRE: FlipFlopD_Habilitado

==========================================================================
PARAMETROS

*BITS_EN_REGISTRO: cantidad de bits de linea de datos

*VALOR_EN_RESET: define cual sera el valor del FF cuando se reinicia el 
funcionamiento, puede ser un 1 o 0

==========================================================================
PUERTOS FISICOS EN USO: 

* clk: reloj de la tarjeta

* reset: boton de la tarjeta

==========================================================================
ENTRADAS: 

* clk

* reset

* habilitador: pulso que en alto indica que se debe de guardar los datos
del bus 'datos_entrada'.

==========================================================================
SALIDAS: 

* datos_salida: datos que contiene el registro guardados 

==========================================================================
DESCRIPCION: implementacion de un flip flop generico. Es personalizable por
el hecho de que solo se debe de cambiar el parametro 'BITS_EN_REGISTRO' una
vez instanciado el modulo, si se quisiera aumentar el bus del registro.


*/


module FlipFlopD_Habilitado(
    clk,
	 reset,
	 habilitador,
	 datos_entrada,
	 datos_salida
    );
	 
	 parameter BITS_EN_REGISTRO = 1;
	 parameter VALOR_EN_RESET = 0;
	 input clk;
    input reset;
    input habilitador;
    input [BITS_EN_REGISTRO-1:0] datos_entrada;
    output reg [BITS_EN_REGISTRO-1:0] datos_salida;
	 
	 
	 
	 always@(posedge clk)
		begin
			
			if(reset)
				datos_salida <= VALOR_EN_RESET;
			else
				if(habilitador)
					datos_salida <= datos_entrada;
				else
					datos_salida <= datos_salida;
		end



endmodule
