/*


*/

module control_lecturas_mem_externa
#(
	parameter BITS_BUS_DATOS_INSTR = 21
)
(
	input clk,
	input reset,
	input iniciar,
	input buf_space_available,
	input [BITS_BUS_DATOS_INSTR-1:0] direccion_mem_inicio_img,
	input [BITS_BUS_DATOS_INSTR-1:0] lecturas_totales_mem,
	input lectura_mem_completada,
	
	// 
	output read_mem,
	output [BITS_BUS_DATOS_INSTR-1:0] address_mem, // el ancho de este bus puede que cambie segun la cantidad de palabras en memoria
	output save_mem_data
);

//=========================================================================
	 reg [1:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO				= 0,
		E_LECTURA			= 1,
		E_ESPERA_LECTURA	= 2,
		E_ESPERA_ESPACIO	= 3;

//==========================================================================

	wire actualizar_direccion_memoria;
	
	wire contar_lectura;
	wire continuar_lectura;
	wire [BITS_BUS_DATOS_INSTR-1:0] cantidad_lecturas;
	wire total_lecturas_completado;
	
/*
 *
==========================================================================
CONTEXTO: modulo que guarda la direccion de lectura original de memoria
y cuando se le indica, suma cierta cantidad para actualizar hacia proxima direccion
de lectura. La cantidad que se le suma a la original depende de la alineacion de la mem.
*
*/
	registro_sumador_dinamico direccion_memoria (
	 .clk(clk), 
	 .reset(reset),
	 .base(direccion_mem_inicio_img),
	 // al iniciar se guarda la direccion de entrada
	 .guardar(iniciar),
	 .sumar(actualizar_direccion_memoria),
	 .resultado(address_mem)
	);
	
	// se suma 4 porque la memoria esta alineada a 4 bytes, es de 32bits x palabra
	defparam direccion_memoria.CANTIDAD_SUMA = 4;
	defparam direccion_memoria.BITS_DATOS = BITS_BUS_DATOS_INSTR;


/*
 *
==========================================================================
CONTEXTO: modulo que mantiene cuenta de las lecturas que se han hecho a memoria.
De esta forma se podra comparar con el total de lecturas que hay que realizar, 
y se podra saber hay que terminar el proceso
*
*/
	registro_sumador contador_lecturas_memoria (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(contar_lectura),
	 .resultado(cantidad_lecturas)
	);
	
	defparam contador_lecturas_memoria.CANTIDAD_SUMA = 1;
	defparam contador_lecturas_memoria.BITS_DATOS = BITS_BUS_DATOS_INSTR;	

	
//==========================================================================	
// estado del registro
	always @(posedge clk) begin
		if(reset)
			e_actual <= E_INICIO;
		else
			e_actual <= e_siguiente;
	end

	
//==========================================================================
// siguiente estado logico. Logica Moore
	always@(*) begin		
		e_siguiente = e_actual;
		case(e_actual)			
			E_INICIO: begin
				if(iniciar)
					e_siguiente = E_LECTURA;
			end
			E_LECTURA: begin
				e_siguiente = E_ESPERA_LECTURA;
			end
			E_ESPERA_LECTURA: begin
				if(lectura_mem_completada)
					e_siguiente = E_ESPERA_ESPACIO;
			end
			E_ESPERA_ESPACIO: begin
				if(continuar_lectura)
					e_siguiente = E_LECTURA;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end
	
	
//==========================================================================
	
	assign read_mem = (e_actual == E_LECTURA);
	assign actualizar_direccion_memoria = read_mem;
	assign contar_lectura = read_mem;
	
	// pulso que indica que se han completado las lecturas a memoria 
	assign total_lecturas_completado = (cantidad_lecturas == lecturas_totales_mem);
	assign continuar_lectura = buf_space_available && ~total_lecturas_completado;
	assign save_mem_data = lectura_mem_completada;
	
	
	
endmodule







