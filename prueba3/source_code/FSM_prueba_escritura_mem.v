

module FSM_prueba_escritura_mem
#(
	parameter ADDRESS_BITS = 18,
	parameter DATA_BITS = 64
)
(
	input clk,
	input reset,
	input iniciar_prueba,
	input operacion_completada,
	input [DATA_BITS-1:0] datos_leidos,
	//
	output leer,
	output escribir,
	output [DATA_BITS-1:0] datos_por_escribir,
	output [ADDRESS_BITS-1:0] direccion_memoria
	
    );


//=========================================================================
	 reg [2:0] e_actual, e_siguiente;
	 
	 wire guardar_datos_leidos;
	 wire [DATA_BITS-1:0] datos_mem_guardados;
	 wire actualizar_direccion_mem;
	 
	 localparam 
		E_INICIO				= 0,
		E_LECTURA			= 1,
		E_ESPERA_LECTURA	= 2,
		E_OPERACION_1		= 3,
		E_ESCRIBIR			= 4,
		E_ESPERA_ESCRITURA= 5,
		E_FINAL				= 6;
		
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
				if(iniciar_prueba)
					e_siguiente = E_LECTURA;
			end
			E_LECTURA: begin
				e_siguiente = E_ESPERA_LECTURA;
			end
			E_ESPERA_LECTURA: begin
				if(operacion_completada) begin
					e_siguiente = E_OPERACION_1;
				end
			end
			E_OPERACION_1: begin				
				e_siguiente = E_ESCRIBIR;
			end
			E_ESCRIBIR: begin
				e_siguiente = E_ESPERA_ESCRITURA;
			end
			E_ESPERA_ESCRITURA: begin
				if(operacion_completada)
					e_siguiente = E_FINAL;
			end
			E_FINAL: begin
				
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
	 .resultado(direccion_memoria)
	);

	defparam direcciones_memoria.INICIO_REGISTRO = 131_072;
	defparam direcciones_memoria.CANTIDAD_SUMA = 8;
	defparam direcciones_memoria.BITS_DATOS = 18;	
	
//==========================================================================		
	
	FlipFlopD_Habilitado ff_datos(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(guardar_datos_leidos),
		 .datos_entrada(datos_leidos),
		 .datos_salida(datos_mem_guardados)
		 );	
	
	defparam ff_datos.BITS_EN_REGISTRO = DATA_BITS;	

//==========================================================================	

	assign leer = (e_actual == E_LECTURA);
	assign escribir = (e_actual == E_ESCRIBIR);
	assign guardar_datos_leidos = (e_siguiente == E_OPERACION_1);
	assign actualizar_direccion_mem = (e_actual == E_OPERACION_1);
	assign datos_por_escribir = datos_mem_guardados + 1;
	
		
endmodule



































