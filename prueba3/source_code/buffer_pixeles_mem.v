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
	output reg [PIXEL_BITS-1:0] pixel
);


//=========================================================================
	localparam BITS_SELECC_REGS = 3;
	
	localparam 
		E_INICIO		= 0,
		E_GRUPO_1	= 1,
		E_GRUPO_2	= 2,
		E_ESPERA_1	= 3,
		E_ESPERA_2	= 4;

//=========================================================================


	reg [2:0] e_actual, e_siguiente;
	
	
	// senales para dirigir los valores de los registros
	wire [PIXEL_BITS-1:0] reg_pix_1_value;
	wire [PIXEL_BITS-1:0] reg_pix_2_value;
	wire [PIXEL_BITS-1:0] reg_pix_3_value;
	wire [PIXEL_BITS-1:0] reg_pix_4_value;
	wire [PIXEL_BITS-1:0] reg_pix_5_value;
	wire [PIXEL_BITS-1:0] reg_pix_6_value;
	wire [PIXEL_BITS-1:0] reg_pix_7_value;
	wire [PIXEL_BITS-1:0] reg_pix_8_value;
	
	// senal para seleccionar cual registro sera la salida del mux
	wire [BITS_SELECC_REGS-1:0] seleccion_regs;
	
	// senales para habilitar el grupo de registros
	wire habilitar_primer_grupo;
	wire habilitar_segundo_grupo;
	
	
	wire grupo_uno_leido;
	wire grupo_dos_leido;
	wire buffer_lleno;
	
	
		
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
			default:
				pixel = reg_pix_1_value;
		endcase
	end




//=========================================================================

	assign habilitar_primer_grupo = (e_actual == E_GRUPO_1) || (e_actual == E_INICIO);
	assign habilitar_segundo_grupo = (e_actual == E_GRUPO_2);	
	
	assign grupo_uno_leido = (seleccion_regs >= 4) ? 1 : 0;
	assign grupo_dos_leido = ~grupo_uno_leido;
	
	assign buffer_lleno = (e_actual == E_ESPERA_1) || (e_actual == E_ESPERA_2);
	
	
/*
 *
==========================================================================
CONTEXTO: modulo que indica cual es el valor de los registros que se va a presentar
en la salida. Cada vez que se aumente el valor, se va a habilitar otro registro
para que sea la salida
*
*/
	registro_sumador habilitador_registros (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(read_pixel),
	 .resultado(seleccion_regs)
	);
	
	defparam habilitador_registros.CANTIDAD_SUMA = 1;
	defparam habilitador_registros.BITS_DATOS = BITS_SELECC_REGS;	
	
	

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





endmodule






