/*


*/

module mascara_filtro(
	input clk,
	input reset,
	input [] tamano_mascara,
	input [] direccion_mem_mascara,
	input iniciar_lectura,
	input lectura_completada,
	// 
	output [] direccion_mem,
	output leer
);



//=========================================================================
	 reg [2:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO		= 0,
		E_1			= 1,
		E_2			= 2,
		E_3			= 3,
		E_4			= 4;
		
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
				if(iniciar_)
					e_siguiente = E_1;
			end
			E_1: begin
				e_siguiente = E_2;
			end
			E_2: begin
				e_siguiente = E_3;
			end
			E_3: begin
				e_siguiente = E_4;
			end
			E_4: begin
				e_siguiente = E_INICIO;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end





//==========================================================================	
	
	registro_sumador direcciones_memoria (
	 .clk(clk), 
	 .reset(reset), 
	 .sumar(),
	 .resultado()
	);

	defparam direcciones_memoria.INICIO_REGISTRO = 0; // o 1?
	defparam direcciones_memoria.CANTIDAD_SUMA = 1;
	defparam direcciones_memoria.BITS_DATOS = 6;



endmodule




