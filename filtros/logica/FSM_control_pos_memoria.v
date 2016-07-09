`timescale 1ns / 1ps


/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: 

==========================================================================
PARAMETROS

*
==========================================================================
PUERTOS FISICOS EN USO: 

* clk

* reset
==========================================================================
ENTRADAS: 

* cambio_pos: senal que indica cuando actualizar la seleccion del bus de 
memoria

* clk

* reset
==========================================================================
SALIDAS: 

* habilitar_cambio: senal que en alto indica que el bus de memoria puede
actualizarse

* posicion: senal que determina cual debe ser la salida para seleccionar
el bus de memoria
==========================================================================
DESCRIPCION
FSM que controla la actualizacion y seleccion de cual ventana tendra el bus
de memoria para poder obtener datos de la misma.
*/


module FSM_control_pos_memoria(
	clk,
	reset,
	cambio_pos,
	//
	habilitar_cambio,
	posicion
    );
	 
	input clk;
	input reset;
	input cambio_pos;
	
	output habilitar_cambio;
	output posicion;
	
//=========================================================================
	 reg e_actual, e_siguiente;	
	 
	 localparam 
		E_1 		= 0,
		E_2 		= 1;
	 

//==========================================================================	
// estado del registro
	always @(posedge clk) begin
		if(reset)
			e_actual <= E_1;
		else
			e_actual <= e_siguiente;
	end


//==========================================================================
// siguiente estado logico. Logica Moore
	always@(*) begin
		
		e_siguiente = e_actual;
		
		case(e_actual)
			
			E_1: begin
				if(cambio_pos)
					e_siguiente = E_2;
			end			
			E_2: begin				
				e_siguiente = E_1;
			end
			default: begin
				e_siguiente = E_1;
			end
			
		endcase
	end
	
//==========================================================================
	assign posicion = (e_actual == E_2 || e_siguiente == E_2) ? 1 : 0;
	assign habilitar_cambio = (e_actual == E_2);
	 

endmodule






