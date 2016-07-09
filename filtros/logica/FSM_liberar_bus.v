`timescale 1ns / 1ps



module FSM_liberar_bus(
	clk,
	reset,
	liberar_1,
	liberar_2,
	liberar_bus,
	habilitar_siguiente
	
    );

	input clk;
	input reset;
	input liberar_1;
	input liberar_2;
	
	output liberar_bus;
	output habilitar_siguiente;

//=========================================================================
	 reg [2:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO	= 0,
		E_0		= 1,
		E_1		= 2,
		E_2		= 3,
		E_3		= 4;


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
				if(liberar_1 == 1 && liberar_2 == 1)
					e_siguiente = E_2;
				else if (liberar_1 == 1)
					e_siguiente = E_0;
				else if (liberar_2 == 1)
					e_siguiente = E_1;
			end
			E_0: begin
				if(liberar_2 == 1)
					e_siguiente = E_2;
			end
			E_1: begin
				if(liberar_1 == 1)
					e_siguiente = E_2;			
			end
			E_2: begin
				e_siguiente = E_3;
			end
			
			E_3: begin
				e_siguiente = E_INICIO;
			end
			
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end
	
	assign liberar_bus = (e_siguiente == E_2);
	assign habilitar_siguiente = (e_actual == E_3);
	
	
	

endmodule


