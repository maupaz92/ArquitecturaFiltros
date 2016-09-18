/*

MOdulo que instancia varios modulos 'buffer_unidad', y tiene la logica
necesaria para poder encender/apagar los buffer y trabajar con los que se 
desee. De esta forma se simula un buffer FIFO de tamano variable, ya que 
depende la cantidad de unidad de buffer que tenga encendidas. Dicha configuracion
puede ser modificada en caliente, no es necesario re-configurar el sistema.

Antes de cada modulo buffer hay un mux que funciona para direccionar los datos
que entren a los buffers. Ya que cuando hayan ingresos se tiene que agregar al 
buffer que este menos lleno, y cuando haya una lectura, los datos de los buffers
anteriores deben de pasar a los buffers siguientes, para que sigan el orden
de FIFO.


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
	input save_config,
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
		
	localparam
		E_INGRESO_DATOS	= 0,
		E_RETORNAR_DATOS	= 1;
		
	// constante que define la cantidad de sub buffers
	localparam BUFFERS = 4;
	
	reg [2:0] e_actual, e_siguiente;
	reg e_actual_minor1, e_siguiente_minor1;
	
	reg [BUFFERS-1:0] subbuffer_activation;
	
	// 
	reg [BUFFERS-1:0] write_buff_enable;
	
	wire [BUFFERS-1:0] buffer_fullness;
	
	wire [DATA_WIDTH-1:0] data_buff4_out;
	wire [DATA_WIDTH-1:0] data_buff3_out;
	wire [DATA_WIDTH-1:0] data_buff2_out;
	
	wire [DATA_WIDTH-1:0] data_mux3_out;
	wire [DATA_WIDTH-1:0] data_mux2_out;
	wire [DATA_WIDTH-1:0] data_mux1_out;
	
	wire data_selection;
	wire push_intern;
	
	wire buffer4_data_change;
	wire buffer3_data_change;
	wire buffer2_data_change;
		
//==========================================================================	
// estado del registro
	always @(posedge clk) begin
		if(reset) begin
			e_actual <= E_ESPERA_CONFIG;
			e_actual_minor1 <= E_INGRESO_DATOS;
		end else begin
			e_actual <= e_siguiente;
			e_actual_minor1 <= e_siguiente_minor1;
		end
	end

//==========================================================================
// siguiente estado logico. Logica Moore
	always@(*) begin		
		e_siguiente = e_actual;
		subbuffer_activation = 4'bz;
		case(e_actual)			
			
			E_ESPERA_CONFIG: begin
				if(save_config) begin
					case(configuration)
						1: e_siguiente = E_UN_FIFO;
						2: e_siguiente = E_DOS_FIFO;
						3: e_siguiente = E_TRES_FIFO;
						4: e_siguiente = E_CUATRO_FIFO;
						default: e_siguiente = e_actual;
					endcase
				end
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
				e_siguiente = E_ESPERA_CONFIG;
			end
			
		endcase
	end		
	
	
	always@(*) begin
		e_siguiente_minor1 = e_actual_minor1;
		case(e_actual_minor1)
			E_INGRESO_DATOS: begin
				if(pop)
					e_siguiente_minor1 = E_RETORNAR_DATOS;
			end
			E_RETORNAR_DATOS: begin
				e_siguiente_minor1 = E_INGRESO_DATOS;
			end
			default: begin
				e_siguiente_minor1 = E_INGRESO_DATOS;
			end
		endcase
	end
	
	
	//==========================================================================
	/*
	segun el llenado de los buffers, asi sera seleccionado el buffer al cual ira un push.
	'buffer_fullnes' tiene un bit por cada buffer, y cada bit es alto cuando dicho buffer
	esta lleno. conforme se van llenando los buffers del 1 al 4, asi cambiara la habilitacion
	para ingresar datos a los diferentes buffers.
	
	hay un caso especial, cuando ocurre un pop, dicha signal llega a todos los subbuffers activos,
	si hay salida de datos de los mismos, indica que 'buffer_fullness' sera cero, y el push que
	se debe de hacer siguiente a un pop debe tener una habilitacion de buffer especial. De esta forma
	un pulso de reloj despues de un pop, se hace un shift right de la signal de activacion, en conjunto
	con la logica de cambio del buffer anterior, esto determina cual de los buffers despues de un 
	pop, tendra habilitado la signal de push
	*/
	always@(*) begin
		case(buffer_fullness)
			0:
				write_buff_enable = 
					(e_actual_minor1 == E_RETORNAR_DATOS) ? (subbuffer_activation >> 1) : 4'b0001;
			1:
				write_buff_enable = 4'b0010;
			3:
				write_buff_enable = 4'b0100;
			7:
				write_buff_enable = 4'b1000;
			15:
				write_buff_enable = 4'b0000;
				
			default:
				write_buff_enable = 4'b0000;
		endcase
	end
	

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
		.reset(reset) ,
		.data_in(data_in) ,
		.read_req(pop) ,
		.write_req(push || push_intern) ,
		.read_en(subbuffer_activation[3]) ,
		.write_en(write_buff_enable[3]),
		//
		.data_out(data_buff4_out) ,
		.fifo_full(buffer_fullness[3]) ,
		.fifo_empty(),
		.data_in_buffer(),
		.buffer_change(buffer4_data_change)
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
		.entrada_1(data_in) ,
		.entrada_2(data_buff4_out) ,
		.seleccion(data_selection) ,
		.salida(data_mux3_out) 	
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
		.reset(reset) ,
		.data_in(data_mux3_out) ,
		.read_req(pop) ,
		.write_req(push || (push_intern && buffer4_data_change) ) ,
		.read_en(subbuffer_activation[2]) ,
		.write_en(write_buff_enable[2]),
		//
		.data_out(data_buff3_out) ,
		.fifo_full(buffer_fullness[2]) ,
		.fifo_empty(),
		.data_in_buffer(),
		.buffer_change(buffer3_data_change)
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
		.entrada_1(data_in) ,
		.entrada_2(data_buff3_out) ,
		.seleccion(data_selection) ,
		.salida(data_mux2_out) 	
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
		.reset(reset) ,
		.data_in(data_mux2_out) ,
		.read_req(pop) ,
		.write_req(push || (push_intern && buffer3_data_change)) ,
		.read_en(subbuffer_activation[1]) ,
		.write_en(write_buff_enable[1]),
		//
		.data_out(data_buff2_out) ,
		.fifo_full(buffer_fullness[1]) ,
		.fifo_empty(),
		.data_in_buffer(),
		.buffer_change(buffer2_data_change)
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
		.entrada_1(data_in) ,
		.entrada_2(data_buff2_out) ,
		.seleccion(data_selection) ,
		.salida(data_mux1_out) 	
	);
	


/*
 *
FUNCION: 
==========================================================================
CONTEXTO: Tanto la escritura y lectura de datos en los buffers debe ser habilitada.
Esto porque depende de cuales estan activos o no. La escritura 'push' se maneja mediante
la signal 'write_buf_enable' la cual segun el estado de 'llenura' de los buffers indica
cual de ellos es el que puede recibir datos.

La habilitacion de lectura siempre llega a todos los que esten activos, sin embargo el 
problema se genera cuando los datos de buffers anteriores al 1 deben de escribirse en
los siguientes. De esta forma debe verificarse si es necesario que haya un push luego
de cada pop. Para esto se utiliza el pusl push_intern que se activa luego de cada pop, y 
ademas la signal 'bufferX_data_change' que indica si el buffer anterior cambio de estado.
De esta forma si hubo un pop, en el estado siguiente buffer1 se dara cuenta si buffer2 tiene
menos datos, si es asi, habilitara el push automatico para guardar los datos que genera
el buffer anterior, y asi sucesivamente para los demas.
*
*/
	buffer_unidad buffer_1
	(
		.clk(clk) ,
		.reset(reset) ,
		.data_in(data_mux1_out) ,
		.read_req(pop) ,
		.write_req(push || (push_intern && buffer2_data_change)) ,
		.read_en(subbuffer_activation[0]) ,
		.write_en(write_buff_enable[0]),
		//
		.data_out(data_out) ,
		.fifo_full(buffer_fullness[0]) ,
		.fifo_empty(),
		.data_in_buffer(),
		.buffer_change()
	);



//==========================================================================	
	assign no_config = (e_actual == E_ESPERA_CONFIG);

	// alto cuando los buffer que esten activados esten llenos
	assign buffer_full = (subbuffer_activation == buffer_fullness);

	// la seleccion de los datos de los mux cambian cuando dicho estado se activa
	// ya que es posible que datos de buffers anteriores tengan que escribirse en los siguientes
	assign data_selection = (e_actual_minor1 == E_RETORNAR_DATOS);

	// cuando se cambia al estado E_RETORNO, se debe hacer un push interno
	assign push_intern = data_selection;


	
endmodule



