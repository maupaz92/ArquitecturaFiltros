/*


*/

module sumador_restador
#(
	parameter BITS_VALOR = 2	
)
(
	input clk,
	input reset,
	input actualizar,
	input operacion, // 1 suma, 0 resta
	// 
	output [BITS_VALOR-1:0] valor_actual,
);
//=========================================================================

	wire [BITS_VALOR-1:0] posible_valor;


//=========================================================================	
	FlipFlopD_Habilitado ff_valor (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(actualizar), 
		 .datos_entrada(posible_valor),
		 .datos_salida(valor_actual)
		);
		
	defparam ff_valor.BITS_EN_REGISTRO = BITS_VALOR;	

//=========================================================================	
	
	// si el valor de la entrada operacion es 1, se suma al total, si es cero, se resta
	assign posible_valor = (operacion == 1) ? valor_actual + 1 : valor_actual - 1;


endmodule







