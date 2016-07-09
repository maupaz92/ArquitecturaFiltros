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

*seleccion: numero de 0-3 que indica cual sera el codigo de configuracion
en la salida
==========================================================================
SALIDAS: 

*configuracion: codigo dependiente de la entrada
==========================================================================
DESCRIPCION
Decodificador sencillo que a partir de una entrada, difiere sus valores en 
la salida. Se utiliza para alternar entre los diferentes bytes de una linea
del kernel 5x5 mediante la entrada de seleccion de los mux. Referirse al 
diagrama de modulos para mas detalle
*/


module deco_seleccion_byte(
	seleccion,
	configuracion
    );
	 
	input [1:0] seleccion;
	output reg [2:0] configuracion;
	
	always @(*) begin
		case(seleccion)
			0:
				configuracion = 3'b000;
			1:
				configuracion = 3'b001;
			2:
				configuracion = 3'b011;
			3:
				configuracion = 3'b111;
			default:
				configuracion = 3'b000;
		endcase
	end


endmodule
