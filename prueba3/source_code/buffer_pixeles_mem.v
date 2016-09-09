/*

modulo que se va a encargar de almacenar cierta cantidad de pixeles, 
el problema consiste en que la memoria va a estar alineada a 4 
bytes, es decir cada palabra de memoria va a tener 4 bytes, y cada
pixel es un byte. POr lo que se debe de hacer una especie de buffer
donde se le provea una interface al modulo que consume pixeles, uno por
uno, no de 4 en 4 como vienen de memoria

se va a asumir que el orden de los pixeles es de MSB a LSB.

*/

module buffer_pixeles_mem #(
	parameter MEM_WORD_BITS = 32,
	parameter PIXEL_BITS = 8
)
(
	input clk,
	input reset,
	input [MEM_WORD_BITS-1:0] memory_data,
	input read_pixel,
	input save_mem_data,
	// 
	output reg [PIXEL_BITS-1:0] pixel,
	output buffer_full,
	output data_available 
);


//=========================================================================
	localparam BITS_SELECC_REGS = 4;
	
	localparam 
		E_INICIO		= 0,
		E_GRUPO_1	= 1,
		E_ESPERA_1	= 2,
		E_GRUPO_2	= 3,
		E_ESPERA_2	= 4,
		E_GRUPO_3	= 5,
		E_ESPERA_3	= 6,
		E_GRUPO_4	= 7,
		E_ESPERA_4	= 8;

//=========================================================================


	reg [3:0] e_actual, e_siguiente;
	
	
	// senales para dirigir los valores de los registros
	wire [PIXEL_BITS-1:0] reg_pix_1_value;
	wire [PIXEL_BITS-1:0] reg_pix_2_value;
	wire [PIXEL_BITS-1:0] reg_pix_3_value;
	wire [PIXEL_BITS-1:0] reg_pix_4_value;
	wire [PIXEL_BITS-1:0] reg_pix_5_value;
	wire [PIXEL_BITS-1:0] reg_pix_6_value;
	wire [PIXEL_BITS-1:0] reg_pix_7_value;
	wire [PIXEL_BITS-1:0] reg_pix_8_value;
	wire [PIXEL_BITS-1:0] reg_pix_9_value;
	wire [PIXEL_BITS-1:0] reg_pix_10_value;
	wire [PIXEL_BITS-1:0] reg_pix_11_value;
	wire [PIXEL_BITS-1:0] reg_pix_12_value;
	wire [PIXEL_BITS-1:0] reg_pix_13_value;
	wire [PIXEL_BITS-1:0] reg_pix_14_value;
	wire [PIXEL_BITS-1:0] reg_pix_15_value;
	wire [PIXEL_BITS-1:0] reg_pix_16_value;
	
	
	// senales para habilitar el grupo de registros
	wire habilitar_primer_grupo;
	wire habilitar_segundo_grupo;
	wire habilitar_tercer_grupo;
	wire habilitar_cuarto_grupo;
	
	
	wire activar_grupo1;
	wire activar_grupo2;
	wire activar_grupo3;
	wire activar_grupo4;
	
	wire desactivar_grupo1;
	wire desactivar_grupo2;
	wire desactivar_grupo3;
	wire desactivar_grupo4;
	
	wire estado_grupo1;
	wire estado_grupo2;
	wire estado_grupo3;
	wire estado_grupo4;
	
	
	
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
				if(save_mem_data)
					e_siguiente = E_GRUPO_2;
			end
			E_GRUPO_1: begin
				if(save_mem_data)
					e_siguiente = E_ESPERA_2;
			end
			E_ESPERA_2: begin
				if(grupo_dos_leido)
					e_siguiente = E_GRUPO_2;
			end
			E_GRUPO_2: begin
				if(save_mem_data)
					e_siguiente = E_ESPERA_1;
			end
			E_ESPERA_3: begin
				if(grupo_uno_leido)
					e_siguiente = E_GRUPO_1;
			end
			E_GRUPO_3: begin
				if(save_mem_data)
					e_siguiente = E_ESPERA_1;
			end
			E_ESPERA_4: begin
				if(grupo_uno_leido)
					e_siguiente = E_GRUPO_1;
			end
			E_GRUPO_4: begin
				if(save_mem_data)
					e_siguiente = E_ESPERA_1;
			end
			E_ESPERA_1: begin
				if(grupo_uno_leido)
					e_siguiente = E_GRUPO_1;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end
	
//=========================================================================
	
	// case que hace funcion de mux, segun el valor de seleccion
	// asi sera el numero de registro que sera la salida 
	always@(*) begin
		case(seleccion_regs)
			0:
				pixel = reg_pix_1_value;
			1:
				pixel = reg_pix_2_value;
			2:
				pixel = reg_pix_3_value;
			3:
				pixel = reg_pix_4_value;
			4:
				pixel = reg_pix_5_value;
			5:
				pixel = reg_pix_6_value;
			6:
				pixel = reg_pix_7_value;
			7:
				pixel = reg_pix_8_value;
			8:
				pixel = reg_pix_1_value;
			9:
				pixel = reg_pix_2_value;
			10:
				pixel = reg_pix_3_value;
			11:
				pixel = reg_pix_4_value;
			12:
				pixel = reg_pix_5_value;
			13:
				pixel = reg_pix_6_value;
			14:
				pixel = reg_pix_7_value;
			15:
				pixel = reg_pix_8_value;
			default:
				pixel = reg_pix_1_value;
		endcase
	end



//=========================================================================	
	registro_sumador ff_estado_grupo1 (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(activar_grupo1 || desactivar_grupo1),
	 .resultado(estado_grupo1)
	);
	
	defparam ff_estado_grupo1.CANTIDAD_SUMA = 1;
	defparam ff_estado_grupo1.BITS_DATOS = 1;	

	
//=========================================================================	
	registro_sumador ff_estado_grupo2 (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(activar_grupo2 || desactivar_grupo2),
	 .resultado(estado_grupo2)
	);
	
	defparam ff_estado_grupo2.CANTIDAD_SUMA = 1;
	defparam ff_estado_grupo2.BITS_DATOS = 1;

	
//=========================================================================	
	registro_sumador ff_estado_grupo3 (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(activar_grupo3 || desactivar_grupo3),
	 .resultado(estado_grupo3)
	);
	
	defparam ff_estado_grupo3.CANTIDAD_SUMA = 1;
	defparam ff_estado_grupo3.BITS_DATOS = 1;

	
//=========================================================================	
	registro_sumador ff_estado_grupo4 (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(activar_grupo4 || desactivar_grupo4),
	 .resultado(estado_grupo4)
	);
	
	defparam ff_estado_grupo4.CANTIDAD_SUMA = 1;
	defparam ff_estado_grupo4.BITS_DATOS = 1;


//=========================================================================

		assign activar_grupo1 = (e_siguiente == E_GRUPO_2);

	
	
	
//=========================================================================
	
// ++++++++++++++++++++++++++++ de aqui para abajo solo registros 		

	FlipFlopD_Habilitado reg_pix_1 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_primer_grupo && save_mem_data), 
		 .datos_entrada(memory_data[31:24]),
		 .datos_salida(reg_pix_1_value)
		);
		
	defparam reg_pix_1.BITS_EN_REGISTRO = PIXEL_BITS;


//=========================================================================

	FlipFlopD_Habilitado reg_pix_2 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_primer_grupo && save_mem_data), 
		 .datos_entrada(memory_data[23:16]),
		 .datos_salida(reg_pix_2_value)
		);
		
	defparam reg_pix_2.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_3 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_primer_grupo && save_mem_data), 
		 .datos_entrada(memory_data[15:8]),
		 .datos_salida(reg_pix_3_value)
		);
		
	defparam reg_pix_3.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_4 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_primer_grupo && save_mem_data), 
		 .datos_entrada(memory_data[7:0]),
		 .datos_salida(reg_pix_4_value)
		);
		
	defparam reg_pix_4.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_5 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_segundo_grupo && save_mem_data), 
		 .datos_entrada(memory_data[31:24]),
		 .datos_salida(reg_pix_5_value)
		);
		
	defparam reg_pix_5.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_6 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_segundo_grupo && save_mem_data), 
		 .datos_entrada(memory_data[23:16]),
		 .datos_salida(reg_pix_6_value)
		);
		
	defparam reg_pix_6.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_7 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_segundo_grupo && save_mem_data), 
		 .datos_entrada(memory_data[15:8]),
		 .datos_salida(reg_pix_7_value)
		);
		
	defparam reg_pix_7.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_8 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_segundo_grupo && save_mem_data), 
		 .datos_entrada(memory_data[7:0]),
		 .datos_salida(reg_pix_8_value)
		);
		
	defparam reg_pix_8.BITS_EN_REGISTRO = PIXEL_BITS;

	
	
//=========================================================================
	
	FlipFlopD_Habilitado reg_pix_9 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_primer_grupo && save_mem_data), 
		 .datos_entrada(memory_data[31:24]),
		 .datos_salida(reg_pix_9_value)
		);
		
	defparam reg_pix_9.BITS_EN_REGISTRO = PIXEL_BITS;


//=========================================================================

	FlipFlopD_Habilitado reg_pix_10 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_tercer_grupo && save_mem_data), 
		 .datos_entrada(memory_data[23:16]),
		 .datos_salida(reg_pix_10_value)
		);
		
	defparam reg_pix_10.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_11 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_tercer_grupo && save_mem_data), 
		 .datos_entrada(memory_data[15:8]),
		 .datos_salida(reg_pix_11_value)
		);
		
	defparam reg_pix_11.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_12 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_tercer_grupo && save_mem_data), 
		 .datos_entrada(memory_data[7:0]),
		 .datos_salida(reg_pix_12_value)
		);
		
	defparam reg_pix_12.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_13 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_segundo_grupo && save_mem_data), 
		 .datos_entrada(memory_data[31:24]),
		 .datos_salida(reg_pix_13_value)
		);
		
	defparam reg_pix_13.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_14 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_cuarto_grupo && save_mem_data), 
		 .datos_entrada(memory_data[23:16]),
		 .datos_salida(reg_pix_14_value)
		);
		
	defparam reg_pix_14.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_15 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_cuarto_grupo && save_mem_data), 
		 .datos_entrada(memory_data[15:8]),
		 .datos_salida(reg_pix_15_value)
		);
		
	defparam reg_pix_15.BITS_EN_REGISTRO = PIXEL_BITS;

	
//=========================================================================

	FlipFlopD_Habilitado reg_pix_16 (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(habilitar_cuarto_grupo && save_mem_data), 
		 .datos_entrada(memory_data[7:0]),
		 .datos_salida(reg_pix_16_value)
		);
		
	defparam reg_pix_16.BITS_EN_REGISTRO = PIXEL_BITS;




endmodule






