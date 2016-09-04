/*


*/

module ventana_pixeles #(
	parameter BITS_PIXEL = 8	
)
(
	input clk,
	input reset,
	// 
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



	wire [BITS_PIXEL-1:0] data_buff_4;
	wire [BITS_PIXEL-1:0] data_buff_3;
	wire [BITS_PIXEL-1:0] data_buff_2;
	wire [BITS_PIXEL-1:0] data_buff_1;
	
	wire [BITS_PIXEL-1:0] data_to_buff_1;
	wire [BITS_PIXEL-1:0] data_to_buff_2;
	wire [BITS_PIXEL-1:0] data_to_buff_3;
	
	wire buffer_1_full;
	wire buffer_2_full;
	wire buffer_3_full;
	wire buffer_4_full;
	


//=========================================================================
	buffer_fifo_configurable buffer_4
	(
		.clk(clk),
		.reset_data(),
		.reset_config(),
		.push(),
		.pop(),
		.data_in(),
		.configuration(),
		//
		.data_out(data_buff_4),
		.buffer_full(buffer_4_full),
		.no_config()
	);

	
//=========================================================================	
	mux_2_1 mux_3
	(
		.entrada_1(data_buff_4) ,
		.entrada_2() ,
		.seleccion() ,
		.salida(data_to_buff_3) 	
	);

	
//=========================================================================
	buffer_fifo_configurable buffer_3
	(
		.clk(clk),
		.reset_data(),
		.reset_config(),
		.push(),
		.pop(),
		.data_in(data_to_buff_3),
		.configuration(),
		//
		.data_out(data_buff_3),
		.buffer_full(buffer_3_full),
		.no_config()
	);


	
//=========================================================================	
	mux_2_1 mux_2
	(
		.entrada_1(data_buff_3) ,
		.entrada_2() ,
		.seleccion() ,
		.salida(data_to_buff_2) 	
	);


	
//=========================================================================	
	buffer_fifo_configurable buffer_2
	(
		.clk(clk),
		.reset_data(),
		.reset_config(),
		.push(),
		.pop(),
		.data_in(data_to_buff_2),
		.configuration(),
		//
		.data_out(data_buff_2),
		.buffer_full(buffer_2_full),
		.no_config()
	);


//=========================================================================	
	mux_2_1 mux_1
	(
		.entrada_1(data_buff_2) ,
		.entrada_2() ,
		.seleccion() ,
		.salida(data_to_buff_1) 	
	);


	
//=========================================================================	
	buffer_fifo_configurable buffer_1
	(
		.clk(clk),
		.reset_data(),
		.reset_config(),
		.push(),
		.pop(),
		.data_in(data_to_buff_1),
		.configuration(),
		//
		.data_out(data_buff_1),
		.buffer_full(buffer_1_full),
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
		 .datos_entrada(),
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
		 .datos_entrada(),
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







