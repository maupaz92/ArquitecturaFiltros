/*

Modulo que presenta la interfaz simple de una cola fifo, 
pero ademas puede ser programada en caliente para aumentar
o disminuir el tamano de la cola

*/

module buffer_fifo_configurable 
#(
	parameter DATA_WIDTH = 8
)
(
	input clk,
	input reset,
	input push,
	input pop,
	input [DATA_WIDTH-1:0] data_in,
	input erase_config,
	input [2:0] configuration,
	
	
	output [DATA_WIDTH-1:0] data_out,
	output buffer_full,
	// indica que no hay una configuracion definida en el buffer
	output no_config
);



//=========================================================================
	 localparam 
		E_ESPERA_CONFIG	= 0,
		E_UN_FIFO			= 1,
		E_DOS_FIFO			= 2,
		E_TRES_FIFO			= 3,
		E_CUATRO_FIFO		= 4;
		
		
		reg [2:0] e_actual, e_siguiente;
		
		reg [3:0] subbuffer_activation;
		
		wire [3:0] buffer_fullness;
		
		
//==========================================================================	
// estado del registro
	always @(posedge clk) begin
		if(reset)
			e_actual <= E_UN_FIFO;
		else if(erase_config)
			e_actual <= E_ESPERA_CONFIG;
		else
			e_actual <= e_siguiente;
	end

//==========================================================================
// siguiente estado logico. Logica Moore
	always@(*) begin		
		e_siguiente = e_actual;
		subbuffer_activation = 4'b0000;
		case(e_actual)			
			E_ESPERA_CONFIG: begin
				case(configuration)
					1: e_siguiente = E_UN_FIFO;
					2: e_siguiente = E_DOS_FIFO;
					3: e_siguiente = E_TRES_FIFO;
					4: e_siguiente = E_CUATRO_FIFO;
				endcase
			end
			E_UN_FIFO: begin
				//e_siguiente = ;
				subbuffer_activation = 4'b0001;
			end
			E_DOS_FIFO: begin
				//e_siguiente = ;
				subbuffer_activation = 4'b0011;
			end
			E_TRES_FIFO: begin
				//e_siguiente = ;
				subbuffer_activation = 4'b0111;
			end
			E_CUATRO_FIFO: begin
				//e_siguiente = ;
				subbuffer_activation = 4'b1111;
			end
			default: begin
				e_siguiente = E_UN_FIFO;
			end
			
		endcase
	end		
	

/*
 *
FUNCION: 
==========================================================================
CONTEXTO: 
*
*/
	buffer_unidad buffer_1
	(
		.clk(clk) ,
		.reset() ,
		.data_in() ,
		.read_req() ,
		.write_req() ,
		.enable() ,
		//
		.data_out() ,
		.fifo_full(buffer_fullness[0]) ,
		.fifo_empty()
	);


	
/*
 *
FUNCION: 
==========================================================================
CONTEXTO: 
*
*/	
	mux_2_1 mux_1
	(
		.entrada_1() ,
		.entrada_2() ,
		.seleccion() ,
		.salida() 	
	);
	
	
	
/*
 *
FUNCION: 
==========================================================================
CONTEXTO: 
*
*/
	buffer_unidad buffer_2
	(
		.clk(clk) ,
		.reset() ,
		.data_in() ,
		.read_req() ,
		.write_req() ,
		.enable() ,
		//
		.data_out() ,
		.fifo_full(buffer_fullness[1]) ,
		.fifo_empty()
	);

	
/*
 *
FUNCION: 
==========================================================================
CONTEXTO: 
*
*/	
	mux_2_1 mux_2
	(
		.entrada_1() ,
		.entrada_2() ,
		.seleccion() ,
		.salida() 	
	);
	
	
/*
 *
FUNCION: 
==========================================================================
CONTEXTO: 
*
*/
	buffer_unidad buffer_3
	(
		.clk(clk) ,
		.reset() ,
		.data_in() ,
		.read_req() ,
		.write_req() ,
		.enable() ,
		//
		.data_out() ,
		.fifo_full(buffer_fullness[2]) ,
		.fifo_empty()
	);	


	
/*
 *
FUNCION: 
==========================================================================
CONTEXTO: 
*
*/	
	mux_2_1 mux_3
	(
		.entrada_1() ,
		.entrada_2() ,
		.seleccion() ,
		.salida() 	
	);
	


/*
 *
FUNCION: 
==========================================================================
CONTEXTO: 
*
*/
	buffer_unidad buffer_4
	(
		.clk(clk) ,
		.reset() ,
		.data_in() ,
		.read_req() ,
		.write_req() ,
		.enable() ,
		//
		.data_out() ,
		.fifo_full(buffer_fullness[3]) ,
		.fifo_empty()
	);



//==========================================================================	
	assign no_config = (e_actual == E_ESPERA_CONFIG);

	assign buffer_full = (subbuffer_activation == buffer_fullness);






	
endmodule



