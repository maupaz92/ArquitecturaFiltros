module FSM_inicar_proceso(
	clk,
	reset,
	boton_1,
	boton_2,
	iniciar
    );

	input clk;
	input reset;
	input boton_1;
	input boton_2;
	
	output iniciar;

//=========================================================================
	 reg [2:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO		= 0,
		E_1			= 1,
		E_2			= 2,
		E_3			= 3;
		
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
				if(boton_1)
					e_siguiente = E_1;
			end
			E_1: begin
				e_siguiente = E_2;
			end
			E_2: begin
				if(boton_2)
					e_siguiente = E_INICIO;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end


	assign iniciar = (e_actual == E_1);
		
endmodule
