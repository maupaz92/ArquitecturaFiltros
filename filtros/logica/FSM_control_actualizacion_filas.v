`timescale 1ns / 1ps



module FSM_control_actualizacion_filas(
	clk,
	reset,
	actualizar_primera_ventana,
	filas_actualizadas,
	//
	iniciar_actualizacion,
	contar_fila
    );

	input clk;
	input reset;
	input actualizar_primera_ventana;
	input filas_actualizadas;
	
	output contar_fila;
	output iniciar_actualizacion;

//=========================================================================
	 reg e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO		= 0,
		E_CAMBIO_0	= 1;


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
				if(actualizar_primera_ventana && ~filas_actualizadas)
					e_siguiente = E_CAMBIO_0;
			end
			E_CAMBIO_0: begin
				e_siguiente = E_INICIO;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end


	assign iniciar_actualizacion = (e_actual == E_CAMBIO_0);
	assign contar_fila = (e_actual == E_CAMBIO_0);


endmodule
