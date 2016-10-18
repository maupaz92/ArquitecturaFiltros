

/*

modulo que tiene a disposicion los registros en los cuales se pueden guardar las difentes
configuraciones con todo lo que tenga que ver al respecto de la ventana de la imagen. Cantidad
de buffers internos de los buffers, direccion de memoria de inicio de la imagen a procesar, entre
otros. Este modulo es accedido mediante un mapeo de memoria, ya que tiene asignado virtualmente
ciertos espacios para que puedan escribirse datos en los registros

*/


module control_ventana
#(
	parameter BITS_BUS_DATOS_INSTR = 24,
	parameter BITS_BUS_DIRECCION_INSTR = 8,
	parameter BITS_DIRECCION_MEM = 10,
	// cantidad de bits para definir los buffers a utilizar
	parameter BITS_BUFFERS = 3
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
	output [BITS_DIRECCION_MEM-1:0] direccion_mem_inicio_imagen,
	output [BITS_DIRECCION_MEM-1:0]  cantidad_lecturas_mem,
	output [BITS_BUFFERS-1:0] cantidad_buffers_internos 
);


	// senales que se usan para activar cual de los 
	// registros recibira los datos de entrada, siempre
	// y cuando el modulo en gral este hablitado
	reg [2:0] habilitacion_interna_modulos;	



//==========================================================================	
	
	always @(*) begin
		casex({habilitacion_registros, direccion_registros[1:0]})
			'b100:
				habilitacion_interna_modulos = 3'b001;
			'b101:
				habilitacion_interna_modulos = 3'b010;
			'b110:
				habilitacion_interna_modulos = 3'b100;
			default:
				habilitacion_interna_modulos = 3'b0;
		endcase
	end



//==========================================================================		
	// registro que guarda la direccion en memoria de inicio de la imagen
	FlipFlopD_Habilitado ff_direccion_mem_inicio_mem(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[0]),
		 .datos_entrada(datos_registros[BITS_DIRECCION_MEM-1:0]),
		 .datos_salida(direccion_mem_inicio_imagen)
		 );	
	
	defparam ff_direccion_mem_inicio_mem.BITS_EN_REGISTRO = BITS_DIRECCION_MEM;

	
	
//==========================================================================		
	// registro que guarda la cantidad de lecturas a memoria
	// el valor que ingrese contempla la alineacion de la memoria
	FlipFlopD_Habilitado ff_cantidad_lecturas_memoria(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[1]),
		 .datos_entrada(datos_registros[BITS_DIRECCION_MEM-1:0]),
		 .datos_salida(cantidad_lecturas_mem)
		 );	
	
	// la cantidad de bits debe de definirse mejor
	defparam ff_cantidad_lecturas_memoria.BITS_EN_REGISTRO = BITS_DIRECCION_MEM;
	
	
//==========================================================================		
	// registro que guarda la cantidad de buffers internos del buffer configurable
	// que se van a usar. Por ejemplo 2 buffer para imagen de 512 columnas
	// o 4 buffers internos para imagen de 1024 columnas 
	FlipFlopD_Habilitado ff_buffers_internos(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_interna_modulos[2]),
		 .datos_entrada(datos_registros[BITS_BUFFERS-1:0]),
		 .datos_salida(cantidad_buffers_internos)
		 );	
	
	// la cantidad de bits debe de definirse mejor
	defparam ff_buffers_internos.BITS_EN_REGISTRO = BITS_BUFFERS;	
	
	

/*

como inicio?????

*/



endmodule

