/*


*/

module ventana_pixeles #(
	parameter BITS_PIXEL = 8,
	// cantidad de bits para definir los buffers a utilizar
	parameter BITS_BUFFERS = 3,
	// cantdad de bits para guardar el tamano posible de la mascara
	// 3 o 5.
	parameter BITS_MASCARA = 3
	
)
(
	input clk,
	input reset,
	// la cantidad de buffers define el ancho de la imagen que
	// se esta procesando. 2=512, 4=1024
	input [BITS_BUFFERS-1:0] cantidad_buffers_internos,
	input [BITS_MASCARA-1:0] tamano_mascara,
	input data_available,
	input iniciar,
	input [BITS_PIXEL-1:0] pixel_entrada,
	//input siguiente_ventana,
	// 
	
	output read_pixel,
	
	output [BITS_PIXEL-1:0] pixel_1,
	output [BITS_PIXEL-1:0] pixel_2,
	output [BITS_PIXEL-1:0] pixel_3,
	output [BITS_PIXEL-1:0] pixel_4,
	output [BITS_PIXEL-1:0] pixel_5,
	output [BITS_PIXEL-1:0] pixel_6,
	output [BITS_PIXEL-1:0] pixel_7,
	output [BITS_PIXEL-1:0] pixel_8,
	output [BITS_PIXEL-1:0] pixel_9,
	output [BITS_PIXEL-1:0] pixel_10,
	output [BITS_PIXEL-1:0] pixel_11,
	output [BITS_PIXEL-1:0] pixel_12,
	output [BITS_PIXEL-1:0] pixel_13,
	output [BITS_PIXEL-1:0] pixel_14,
	output [BITS_PIXEL-1:0] pixel_15,
	output [BITS_PIXEL-1:0] pixel_16,
	output [BITS_PIXEL-1:0] pixel_17,
	output [BITS_PIXEL-1:0] pixel_18,
	output [BITS_PIXEL-1:0] pixel_19,
	output [BITS_PIXEL-1:0] pixel_20,
	output [BITS_PIXEL-1:0] pixel_21,
	output [BITS_PIXEL-1:0] pixel_22,
	output [BITS_PIXEL-1:0] pixel_23,
	output [BITS_PIXEL-1:0] pixel_24,
	output [BITS_PIXEL-1:0] pixel_25
);

//=========================================================================

	// pulso que en alto indica que el tamano de la ventana es 5 diagonal, 3 en caso contrario
	wire ventana_grande;

	wire [BITS_PIXEL-1:0] data_buff_5;
	wire [BITS_PIXEL-1:0] data_buff_4;
	wire [BITS_PIXEL-1:0] data_buff_3;
	wire [BITS_PIXEL-1:0] data_buff_2;
	wire [BITS_PIXEL-1:0] data_buff_1;
	
	wire [BITS_PIXEL-1:0] data_to_buff_1;
	wire [BITS_PIXEL-1:0] data_to_buff_2;
	wire [BITS_PIXEL-1:0] data_to_buff_3;	
	wire [BITS_PIXEL-1:0] data_to_buff_4;
	wire [BITS_PIXEL-1:0] data_to_buff_3_intern_short;
	wire [BITS_PIXEL-1:0] data_to_buff_3_intern_large;
	
	wire buffer_full_1;
	wire buffer_full_2;
	wire buffer_full_3_large;
	wire buffer_full_3_short;
	wire buffer_full_3;
	wire buffer_full_4;
	wire buffer_full_5;
	
	// senal que se activa una vez que se lea un pixel del buffer de pixeles
	wire pixel_leido;
	
	// senal que indica que se debe de guardar la entrada pixel en el buffer actual habilitado
	wire guardar_pixel;
	
	// senal que tiene el indice para indicar sobre cual buffer se esta llenando
	wire [2:0] indice_buffer_actual;
	// senal que habilita el buffer actual que se este llenando
	wire [4:0] habilitador_buffer_llenado;
	
	// senal que indica que se debe llenar el siguiente buffer
	wire habilitar_siguiente_buffer;

	// senal que indica que se han llenado los buffers segun la configuracion dada
	wire llenado_buffers_completo;
	
	// senal que antes de comenzar el llenado de los buffers se activa para capurar
	// configuracion de los buffers 
	wire guardar_configuracion_buffers;
	
	wire buffer_short_tres_empty;
	wire buffer_short_cinco_empty;
	
	
	
	// senal que tiene el valor de si el buffer actual esta lleno o no
	reg buffer_fullness_actual;

/*
 *
==========================================================================
CONTEXTO: ssegun el indice que mantenga el registro, se intercambia entre
las diferentes senales 'full' de los buffers, de esta forma es posible
saber que el buffer actual ha sido lleno, y pasar al siguiente, donde
se va a repetir el mismo proceso
*
*/
	always@(*) begin
		case(indice_buffer_actual)
			0:
				buffer_fullness_actual = buffer_full_1;
			1:
				buffer_fullness_actual = buffer_full_2;
			2:
				buffer_fullness_actual = buffer_full_3;
			3:
				buffer_fullness_actual = buffer_full_4;
			4:
				buffer_fullness_actual = buffer_full_5;
			default:
				buffer_fullness_actual = buffer_full_1;
		endcase
	end


//=========================================================================
	 reg [2:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO					= 0,
		E_GUARDAR_CONFIG		= 1,
		E_ESPERA_DATOS			= 2,
		E_GUARDAR				= 3,
		E_REVISION				= 4,
		E_LLENADO_COMPLETO	= 5;
		
//==========================================================================	
// estado del registro
	always @(posedge clk) begin
		if(reset)
			e_actual <= E_INICIO;
		else
			e_actual <= e_siguiente;
	end

/*
 *
==========================================================================
CONTEXTO: el proceso de llenado empieza a meter pixeles al primer buffer,
hasta que el mismo este lleno, una vez que este lleno se actualiza al sig
buffer y asi sucesivamente hasta que se alcance la senal 'llenado_buffers_completo', 
la cual indica que ya los buffers estan llenos y se puede continuar con el movimiento
de los pixeles a traves de los registros de la ventana para asi poder efectuar
el procesamiento por la unidad funcional.
*
*/
	always@(*) begin		
		e_siguiente = e_actual;
		case(e_actual)			
			E_INICIO: begin
				if(iniciar)
					e_siguiente = E_GUARDAR_CONFIG;
			end
			E_GUARDAR_CONFIG: begin
				e_siguiente = E_ESPERA_DATOS;
			end
			E_ESPERA_DATOS: begin
				if(data_available)
					e_siguiente = E_GUARDAR;
			end
			E_GUARDAR: begin
				if(buffer_fullness_actual)
					e_siguiente = E_REVISION;
				else
					e_siguiente = E_ESPERA_DATOS;
			end
			E_REVISION: begin
				if(llenado_buffers_completo)
					e_siguiente = E_LLENADO_COMPLETO;
				else 
					e_siguiente = E_ESPERA_DATOS;
			end
			E_LLENADO_COMPLETO: begin
			end
			default:
				e_siguiente = E_INICIO;
		endcase
	end		
	
	

//=========================================================================
 		
		assign pixel_leido = (e_actual == E_GUARDAR);
		
		assign guardar_pixel = (e_siguiente == E_GUARDAR);
		
		assign habilitar_siguiente_buffer = (e_actual == E_REVISION);
		
		assign guardar_configuracion_buffers = (e_actual == E_GUARDAR_CONFIG);

		assign ventana_grande = (tamano_mascara == 5);
		
		assign llenado_buffers_completo = buffer_full_5 || (buffer_full_3_short & ~ventana_grande);
		
		assign read_pixel = pixel_leido;
		
/*
 *
==========================================================================
CONTEXTO:  
Mediante el indice actual se lee el estado 'full' del buffer. De esta forma es posible
saber si el buffer actual esta lleno, y cambiar al siguiente 
*
*/
	registro_sumador indice_buffers (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(habilitar_siguiente_buffer),
	 .resultado(indice_buffer_actual)
	);
	
	defparam indice_buffers.CANTIDAD_SUMA = 1;
	// son 5 posibles buffers
	defparam indice_buffers.BITS_DATOS = 3;

	
/*
 *
==========================================================================
CONTEXTO: una vez que se llena el buffer actual, se hace un corrimiento
hacia la ixquiera para habilitar el proximo buffer en la escritura y 
deshabilitar los anteriores. Se inicia en 00001, luego a 00010 y asi
sucesivamente hasta llenar los buffers que se configuraron
*
*/
	registro_desplazador_izq registro_desplazador_izq_inst
	(
		.clk(clk),
		.reset(reset),
		.desplazar(habilitar_siguiente_buffer),
		.resultado(habilitador_buffer_llenado)
	);	



	
//					Inicio de los buffers para guardar los pixeles en la ventana
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************	




//=========================================================================	
	fifo_8w_8b	buffer_5 (
		.clock(clk),
		.data(pixel_entrada),
		.rdreq(1'b0), //pop
		.sclr(reset),
		.wrreq(guardar_pixel & habilitador_buffer_llenado[4]), //push
		//
		.empty(buffer_short_cinco_empty),
		.full(buffer_full_5),
		.q(data_buff_5),
		.usedw()
	);

	
//=========================================================================	
	mux_2_1 mux_4
	(
		.entrada_1(data_buff_5) ,
		.entrada_2(pixel_entrada) ,
		.seleccion(1'b1) ,
		.salida(data_to_buff_4) 	
	);		
	

//=========================================================================
	buffer_fifo_configurable buffer_4
	(
		.clk(clk),
		.reset(reset),
		.push(guardar_pixel & habilitador_buffer_llenado[3]),
		.pop(1'b0),
		.data_in(data_to_buff_4),
		.configuration(cantidad_buffers_internos),
		.save_config(guardar_configuracion_buffers),
		//
		.data_out(data_buff_4),
		.buffer_full(buffer_full_4),
		.no_config()
	);

	
//=========================================================================	
	mux_2_1 mux_3
	(
		.entrada_1(data_buff_4) ,
		.entrada_2(pixel_entrada) ,
		.seleccion(1'b1) ,
		.salida(data_to_buff_3) 	
	);

	
//=========================================================================
	buffer_fifo_configurable buffer_3_large
	(
		.clk(clk),
		.reset(reset),
		.push(guardar_pixel & habilitador_buffer_llenado[2] & ventana_grande),
		.pop(1'b0),
		.data_in(data_to_buff_3),
		.configuration(cantidad_buffers_internos),
		.save_config(guardar_configuracion_buffers),
		//
		.data_out(data_to_buff_3_intern_large),
		.buffer_full(buffer_full_3_large),
		.no_config()
	);
	
//=========================================================================	
	fifo_8w_8b	buffer_3_short (
		.clock(clk),
		.data(data_to_buff_3),
		.rdreq(1'b0), //pop
		.sclr(reset),
		.wrreq(guardar_pixel & habilitador_buffer_llenado[2] & ~ventana_grande), //push
		//
		.empty(buffer_short_tres_empty),
		.full(buffer_full_3_short),
		.q(data_to_buff_3_intern_short),
		.usedw()
	);


//=========================================================================	
	mux_2_1 mux_buffer_3_fullness
	(
		.entrada_1(buffer_full_3_short) ,
		.entrada_2(buffer_full_3_large) ,
		.seleccion(ventana_grande) ,
		.salida(buffer_full_3) 	
	);		
	
	defparam mux_buffer_3_fullness.BITS_DATOS = 1;
	
//=========================================================================	
	mux_2_1 mux_3_interno
	(
		.entrada_1(data_to_buff_3_intern_short) ,
		.entrada_2(data_to_buff_3_intern_large) ,
		.seleccion(ventana_grande) ,
		.salida(data_buff_3) 	
	);	
	
	
//=========================================================================	
	mux_2_1 mux_2
	(
		.entrada_1(data_buff_3) ,
		.entrada_2(pixel_entrada) ,
		.seleccion(1'b1),
		.salida(data_to_buff_2)
	);


	
//=========================================================================	
	buffer_fifo_configurable buffer_2
	(
		.clk(clk),
		.reset(reset),
		.push(guardar_pixel & habilitador_buffer_llenado[1]),
		.pop(1'b0),
		.data_in(data_to_buff_2),
		.configuration(cantidad_buffers_internos),
		.save_config(guardar_configuracion_buffers),
		//
		.data_out(data_buff_2),
		.buffer_full(buffer_full_2),
		.no_config()
	);


//=========================================================================	
	mux_2_1 mux_1
	(
		.entrada_1(data_buff_2) ,
		.entrada_2(pixel_entrada) ,
		.seleccion(1'b1) ,
		.salida(data_to_buff_1) 	
	);


	
//=========================================================================	
	buffer_fifo_configurable buffer_1
	(
		.clk(clk),
		.reset(reset),
		.push(guardar_pixel & habilitador_buffer_llenado[0]),
		.pop(1'b0),
		.data_in(data_to_buff_1),
		.configuration(cantidad_buffers_internos),
		.save_config(guardar_configuracion_buffers),
		//
		.data_out(data_buff_1),
		.buffer_full(buffer_full_1),
		.no_config()
	);





//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

//					Inicio de los registros que guardan los valores de la ventana
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

	FlipFlopD_Habilitado pix_25 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(data_buff_5),
		 .datos_salida(pixel_25)
		);
		
	defparam pix_25.BITS_EN_REGISTRO = BITS_PIXEL;
	

	//=========================================================================


	FlipFlopD_Habilitado pix_24 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_25),
		 .datos_salida(pixel_24)
		);
		
	defparam pix_24.BITS_EN_REGISTRO = BITS_PIXEL;
	
	
//=========================================================================


	FlipFlopD_Habilitado pix_23 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_24),
		 .datos_salida(pixel_23)
		);
		
	defparam pix_23.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_22 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_23),
		 .datos_salida(pixel_22)
		);
		
	defparam pix_22.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_21 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_22),
		 .datos_salida(pixel_21)
		);
		
	defparam pix_21.BITS_EN_REGISTRO = BITS_PIXEL;




//=========================================================================


	FlipFlopD_Habilitado pix_20 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(data_buff_4),
		 .datos_salida(pixel_20)
		);
		
	defparam pix_20.BITS_EN_REGISTRO = BITS_PIXEL;
	

	//=========================================================================


	FlipFlopD_Habilitado pix_19 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_20),
		 .datos_salida(pixel_19)
		);
		
	defparam pix_19.BITS_EN_REGISTRO = BITS_PIXEL;
	
	
//=========================================================================


	FlipFlopD_Habilitado pix_18 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_19),
		 .datos_salida(pixel_18)
		);
		
	defparam pix_18.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_17 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_18),
		 .datos_salida(pixel_17)
		);
		
	defparam pix_17.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_16 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_17),
		 .datos_salida(pixel_16)
		);
		
	defparam pix_16.BITS_EN_REGISTRO = BITS_PIXEL;



//=========================================================================


	FlipFlopD_Habilitado pix_15 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(),
		 .datos_salida(pixel_15)
		);
		
	defparam pix_15.BITS_EN_REGISTRO = BITS_PIXEL;
	

	//=========================================================================


	FlipFlopD_Habilitado pix_14 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_15),
		 .datos_salida(pixel_14)
		);
		
	defparam pix_14.BITS_EN_REGISTRO = BITS_PIXEL;
	
	
//=========================================================================


	FlipFlopD_Habilitado pix_13 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_14),
		 .datos_salida(pixel_13)
		);
		
	defparam pix_13.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_12 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_13),
		 .datos_salida(pixel_12)
		);
		
	defparam pix_12.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_11 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_12),
		 .datos_salida(pixel_11)
		);
		
	defparam pix_11.BITS_EN_REGISTRO = BITS_PIXEL;



//=========================================================================


	FlipFlopD_Habilitado pix_10 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(),
		 .datos_salida(pixel_10)
		);
		
	defparam pix_10.BITS_EN_REGISTRO = BITS_PIXEL;
	

	//=========================================================================


	FlipFlopD_Habilitado pix_9 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_10),
		 .datos_salida(pixel_9)
		);
		
	defparam pix_9.BITS_EN_REGISTRO = BITS_PIXEL;
	
	
//=========================================================================


	FlipFlopD_Habilitado pix_8 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_9),
		 .datos_salida(pixel_8)
		);
		
	defparam pix_8.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_7 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_8),
		 .datos_salida(pixel_7)
		);
		
	defparam pix_7.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_6 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_7),
		 .datos_salida(pixel_6)
		);
		
	defparam pix_6.BITS_EN_REGISTRO = BITS_PIXEL;




//=========================================================================


	FlipFlopD_Habilitado pix_5 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(),
		 .datos_salida(pixel_5)
		);
		
	defparam pix_5.BITS_EN_REGISTRO = BITS_PIXEL;
	

	//=========================================================================


	FlipFlopD_Habilitado pix_4 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_5),
		 .datos_salida(pixel_4)
		);
		
	defparam pix_4.BITS_EN_REGISTRO = BITS_PIXEL;
	
	
//=========================================================================


	FlipFlopD_Habilitado pix_3 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_4),
		 .datos_salida(pixel_3)
		);
		
	defparam pix_3.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_2 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_3),
		 .datos_salida(pixel_2)
		);
		
	defparam pix_2.BITS_EN_REGISTRO = BITS_PIXEL;


//=========================================================================


	FlipFlopD_Habilitado pix_1 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(), 
		 .datos_entrada(pixel_2),
		 .datos_salida(pixel_1)
		);
		
	defparam pix_1.BITS_EN_REGISTRO = BITS_PIXEL;













endmodule







