/*


*/

module program_counter #(
	parameter TAMANO_INSTRUCCION = 32,
	parameter BITS_DIRECCION_MEMORIA = 14
)
(
	input clk,
	input reset,
	input iniciar,
	input reiniciar,
	input lectura_completada,
	input [TAMANO_INSTRUCCION-1:0] instruccion_actual,
	// 
	output leer_siguiente_inst,
	output [BITS_DIRECCION_MEMORIA-1:0] direccion_siguiente_inst
);



//=========================================================================
	reg [2:0] e_actual, e_siguiente;
	 
	localparam 
		E_INICIO				= 0,
		E_LEER_INST			= 1,
		E_ESPERA_LECTURA	= 2,
		E_VERIFICACION		= 3,
		E_FINAL				= 4;
		
		
	wire actualizar_direccion_memoria;
		
		
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
					e_siguiente = E_LEER_INST;
			end
			E_LEER_INST: begin
				e_siguiente = E_ESPERA_LECTURA;
			end
			E_ESPERA_LECTURA: begin
				if(lectura_completada)
					e_siguiente = E_VERIFICACION;
			end
			E_VERIFICACION: begin
				if(instruccion_actual == 32'hffff_ffff)
					e_siguiente = E_FINAL;
				else
					e_siguiente = E_LEER_INST;
			end
			E_FINAL: begin
				if(reiniciar)
					e_siguiente = E_INICIO;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end	

	
	
	/*
	 *
	==========================================================================
	CONTEXTO: registro que mantiene la direccion de memoria a la cual se va
	a leer la proxima instruccion
	*
	*/
	registro_sumador registro_direccion_mem_inst (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(actualizar_direccion_memoria),
	 .resultado(direccion_siguiente_inst)
	);
	
	// suma de 4 unidades para correr bytes, memoria alineada a 32 bits
	defparam registro_direccion_mem_inst.CANTIDAD_SUMA = 4;
	defparam registro_direccion_mem_inst.BITS_DATOS = BITS_DIRECCION_MEMORIA;	
	

//==========================================================================

	assign actualizar_direccion_memoria = (e_actual == E_VERIFICACION);
	assign leer_siguiente_inst = (e_actual == E_LEER_INST);
	
	

endmodule






