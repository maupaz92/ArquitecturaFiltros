`timescale 1ns / 1ps



//module FSM_control_pixeles(
//	clk,
//	reset,
//	iniciar_cambio,
//	guardar_dato,
//	valor_pixel
//    );
//
//	input clk;
//	input reset;
//	input iniciar_cambio;
//	
//	output reg [4:0] guardar_dato;
//	output reg [1:0] valor_pixel;
//
////=========================================================================
//	 reg [2:0] e_actual, e_siguiente;
//	 
//	 localparam 
//		E_INICIO		= 0,
//		E_CAMBIO_0	= 1,
//		E_CAMBIO_1	= 2,
//		E_CAMBIO_2	= 3,
//		E_CAMBIO_3	= 4;
//
//
////==========================================================================	
//// estado del registro: ACTIVO EN BAJO
//	always @(negedge clk) begin
//		if(reset)
//			e_actual <= E_INICIO;
//		else
//			e_actual <= e_siguiente;
//	end
//
////==========================================================================
//// siguiente estado logico. Logica Moore
//	always@(*) begin
//		
//		e_siguiente = e_actual;
//		valor_pixel = 0;
//		guardar_dato = 5'b10000;
//		case(e_actual)			
//			E_INICIO: begin
//				if(iniciar_cambio)
//					e_siguiente = E_CAMBIO_0;
//			end
//			E_CAMBIO_0: begin
//				e_siguiente = E_CAMBIO_1;
//				guardar_dato = 5'b00001;
//			end
//			E_CAMBIO_1: begin
//				e_siguiente = E_CAMBIO_2;
//				valor_pixel = 1;
//				guardar_dato = 5'b00010;
//			end
//			E_CAMBIO_2: begin
//				e_siguiente = E_CAMBIO_3;
//				valor_pixel = 2;
//				guardar_dato = 5'b00100;
//			end
//			E_CAMBIO_3: begin
//				e_siguiente = E_INICIO;
//				valor_pixel = 3;
//				guardar_dato = 5'b01000;
//			end
//			default: begin
//				e_siguiente = E_INICIO;
//			end
//			
//		endcase
//	end
//
//endmodule



module FSM_control_pixeles(
	clk,
	reset,
	iniciar_cambio,
	guardar_dato,
	valor_pixel
    );

	input clk;
	input reset;
	input iniciar_cambio;
	
	output reg [3:0] guardar_dato;
	output reg [1:0] valor_pixel;

//=========================================================================
	 reg [2:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO		= 0,
		E_CAMBIO_0	= 1,
		E_CAMBIO_1	= 2,
		E_CAMBIO_2	= 3,
		E_CAMBIO_3	= 4;


//==========================================================================	
// estado del registro: ACTIVO EN BAJO
	always @(negedge clk) begin
		if(reset)
			e_actual <= E_INICIO;
		else
			e_actual <= e_siguiente;
	end

//==========================================================================
// siguiente estado logico. Logica Moore
	always@(*) begin
		
		e_siguiente = e_actual;
		valor_pixel = 0;
		guardar_dato = 4'b0000;
		case(e_actual)			
			E_INICIO: begin
				if(iniciar_cambio)
					e_siguiente = E_CAMBIO_0;
			end
			E_CAMBIO_0: begin
				e_siguiente = E_CAMBIO_1;
				guardar_dato = 4'b0001;
			end
			E_CAMBIO_1: begin
				e_siguiente = E_CAMBIO_2;
				valor_pixel = 1;
				guardar_dato = 4'b0010;
			end
			E_CAMBIO_2: begin
				e_siguiente = E_CAMBIO_3;
				valor_pixel = 2;
				guardar_dato = 4'b0100;
			end
			E_CAMBIO_3: begin
				e_siguiente = E_INICIO;
				valor_pixel = 3;
				guardar_dato = 4'b1000;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end

endmodule






