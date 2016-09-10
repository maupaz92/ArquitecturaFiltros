/*

modulo que se va a encargar de almacenar cierta cantidad de pixeles, 
el problema consiste en que la memoria va a estar alineada a 4 
bytes, es decir cada palabra de memoria va a tener 4 bytes, y cada
pixel es un byte. POr lo que se debe de hacer una especie de buffer
donde se le provea una interface al modulo que consume pixeles, uno por
uno, no de 4 en 4 como vienen de memoria

hay 4 grupos de registros para guardar 16 pixeles. la entrada 'save_mem_data'
indica que se guarde el valor de la entrada 'memory_data' en el siguiente registro
que este disponible.


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
	output space_available,
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

	// registros para la maquina de estados
	reg [3:0] e_actual, e_siguiente;
	
	// cada bit de la senal indica un grupo de registros
	// en alto cada bit indica que dicho grupo de registros
	// tiene datos escritos
	reg [3:0] activacion_grupo;
	
	
	// senales que llevan el indice del registro actual
	// que esta disponible para ser leido
	wire [BITS_SELECC_REGS-1:0] seleccion_regs;
	wire [BITS_SELECC_REGS-1:0] seleccion_regs_anterior;
	
	// senales para mantener los valores de los registros
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
	
	
	// senales para habilitar la escritura a cada 
	// grupo de registros segun el estado actual de la FSM
	wire habilitar_escritura_grupo1;
	wire habilitar_escritura_grupo2;
	wire habilitar_escritura_grupo3;
	wire habilitar_escritura_grupo4;
	
	// senales para definir que los datos disponibles de un grupo
	// han sido leidos, es decir pasan a disponibles
	wire desactivar_grupo1;
	wire desactivar_grupo2;
	wire desactivar_grupo3;
	wire desactivar_grupo4;
	
	// cada bit de la senal indica un grupo
	// en alto hay datos por leer en el grupo
	// en bajo, los registros del grupo estan 
	// disponibles para escritura
	wire [3:0] estado_grupos;
	
	
//==========================================================================	
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
		activacion_grupo = 4'b0000;
		case(e_actual)
			E_INICIO: begin
				if(save_mem_data) begin
					e_siguiente = E_GRUPO_2;
					activacion_grupo = 4'b0001;
				end
			end
			E_GRUPO_1: begin
				if(save_mem_data) begin
					e_siguiente = E_ESPERA_2;
					activacion_grupo = 4'b0001;
				end
			end
			E_ESPERA_2: begin
				if(~estado_grupos[1])
					e_siguiente = E_GRUPO_2;
			end
			E_GRUPO_2: begin
				if(save_mem_data) begin
					e_siguiente = E_ESPERA_3;
					activacion_grupo = 4'b0010;
				end
			end
			E_ESPERA_3: begin
				if(~estado_grupos[2])
					e_siguiente = E_GRUPO_3;
			end
			E_GRUPO_3: begin
				if(save_mem_data) begin
					e_siguiente = E_ESPERA_4;
					activacion_grupo = 4'b0100;
				end
			end
			E_ESPERA_4: begin
				if(~estado_grupos[3])
					e_siguiente = E_GRUPO_4;
			end
			E_GRUPO_4: begin
				if(save_mem_data) begin
					e_siguiente = E_ESPERA_1;
					activacion_grupo = 4'b1000;
				end
			end
			E_ESPERA_1: begin
				if(~estado_grupos[0])
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
				pixel = reg_pix_9_value;
			9:
				pixel = reg_pix_10_value;
			10:
				pixel = reg_pix_11_value;
			11:
				pixel = reg_pix_12_value;
			12:
				pixel = reg_pix_13_value;
			13:
				pixel = reg_pix_14_value;
			14:
				pixel = reg_pix_15_value;
			15:
				pixel = reg_pix_16_value;
			default:
				pixel = reg_pix_1_value;
		endcase
	end


	
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
	

//=========================================================================
	// modulo que guarda en cada pulso el valor actual 
	// del registro que se esta habilitando, para fines
	// de comparar cual es el actual y cual fue el anterior
	FlipFlopD_Habilitado registro_anterior (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitador(1'b1), 
		 .datos_entrada(seleccion_regs),
		 .datos_salida(seleccion_regs_anterior)
		);
		
	defparam reg_pix_2.BITS_EN_REGISTRO = BITS_SELECC_REGS;

/*
hay 4 registros de un pixel que indican el estado de los 4 grupos de registros.
0 indica que esta disponible, osea que fue leido o que no ha sido escrito, 1
indica que esta ocupado, que sus valores no han sido leidos por completo

con estos 4 valores se controla si es necesario ingresar mas datos o hay 
que esperar a que hayan lecturas y se desocupen espacios para ingresar mas 
datos
*/	

//=========================================================================	
	registro_sumador sumador_estado_grupo1 (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(activacion_grupo[0] || desactivar_grupo1),
	 .resultado(estado_grupos[0])
	);
	
	defparam sumador_estado_grupo1.CANTIDAD_SUMA = 1;
	defparam sumador_estado_grupo1.BITS_DATOS = 1;	

	
//=========================================================================	
	registro_sumador sumador_estado_grupo2 (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(activacion_grupo[1] || desactivar_grupo2),
	 .resultado(estado_grupos[1])
	);
	
	defparam sumador_estado_grupo2.CANTIDAD_SUMA = 1;
	defparam sumador_estado_grupo2.BITS_DATOS = 1;

	
//=========================================================================	
	registro_sumador sumador_estado_grupo3 (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(activacion_grupo[2] || desactivar_grupo3),
	 .resultado(estado_grupos[2])
	);
	
	defparam sumador_estado_grupo3.CANTIDAD_SUMA = 1;
	defparam sumador_estado_grupo3.BITS_DATOS = 1;

	
//=========================================================================	
	registro_sumador sumador_estado_grupo4 (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(activacion_grupo[3] || desactivar_grupo4),
	 .resultado(estado_grupos[3])
	);
	
	defparam sumador_estado_grupo4.CANTIDAD_SUMA = 1;
	defparam sumador_estado_grupo4.BITS_DATOS = 1;


//=========================================================================

	assign habilitar_escritura_grupo1 	= (e_actual == E_GRUPO_1);
	assign habilitar_escritura_grupo2 	= (e_actual == E_GRUPO_2);
	assign habilitar_escritura_grupo3 	= (e_actual == E_GRUPO_3);
	assign habilitar_escritura_grupo4 	= (e_actual == E_GRUPO_4);

	assign desactivar_grupo1 = (seleccion_regs == 4) && (seleccion_regs_anterior == 3);
	assign desactivar_grupo2 = (seleccion_regs == 8) && (seleccion_regs_anterior == 7);
	assign desactivar_grupo3 = (seleccion_regs == 12) && (seleccion_regs_anterior == 11);
	assign desactivar_grupo4 = (seleccion_regs == 0) && (seleccion_regs_anterior == 15);
	
	assign space_available = estado_grupos != 7;	
	assign data_available = estado_grupos != 0;
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






