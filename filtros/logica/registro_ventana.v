



module registro_resultado(
    clk,
	 reset,
	 habilitador,
	 datos_entrada,
	 datos_salida
    );

	 
	input clk;
	input reset;
	input [3:0] habilitador;
	input [7:0] datos_entrada;
	output [31:0] datos_salida;	
 
	wire [7:0] salida_1;
	wire [7:0] salida_2;
	wire [7:0] salida_3;
	wire [7:0] salida_4;
	
	
	
	FlipFlopD_Habilitado reg_1 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(habilitador[0]), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(salida_1)
	);
	
	defparam reg_1.BITS_EN_REGISTRO = 8;

	
	FlipFlopD_Habilitado reg_2 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(habilitador[1]), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(salida_2)
	);
	
	defparam reg_2.BITS_EN_REGISTRO = 8;
	
	
	
	FlipFlopD_Habilitado reg_3 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(habilitador[2]), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(salida_3)
	);
	
	defparam reg_3.BITS_EN_REGISTRO = 8;	
	
	
	FlipFlopD_Habilitado reg_4 (
	 .clk(clk), 
	 .reset(reset), 
	 .habilitador(habilitador[3]), 
	 .datos_entrada(datos_entrada),
	 .datos_salida(salida_4)
	);
	
	defparam reg_4.BITS_EN_REGISTRO = 8;	
	
	
	
	assign datos_salida = {salida_1, salida_2, salida_3, salida_4};
	
	
endmodule



