

/*

Unidad mas pequena del buffer total. El sistema tendra a disposicion
varias unidades de este modulo para dar facilidad sobre el ancho de las 
imagenes a procesar.

El modulo cuenta con una FSM para controlar su estado (activo o inactivo), 
ademas del modulo FIFO donde se almacenaran los respectivos pixeles.

*/
module buffer_unidad(
	clk,
	reset,
	data_in,
	read_req,
	write_req,
	valor_activacion,
	//
	data_out,
	fifo_full,
	fifo_empty
);

	parameter DATA_WIDTH = 8;

//=========================================================================
	input clk;
	input reset;
	input [DATA_WIDTH-1:0] data_in;
	input read_req;
	input write_req;
	input [1:0] valor_activacion;
	//
	output [DATA_WIDTH-1:0] data_out;
	output fifo_full;
	output fifo_empty;


//=========================================================================

	 localparam 
		FSM_LIBRE	= 0,
		FSM_ACTIVA	= 1,
		FSM_NO_ACTIVA = 2;
		

//=========================================================================
	 reg [1:0] e_actual, e_siguiente;
	 
	 wire estado_buffer_actual;
	 

		
//==========================================================================	
// estado del registro
	always @(posedge clk) begin
		if(reset)
			e_actual <= FSM_LIBRE;
		else
			e_actual <= e_siguiente;
	end

//==========================================================================
// siguiente estado logico. Logica Moore
	always@(valor_activacion) begin		
		e_siguiente = e_actual;
		
		case(e_actual)
			FSM_LIBRE: begin
				if(valor_activacion == 2'b01)
					e_siguiente = FSM_ACTIVA;
				else if(valor_activacion == 2'b10)
					e_siguiente = FSM_NO_ACTIVA;
			end
			FSM_ACTIVA: begin				
			end
			FSM_NO_ACTIVA: begin
			end
			default: begin
				e_siguiente = FSM_LIBRE;
			end
			
		endcase
	end
	

	
//==========================================================================

	assign estado_buffer_actual = (e_actual == FSM_ACTIVA);
	

/*
 *
FUNCION: FIFO
==========================================================================
CONTEXTO: funcionara como un buffer para tener al alcance los pixeles necesarios
para el procesamiento
*
*/
	fifo_8w_8b	fifo_8w_8b_inst (
		.clock (clk),
		.data (data_in),
		.rdreq (),
		.sclr (reset),
		.wrreq (),
		//
		.empty (fifo_empty),
		.full (fifo_full),
		.q (data_out),
		.usedw ()
		);

	
	

endmodule




