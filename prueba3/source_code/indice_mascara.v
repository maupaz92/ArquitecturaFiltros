/*


*/

module indice_mascara
#(
	parameter BITS_INDICE_MASCARA = 10
)
(
	input <port_name>,
	// 
	output <port_name>,
);




//==========================================================================		
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_grupo(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[0]),
		 .datos_entrada(datos_registros[BITS_MASCARA-1:0]),
		 .datos_salida(tamano_mascara)
		 );	
	
	defparam ff_tamano_mascara.BITS_EN_REGISTRO = BITS_MASCARA;
	
	
	
//==========================================================================		
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_tamano_mascara(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[0]),
		 .datos_entrada(datos_registros[BITS_MASCARA-1:0]),
		 .datos_salida(tamano_mascara)
		 );	
	
	defparam ff_tamano_mascara.BITS_EN_REGISTRO = BITS_MASCARA;





endmodule






