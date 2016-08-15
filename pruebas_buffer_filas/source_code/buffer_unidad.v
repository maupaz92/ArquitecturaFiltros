

/*

Unidad mas pequena del buffer total. El sistema tendra a disposicion
varias unidades de este modulo para dar facilidad sobre el ancho de las 
imagenes a procesar.

El modulo cuenta con una FSM para controlar su estado (activo o inactivo), 
ademas del modulo FIFO donde se almacenaran los respectivos pixeles.

*/
module buffer_unidad
#(
	parameter DATA_WIDTH = 8,
	parameter BITS_FOR_DATA = 3
)
(
	input clk,
	input reset,
	input [DATA_WIDTH-1:0] data_in,
	input read_req,
	input write_req,
	input write_en,
	input read_en,
	//
	output [DATA_WIDTH-1:0] data_out,
	output fifo_full,
	output fifo_empty,
	output [BITS_FOR_DATA-1:0] data_in_buffer,
	output buffer_change
);




//=========================================================================

	wire inter_read_req;
	wire inter_write_req;
	wire [BITS_FOR_DATA-1:0] data_on_buffer;
	wire [BITS_FOR_DATA-1:0] previous_data_on_buffer;
	
	
	assign inter_read_req = read_en & read_req;
	assign inter_write_req = write_en & write_req;
	assign data_in_buffer = data_on_buffer;
	assign buffer_change = ~(data_on_buffer == previous_data_on_buffer);
	

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
		.rdreq (inter_read_req),
		.sclr (reset),
		.wrreq (inter_write_req),
		//
		.empty (fifo_empty),
		.full (fifo_full),
		.q (data_out),
		.usedw (data_on_buffer)
		);

		
		
	FlipFlopD_Habilitado registro_cambio (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(1'b1), 
		 .datos_entrada(data_on_buffer),
		 .datos_salida(previous_data_on_buffer)
		);
		
	defparam registro_cambio.BITS_EN_REGISTRO = BITS_FOR_DATA;
	
	

endmodule




