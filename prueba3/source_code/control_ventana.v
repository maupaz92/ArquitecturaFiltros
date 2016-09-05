


module control_ventana
#(
	parameter BITS_BUS_DATOS_INSTR = 21,
	parameter BITS_BUS_DIRECCION_INSTR = 11, 
	parameter BITS_BUFFERS_IMAGEN = 3;
)
(
	input clk,
	input reset,
	// direccion al registro del modulo que se quiere escribir
	input [BITS_BUS_DIRECCION_INSTR-1:0] direccion_registros,
	// datos que se van a escribir a algun registro del modulo
	// la seleccion del registro dada por la direccion
	input [BITS_BUS_DATOS_INSTR-1:0] datos_registros,
	// pulso que habilita los registros internos para escritura
	input habilitacion_registros,

	
	//
	output [BITS_BUS_DATOS_INSTR-1:0] direccion_mem_inicio_imagen,
	output [BITS_BUS_DATOS_INSTR-1:0]  cantidad_lecturas_mem,
	output [BITS_BUFFERS_IMAGEN-1:0] cantidad_buffers_internos 
);

	



//==========================================================================	
	
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
	// registro que guarda la direccion en memoria de inicio de la imagen
	FlipFlopD_Habilitado ff_direccion_mem_inicio_mem(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[0]),
		 .datos_entrada(datos_registros),
		 .datos_salida(direccion_mem_inicio_imagen)
		 );	
	
	defparam ff_direccion_mem_inicio_mem.BITS_EN_REGISTRO = BITS_BUS_DATOS_INSTR;

	
	
//==========================================================================		
	// registro que guarda la cantidad de lecturas a memoria
	// el valor que ingrese contempla la alineacion de la memoria
	FlipFlopD_Habilitado ff_cantidad_lecturas_memoria(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[0]),
		 .datos_entrada(datos_registros),
		 .datos_salida(cantidad_lecturas_mem)
		 );	
	
	// la cantidad de bits debe de definirse mejor
	defparam ff_cantidad_lecturas_memoria.BITS_EN_REGISTRO = BITS_BUS_DATOS_INSTR;
	
	
//==========================================================================		
	// registro que guarda la cantidad de buffers internos del buffer configurable
	// que se van a usar. Por ejemplo 2 buffer para imagen de 512 columnas
	// o 4 buffers internos para imagen de 1024 columnas 
	FlipFlopD_Habilitado ff_buffers_internos(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[0]),
		 .datos_entrada(datos_registros[BITS_BUFFERS_IMAGEN-1:0]),
		 .datos_salida(cantidad_buffers_internos)
		 );	
	
	// la cantidad de bits debe de definirse mejor
	defparam ff_columnas_imagen.BITS_EN_REGISTRO = BITS_BUFFERS_IMAGEN;	
	
	

/*

como inicio?????

*/





