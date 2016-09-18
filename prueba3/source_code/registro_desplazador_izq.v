
/*

modulo que se encarga de hacer un corrimiento de los datos que mantiene en el registro
interno. El valor de inicio de dicho registro puede cambiar al configurar el parametro
'INICIO_REG'.

*/


module registro_desplazador_izq
#(
	parameter BITS_DATOS = 5,
	parameter INICIO_REG = 1
)
(
	input clk,
	input reset,
	input desplazar,
	output [BITS_DATOS-1:0] resultado
);
	
	wire [BITS_DATOS-1:0] valor_siguiente;
		
/*
CONTEXTO
==========================================================================

*/	
	FlipFlopD_Habilitado registro (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(desplazar), 
		 .datos_entrada(valor_siguiente), 
		 .datos_salida(resultado)
		 );

	defparam registro.BITS_EN_REGISTRO = BITS_DATOS;
	defparam registro.VALOR_EN_RESET = INICIO_REG;
	
//==========================================================================	
	assign valor_siguiente = resultado << 1;
	


endmodule









