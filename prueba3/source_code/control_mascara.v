/*

Las instrucciones que recibe el sistema son divididas en dos partes, 
una parte para definir a que modulo van los datos de la instruccion, la
otra son los datos.

La seleccion 

*/

module control_mascara
#(
	parameter BITS_BUS_DATOS_INSTR = 21,
	parameter BITS_BUS_DIRECCION_INSTR = 11,
	parameter BITS_DIRECCION_MEM = 10,
	parameter BITS_MASCARA = 3
)
(
	input clk,
	input reset,
	
	//entradas que trabajan con los registros internos del modulo
	//los cuales se pueden modificar de acuerdo al tipo de instruccion
	//que se este recibiendo
	input [BITS_BUS_DIRECCION_INSTR-1:0] direccion_registros,
	input [BITS_BUS_DATOS_INSTR-1:0] datos_registros,
	input habilitacion_registros,
	//
	output [BITS_DIRECCION_MEM-1:0] direccion_mem_inicio_mascara,
	// posibles valores 3|5
	output [BITS_MASCARA-1:0] tamano_mascara 
);

	

//==========================================================================		
	
	wire [BITS_DIRECCION_MEM-1:0] direccion_mem_actual;
	wire [BITS_DIRECCION_MEM-1:0] direccion_mem_anterior;
	wire cambio_direccion_mem;
	
	// senales que se usan para activar cual de los 
	// registros recibira los datos de entrada, siempre
	// y cuando el modulo en gral este hablitado
	reg [1:0] habilitacion_interna_modulos;
	

	
//==========================================================================	
	
	// por el momento solo hay dos registros disponibles para programar
	// el modulo, por lo que no se toma en cuenta el valor del segundo
	// bit de bus 'direccion_registros'
	always @(*) begin
		casex({habilitacion_registros, direccion_registros[1:0]})
			'b1x0:
				habilitacion_interna_modulos = 2'b01;
			'b1x1:
				habilitacion_interna_modulos = 2'b10;
			default:
				habilitacion_interna_modulos = 2'b0;
		endcase
	end
	
	
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


	
//==========================================================================		
	// registro que guarda la direccion de memoria
	//	del inicio de los datos de la mascara
	FlipFlopD_Habilitado ff_direccion_mem_mascara(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[1]),
		 .datos_entrada(datos_registros[BITS_DIRECCION_MEM-1:0]),
		 .datos_salida(direccion_mem_actual)
		 );	
	
	defparam ff_direccion_mem_mascara.BITS_EN_REGISTRO = BITS_DIRECCION_MEM;
	
	
	
//==========================================================================		
	// registro que en cada pulso de reloj actualiza su valor por el que tenga
	// en dicho momento 'ff_direccion_mem_mascara'
	FlipFlopD_Habilitado ff_direccion_mem_mascara_anterior(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(1'b1),
		 .datos_entrada(direccion_mem_actual),
		 .datos_salida(direccion_mem_anterior)
		 );	
	
	defparam ff_direccion_mem_mascara_anterior.BITS_EN_REGISTRO = BITS_DIRECCION_MEM;	
	
	
//==========================================================================

	//salida del modulo
	assign direccion_mem_inicio_mascara = direccion_mem_actual;

	// senal que en alto indica que hubo un cambio en la direccion de memoria
	// para recuperar los valores de la mascara, su activacion indica
	// que se va a iniciar la recuperacion de los datos de memoria, segun sea
	// el tamanno de la mascara
	assign cambio_direccion_mem = ~(direccion_mem_actual == direccion_mem_anterior);

endmodule





