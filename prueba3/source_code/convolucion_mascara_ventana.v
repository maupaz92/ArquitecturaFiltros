/*

modulo que se encarga de aplicar la convolucion de los pixeles en la ventana actual, con los
datos en la mascara. Se aplica una operacion de suma de productos de todos los pixeles que esten
activos. El resultado es un pixel que equivale a la operacion aplicada a los pixeles en su vecindad.

el modulo espera a que la senal ventana_pixeles_lista sea alta para aplicar el respectivo proceso.
Una vez terminado el proceso activa la senal pixel_calculado para indicar que el resultado ya puede
ser obtenido

debido a que muchas mascaras tienen valores de punto flotante, para agilizar el proceso se trabaja
con aproximaciones entera, por lo que se utiliza una entrada 'denominador', por el cual los valores
de la ventana de pixeles seran dividos, luego para ser multiplicados por los elementos de la mascara
y sumar todo el resultado. por lo que se deben ingresar mascaras con un factor comun, si es que se
quisiera aplicar un valor de punto flotanto, en caso de solo enteros, mantener el valor de la entrada
denominador en 1, para que no hayan problemas con la division de los valores, la cual se aplica siempre
ya que es un proceso combinacional

*/

module convolucion_mascara_ventana #(
	parameter BITS_ELEMENTO_MASCARA = 10,
	parameter BITS_PIXEL = 8,
	parameter BITS_PRODUCTO_SUMA = 11,
	parameter BITS_MASCARA = 3
)
(
	input clk,
	input reset,
	input ventana_pixeles_lista,
	input [BITS_ELEMENTO_MASCARA-1:0] denominador,
	// valor que puede ser 3|5
	input [BITS_MASCARA-1:0] tamano_mascara,
	
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_1,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_2,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_3,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_4,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_5,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_6,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_7,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_8,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_9,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_10,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_11,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_12,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_13,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_14,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_15,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_16,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_17,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_18,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_19,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_20,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_21,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_22,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_23,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_24,
	input signed [BITS_ELEMENTO_MASCARA-1:0] mask_value_25,
	
	
	input [BITS_PIXEL-1:0] pixel_value_1,
	input [BITS_PIXEL-1:0] pixel_value_2,
	input [BITS_PIXEL-1:0] pixel_value_3,
	input [BITS_PIXEL-1:0] pixel_value_4,
	input [BITS_PIXEL-1:0] pixel_value_5,
	input [BITS_PIXEL-1:0] pixel_value_6,
	input [BITS_PIXEL-1:0] pixel_value_7,
	input [BITS_PIXEL-1:0] pixel_value_8,
	input [BITS_PIXEL-1:0] pixel_value_9,
	input [BITS_PIXEL-1:0] pixel_value_10,
	input [BITS_PIXEL-1:0] pixel_value_11,
	input [BITS_PIXEL-1:0] pixel_value_12,
	input [BITS_PIXEL-1:0] pixel_value_13,
	input [BITS_PIXEL-1:0] pixel_value_14,
	input [BITS_PIXEL-1:0] pixel_value_15,
	input [BITS_PIXEL-1:0] pixel_value_16,
	input [BITS_PIXEL-1:0] pixel_value_17,
	input [BITS_PIXEL-1:0] pixel_value_18,
	input [BITS_PIXEL-1:0] pixel_value_19,
	input [BITS_PIXEL-1:0] pixel_value_20,
	input [BITS_PIXEL-1:0] pixel_value_21,
	input [BITS_PIXEL-1:0] pixel_value_22,
	input [BITS_PIXEL-1:0] pixel_value_23,
	input [BITS_PIXEL-1:0] pixel_value_24,
	input [BITS_PIXEL-1:0] pixel_value_25,
	
	
	// 
	output [BITS_PIXEL-1:0] pixel_resultado,
	output pixel_calculado
);

//=========================================================================


	wire habilitar_multiplicadores;
	wire habilitar_multiplicadores_mask_3;
	wire habilitar_multiplicadores_mask_5;


	wire [BITS_PIXEL-1:0] cociente_1;
	wire [BITS_PIXEL-1:0] cociente_2;
	wire [BITS_PIXEL-1:0] cociente_3;
	wire [BITS_PIXEL-1:0] cociente_4;
	wire [BITS_PIXEL-1:0] cociente_5;
	wire [BITS_PIXEL-1:0] cociente_6;
	wire [BITS_PIXEL-1:0] cociente_7;
	wire [BITS_PIXEL-1:0] cociente_8;
	wire [BITS_PIXEL-1:0] cociente_9;
	wire [BITS_PIXEL-1:0] cociente_10;
	wire [BITS_PIXEL-1:0] cociente_11;
	wire [BITS_PIXEL-1:0] cociente_12;
	wire [BITS_PIXEL-1:0] cociente_13;
	wire [BITS_PIXEL-1:0] cociente_14;
	wire [BITS_PIXEL-1:0] cociente_15;
	wire [BITS_PIXEL-1:0] cociente_16;
	wire [BITS_PIXEL-1:0] cociente_17;
	wire [BITS_PIXEL-1:0] cociente_18;
	wire [BITS_PIXEL-1:0] cociente_19;
	wire [BITS_PIXEL-1:0] cociente_20;
	wire [BITS_PIXEL-1:0] cociente_21;
	wire [BITS_PIXEL-1:0] cociente_22;
	wire [BITS_PIXEL-1:0] cociente_23;
	wire [BITS_PIXEL-1:0] cociente_24;
	wire [BITS_PIXEL-1:0] cociente_25;
	
	
	
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_1;
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_2;
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_3;
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_4;
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_5;
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_6;
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_7;
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_8;
	wire [BITS_PRODUCTO_SUMA-1:0] resultado_producto_suma_9;
	
	wire signed [BITS_PRODUCTO_SUMA-1:0] resultado_suma_1;
	wire signed [BITS_PRODUCTO_SUMA-1:0] resultado_suma_2;
	wire signed [BITS_PRODUCTO_SUMA-1:0] resultado_suma_3;
	wire signed [BITS_PRODUCTO_SUMA-1:0] resultado_suma_4;
	wire signed [BITS_PRODUCTO_SUMA-1:0] resultado_suma_5;
	wire signed [BITS_PRODUCTO_SUMA-1:0] resultado_suma_6;
	wire signed [BITS_PRODUCTO_SUMA-1:0] resultado_suma_7;
	wire signed [BITS_PRODUCTO_SUMA-1:0] resultado_suma_8;



//=========================================================================
	 reg [1:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO				= 0,
		E_ACTIVAR_MULT		= 1,
		E_RESULTADOS_MULT	= 2,
		E_PIXEL_LISTO		= 3;
		
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
				if(ventana_pixeles_lista)
					e_siguiente = E_ACTIVAR_MULT;
			end
			E_ACTIVAR_MULT: begin
				e_siguiente = E_RESULTADOS_MULT;
			end
			E_RESULTADOS_MULT: begin
				e_siguiente = E_PIXEL_LISTO;
			end
			E_PIXEL_LISTO: begin
				e_siguiente = E_INICIO;
			end			
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end		

//=========================================================================	

	assign habilitar_multiplicadores = (e_actual == E_ACTIVAR_MULT);
	assign pixel_calculado = (e_actual == E_PIXEL_LISTO);

	assign pixel_resultado = habilitar_multiplicadores_mask_3 ? 
		resultado_suma_4[BITS_PIXEL-1:0] :
		resultado_suma_8[BITS_PIXEL-1:0];
	
	assign habilitar_multiplicadores_mask_3 = tamano_mascara == 3;
	assign habilitar_multiplicadores_mask_5 = tamano_mascara == 5;
	
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

//					inicio de las definiciones de los modulos para hacer el calculo
//					del pixel, nada de logica
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
	

//=========================================================================	
	
	divisor divisor_1(
		.denom(denominador),
		.numer(pixel_value_1),
		.quotient(cociente_1),
		.remain()
	);


//=========================================================================	
	divisor divisor_2(
		.denom(denominador),
		.numer(pixel_value_2),
		.quotient(cociente_2),
		.remain()
	);

//=========================================================================	
	divisor divisor_3(
		.denom(denominador),
		.numer(pixel_value_3),
		.quotient(cociente_3),
		.remain()
	);


//=========================================================================	
	divisor divisor_4(
		.denom(denominador),
		.numer(pixel_value_4),
		.quotient(cociente_4),
		.remain()
	);

//=========================================================================	
	divisor divisor_5(
		.denom(denominador),
		.numer(pixel_value_5),
		.quotient(cociente_5),
		.remain()
	);


//=========================================================================	
	divisor divisor_6(
		.denom(denominador),
		.numer(pixel_value_6),
		.quotient(cociente_6),
		.remain()
	);


//=========================================================================	
	divisor divisor_7(
		.denom(denominador),
		.numer(pixel_value_7),
		.quotient(cociente_7),
		.remain()
	);

//=========================================================================	
	divisor divisor_8(
		.denom(denominador),
		.numer(pixel_value_8),
		.quotient(cociente_8),
		.remain()
	);


//=========================================================================	
	divisor divisor_9(
		.denom(denominador),
		.numer(pixel_value_9),
		.quotient(cociente_9),
		.remain()
	);

//=========================================================================	
	divisor divisor_10(
		.denom(denominador),
		.numer(pixel_value_10),
		.quotient(cociente_10),
		.remain()
	);

	
//=========================================================================	
	divisor divisor_11(
		.denom(denominador),
		.numer(pixel_value_11),
		.quotient(cociente_11),
		.remain()
	);


//=========================================================================	
	divisor divisor_12(
		.denom(denominador),
		.numer(pixel_value_12),
		.quotient(cociente_12),
		.remain()
	);

//=========================================================================	
	divisor divisor_13(
		.denom(denominador),
		.numer(pixel_value_13),
		.quotient(cociente_13),
		.remain()
	);


//=========================================================================	
	divisor divisor_14(
		.denom(denominador),
		.numer(pixel_value_14),
		.quotient(cociente_14),
		.remain()
	);

//=========================================================================	
	divisor divisor_15(
		.denom(denominador),
		.numer(pixel_value_15),
		.quotient(cociente_15),
		.remain()
	);

	
	
//=========================================================================	
	divisor divisor_16(
		.denom(denominador),
		.numer(pixel_value_16),
		.quotient(cociente_16),
		.remain()
	);


//=========================================================================	
	divisor divisor_17(
		.denom(denominador),
		.numer(pixel_value_17),
		.quotient(cociente_17),
		.remain()
	);

//=========================================================================	
	divisor divisor_18(
		.denom(denominador),
		.numer(pixel_value_18),
		.quotient(cociente_18),
		.remain()
	);


//=========================================================================	
	divisor divisor_19(
		.denom(denominador),
		.numer(pixel_value_19),
		.quotient(cociente_19),
		.remain()
	);

//=========================================================================	
	divisor divisor_20(
		.denom(denominador),
		.numer(pixel_value_20),
		.quotient(cociente_20),
		.remain()
	);

	
//=========================================================================	
	divisor divisor_21(
		.denom(denominador),
		.numer(pixel_value_21),
		.quotient(cociente_21),
		.remain()
	);


//=========================================================================	
	divisor divisor_22(
		.denom(denominador),
		.numer(pixel_value_22),
		.quotient(cociente_22),
		.remain()
	);

//=========================================================================	
	divisor divisor_23(
		.denom(denominador),
		.numer(pixel_value_23),
		.quotient(cociente_23),
		.remain()
	);


//=========================================================================	
	divisor divisor_24(
		.denom(denominador),
		.numer(pixel_value_24),
		.quotient(cociente_24),
		.remain()
	);

//=========================================================================	
	divisor divisor_25(
		.denom(denominador),
		.numer(pixel_value_25),
		.quotient(cociente_25),
		.remain()
	);






//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_1 (
		.clock0(clk),
		.dataa_0(cociente_1),
		.dataa_1(cociente_2),
		.dataa_2(cociente_3),
		.datab_0(mask_value_1),
		.datab_1(mask_value_2),
		.datab_2(mask_value_3),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_3),
		.result(resultado_producto_suma_1)
	);

	
	//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_2 (
		.clock0(clk),
		.dataa_0(cociente_4),
		.dataa_1(cociente_5),
		.dataa_2(cociente_6),
		.datab_0(mask_value_4),
		.datab_1(mask_value_5),
		.datab_2(mask_value_6),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_3),
		.result(resultado_producto_suma_2)
	);
	
	
//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_3 (
		.clock0(clk),
		.dataa_0(cociente_7),
		.dataa_1(cociente_8),
		.dataa_2(cociente_9),
		.datab_0(mask_value_7),
		.datab_1(mask_value_8),
		.datab_2(mask_value_9),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_3),
		.result(resultado_producto_suma_3)
	);
	
	
	
//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_4 (
		.clock0(clk),
		.dataa_0(cociente_10),
		.dataa_1(cociente_11),
		.dataa_2(cociente_12),
		.datab_0(mask_value_10),
		.datab_1(mask_value_11),
		.datab_2(mask_value_12),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_5),
		.result(resultado_producto_suma_4)
	);
	
	
//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_5 (
		.clock0(clk),
		.dataa_0(cociente_13),
		.dataa_1(cociente_14),
		.dataa_2(cociente_15),
		.datab_0(mask_value_13),
		.datab_1(mask_value_14),
		.datab_2(mask_value_15),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_5),
		.result(resultado_producto_suma_5)
	);
	
	
	
//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_6 (
		.clock0(clk),
		.dataa_0(cociente_16),
		.dataa_1(cociente_17),
		.dataa_2(cociente_18),
		.datab_0(mask_value_16),
		.datab_1(mask_value_17),
		.datab_2(mask_value_18),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_5),
		.result(resultado_producto_suma_6)
	);
	
	
	
//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_7 (
		.clock0(clk),
		.dataa_0(cociente_19),
		.dataa_1(cociente_20),
		.dataa_2(cociente_21),
		.datab_0(mask_value_19),
		.datab_1(mask_value_20),
		.datab_2(mask_value_21),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_5),
		.result(resultado_producto_suma_7)
	);
	
	
//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_8 (
		.clock0(clk),
		.dataa_0(cociente_22),
		.dataa_1(cociente_23),
		.dataa_2(cociente_24),
		.datab_0(mask_value_22),
		.datab_1(mask_value_23),
		.datab_2(mask_value_24),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_5),
		.result(resultado_producto_suma_8)
	);
	
	
//=========================================================================	
	
	multiplicador_sumador_3_lanes multiplicador_sumador_9 (
		.clock0(clk),
		.dataa_0(cociente_25),
		.dataa_1(),
		.dataa_2(),
		.datab_0(mask_value_25),
		.datab_1(),
		.datab_2(),
		.ena0(habilitar_multiplicadores & habilitar_multiplicadores_mask_5),
		.result(resultado_producto_suma_9)
	);
		



//=========================================================================


	sumador_3_lanes sumador1(
			.dataa(resultado_producto_suma_1),
			.datab(resultado_producto_suma_2),
			.result(resultado_suma_1)
		);

//=========================================================================


	sumador_3_lanes sumador2(
			.dataa(resultado_producto_suma_4),
			.datab(resultado_producto_suma_5),
			.result(resultado_suma_2)
		);


//=========================================================================


	sumador_3_lanes sumador3(
			.dataa(resultado_producto_suma_7),
			.datab(resultado_producto_suma_8),
			.result(resultado_suma_3)
		);



//=========================================================================


	sumador_3_lanes sumador4(
			.dataa(resultado_suma_1),
			.datab(resultado_producto_suma_3),
			.result(resultado_suma_4)
		);


//=========================================================================


	sumador_3_lanes sumador5(
			.dataa(resultado_suma_2),
			.datab(resultado_producto_suma_6),
			.result(resultado_suma_5)
		);


//=========================================================================


	sumador_3_lanes sumador6(
			.dataa(resultado_suma_3),
			.datab(resultado_producto_suma_9),
			.result(resultado_suma_6)
		);


//=========================================================================


	sumador_3_lanes sumador7(
			.dataa(resultado_suma_4),
			.datab(resultado_suma_5),
			.result(resultado_suma_7)
		);


//=========================================================================


	sumador_3_lanes sumador8(
			.dataa(resultado_suma_6),
			.datab(resultado_suma_7),
			.result(resultado_suma_8)
		);






endmodule








