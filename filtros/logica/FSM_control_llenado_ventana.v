`timescale 1ns / 1ps



module FSM_control_llenado_ventana(
	clk,
	reset,
	iniciar,
	filas_obtenidas,
	actualizar_ventana,
	dato_leido_disponible,
	
	actualizar_pos_mem,
	aumentar_conteo_filas,
	guardar_fila,
	liberar_bus_mem,
	leer_dato
	//ventana_completa
 );
	 
	 input clk;
	 input reset;
	 input iniciar;
	 input filas_obtenidas;
	 input actualizar_ventana;
	 input dato_leido_disponible;
	 
	 output aumentar_conteo_filas;
	 output guardar_fila;
	 output actualizar_pos_mem;
	 output liberar_bus_mem;
	 //output ventana_completa;
	 output leer_dato;

//=========================================================================
	 

	 reg [3:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO = 0,
		E_1 		= 1,
		E_2 		= 2,
		E_3 		= 3,
		E_4		= 4,
		E_5		= 5;

		

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
					e_siguiente = E_1;
			end
			
			E_1: begin
				e_siguiente = E_2;
			end
			
			E_2: begin
				if(dato_leido_disponible)
					e_siguiente = E_3;
			end			
			E_3: begin
				if(filas_obtenidas)
					e_siguiente = E_4;
				else
					e_siguiente = E_1;
			end			
			E_4: begin
				e_siguiente = E_5;
			end
			E_5: begin
				if(actualizar_ventana)
					e_siguiente = E_1;
			end		

			
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end
	



//==========================================================================
// salidas moore

	assign leer_dato = (e_actual == E_1);

	assign liberar_bus_mem = (e_siguiente == E_4);
	
	//assign ventana_completa = (e_actual == E_4) ;

	assign guardar_fila = (e_siguiente == E_3);
	
	assign actualizar_pos_mem = (e_siguiente == E_3);
		
	assign aumentar_conteo_filas = (e_siguiente == E_3) && (~filas_obtenidas);

endmodule


