/*


modulo que se encarga de tomar los valores que han sido escritos en los registros
del modulo 'control_mascara' y realizar las lecturas de memoria correspondientes para
obtener los valores de la mascara que se aplicara a la imagen del sistema.

Un grupo de senales vienen del control de la mascara con los valores escritos, otro
grupo son las senales que hablan con el controlador de memoria.

Al final lo que se llena es una memoria de valores, la memoria esta distribuida
en palabras de 4 bytes, por cada palabra se obtienen tres elementos de la matriz. De
esta forma al conjunto de registros se les asigna un grupo, cada tres registros
pertenecen a un grupo, segun el tamano de la mascara, asi sera la cantidad de lecturas
que se hagan a memoria, por cada lectura se llena un grupo de registros (3 regs). 
La logica consiste basicamente en leer a partir de la direccion de memoria una cierta
cantidad de palabras para llenar los registros que permitan tener una mascara de tamano
deseado

posibles errres:

1- que el valor de tamano_mascara no sea indicado, las lecturas de memoria no se
haran correctamente

*/

module mascara_filtro
#(
	parameter BITS_MASCARA = 3,
	parameter BITS_DIRECCION_MEM = 10,
	parameter BITS_ELEMENTO_MASCARA = 10,
	parameter BITS_MEMORY_WORD = 32
)
(
	input clk,
	input reset,
	
	//datos que provienen del control de la mascara
	input [BITS_MASCARA-1:0] tamano_mascara,
	input [BITS_DIRECCION_MEM-1:0] direccion_mem_inicio_mascara,
	input iniciar_lectura,
	
	//senales que van o vienen directo del controlador de memoria 
	
	//entrada proveniente del controlador de memoria que
	// indica que la operacion de lectura ha sido concluida
	input lectura_completada,
	input [BITS_MEMORY_WORD-1:0] datos_memoria,
	// 
	output [BITS_DIRECCION_MEM-1:0] direccion_mem_fisica,
	output leer,
	
	// salida que indica si se ha leido al menos una mascara completa de memoria
	output mascara_valida,
	
	
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_1,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_2,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_3,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_4,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_5,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_6,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_7,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_8,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_9,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_10,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_11,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_12,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_13,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_14,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_15,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_16,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_17,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_18,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_19,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_20,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_21,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_22,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_23,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_24,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_25,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_26,
	output [BITS_ELEMENTO_MASCARA-1:0] valor_mascara_27
	
	
	
);

	
	// cantidad de grupos de registros totales
	localparam GRUPOS_DE_REGISTROS = 17;
	
	// bits para mantener el contador de lecturas de memoria
	localparam BITS_CONTADOR_LECTURAS_MEM = 5;

//=========================================================================
	 reg [2:0] e_actual, e_siguiente;
	 
	 
	 /* La cantidad de lecturas para llenar la matriz
	 que compone la mascara depende de como este definida
	 la memoria a la cual se va a estar accediendo. Para el caso
	 actual la memoria consiste en palabras de 4 bytes (32bits).
	 En cada palabra se van a guardar 3 valores de 10 bits para
	 la matriz. Suponiendo ademas que se puede usar un valor
	 extra para dividir, en caso de filtros lineales
	 */
	 reg [BITS_CONTADOR_LECTURAS_MEM-1:0] cantidad_lecturas_memoria;

	 // bus que lleva la cantidad de lecturas de memoria
	 wire [BITS_CONTADOR_LECTURAS_MEM-1:0] conteo_lecturas_memoria;
	 
	 // pulso que indica cuando se han leido todos los valores de la mascara
	 wire mascara_leida;
	 
	 // bus en el que cada bit sirve para habilitar un grupo de los registros
	 // que guardan valores de la mascara
	 wire [GRUPOS_DE_REGISTROS-1:0] habilitacion_registros;
	 
	 // bus que lleva al valor de la proxima habilitacion de regs
	 wire [GRUPOS_DE_REGISTROS-1:0] habilitacion_registros_siguiente;
	 
	 // pulso que indica que se puede actualizar al siguiente grupo de regs
	 wire habilitar_siguiente_grupo;
	 
	 // pulso que en alto co-ayuda junto al bus 'habilitacion_registros'
	 // a elegir cuales registros guardaran datos que vengan de memoria
	 wire hablitacion_escritura_grupos;
	 
	 wire guardar_direccion_memoria;
	 
	 // pulso que indica que se debe de aumentar la cantidad de 
	 // de valores de la mascara que deben de leerse
	 wire contar_lectura_memoria;
	 
	 wire actualizar_direccion_memoria;
	 
	 
	 localparam 
		E_INICIO				= 0,
		E_LECTURA			= 1,
		E_ESPERA_LECTURA	= 2,
		E_VERIFICAR			= 3,
		E_CARGADO			= 4;
		
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
				if(iniciar_lectura) begin
					e_siguiente = E_LECTURA;
				end
			end
			E_LECTURA: begin
				e_siguiente = E_ESPERA_LECTURA;
			end
			E_ESPERA_LECTURA: begin
				if(lectura_completada) begin
					e_siguiente = E_VERIFICAR;
				end
			end
			E_VERIFICAR: begin
				if(mascara_leida) begin
					e_siguiente = E_CARGADO;
				end else begin
					e_siguiente = E_LECTURA;
				end
			end
			E_CARGADO: begin
				
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end

//==========================================================================	

	always@(tamano_mascara) begin
		case(tamano_mascara)
			3:
				cantidad_lecturas_memoria = 4;
			5:
				cantidad_lecturas_memoria = 9;
			7:
				cantidad_lecturas_memoria = 17;
			default:
				cantidad_lecturas_memoria = 1;
		endcase
	end


//==========================================================================	
	
	registro_sumador_dinamico direccion_memoria (
	 .clk(clk), 
	 .reset(reset),
	 .base(direccion_mem_inicio_mascara),
	 .guardar(guardar_direccion_memoria),
	 .sumar(actualizar_direccion_memoria),
	 .resultado(direccion_mem_fisica)
	);
	
	// se suma 4 porque la memoria esta alineada a 4 bytes, es de 32bits x palabra
	defparam direccion_memoria.CANTIDAD_SUMA = 4;
	defparam direccion_memoria.BITS_DATOS = BITS_DIRECCION_MEM;
	

//==========================================================================	
	
	// predeterminadamente el registro inicia en cero
	registro_sumador contador_lecturas_memoria (
	 .clk(clk), 
	 .reset(reset),	 
	 .sumar(contar_lectura_memoria),
	 .resultado(conteo_lecturas_memoria)
	);
	
	defparam contador_lecturas_memoria.CANTIDAD_SUMA = 1;
	// el maximo de lecturas para la implementacion actual es 17
	// con 5 bits se cumple 
	defparam contador_lecturas_memoria.BITS_DATOS = BITS_CONTADOR_LECTURAS_MEM;

	
//==========================================================================	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_habilitacion(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitar_siguiente_grupo),
		 .datos_entrada(habilitacion_registros_siguiente),
		 .datos_salida(habilitacion_registros)
		 );	
		 
	defparam ff_habilitacion.VALOR_EN_RESET = 1;	
	defparam ff_habilitacion.BITS_EN_REGISTRO = GRUPOS_DE_REGISTROS;	

//==========================================================================
	
	assign guardar_direccion_memoria = iniciar_lectura;
	
	assign leer = (e_actual == E_LECTURA);
	
	assign hablitacion_escritura_grupos = lectura_completada & ~mascara_leida;
	
	assign contar_lectura_memoria = lectura_completada & ~mascara_leida;

	assign habilitacion_registros_siguiente = habilitacion_registros << 1; 
	
	assign habilitar_siguiente_grupo = (e_actual == E_VERIFICAR);
	
	assign actualizar_direccion_memoria = (e_actual == E_VERIFICAR);
	
	assign mascara_valida = (e_actual == E_CARGADO);
	
	// pulso que indica que se ha leido la mascara por completo
	assign mascara_leida = (conteo_lecturas_memoria == cantidad_lecturas_memoria);
	

//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

//					Inicio de los registros que guardan los valores de la mascara
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************



	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_1(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(	[0] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_1)
		 );	
	
	defparam ff_1_grupo_1.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_1(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[0] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_2)
		 );	
	
	defparam ff_2_grupo_1.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;



	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_1(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[0] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_3)
		 );	
	
	defparam ff_3_grupo_1.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_2(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[1] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_6)
		 );	
	
	defparam ff_1_grupo_2.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_2(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[1] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_7)
		 );	
	
	defparam ff_2_grupo_2.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;

	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_2(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[1] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_8)
		 );	
	
	defparam ff_3_grupo_2.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_3(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[2] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_11)
		 );	
	
	defparam ff_1_grupo_3.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_3(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[2] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_12)
		 );	
	
	defparam ff_2_grupo_3.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;

	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_3(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[2] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_13)
		 );	
	
	defparam ff_3_grupo_3.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;		
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_4(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[3] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_4)
		 );	
	
	defparam ff_1_grupo_4.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;	
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_4(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[3] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_5)
		 );	
	
	defparam ff_2_grupo_4.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;

	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_4(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[3] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_9)
		 );	
	
	defparam ff_3_grupo_4.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;		
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_5(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[4] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_10)
		 );	
	
	defparam ff_1_grupo_5.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_5(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[4] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_14)
		 );	
	
	defparam ff_2_grupo_5.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;

	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_5(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[4] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_15)
		 );	
	
	defparam ff_3_grupo_5.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;	
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_6(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[5] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_16)
		 );	
	
	defparam ff_1_grupo_6.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;	
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_6(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[5] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_17)
		 );	
	
	defparam ff_2_grupo_6.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;

	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_6(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[5] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_18)
		 );	
	
	defparam ff_3_grupo_6.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;	


	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_7(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[6] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_19)
		 );	
	
	defparam ff_1_grupo_7.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;	
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_7(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[6] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_20)
		 );	
	
	defparam ff_2_grupo_7.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;

	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_7(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[6] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_21)
		 );	
	
	defparam ff_3_grupo_7.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;	


	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_8(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[7] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_22)
		 );	
	
	defparam ff_1_grupo_8.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_8(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[7] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_23)
		 );	
	
	defparam ff_2_grupo_8.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;

	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_8(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[7] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_24)
		 );	
	
	defparam ff_3_grupo_8.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;

	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_1_grupo_9(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[8] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[29:20]),
		 .datos_salida(valor_mascara_25)
		 );	
	
	defparam ff_1_grupo_9.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;
	
	
	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_2_grupo_9(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[8] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[19:10]),
		 .datos_salida(valor_mascara_26)
		 );	
	
	defparam ff_2_grupo_9.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA;

	// registro que guarda el tamano de la mascara
	FlipFlopD_Habilitado ff_3_grupo_9(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitacion_registros[8] && hablitacion_escritura_grupos),
		 .datos_entrada(datos_memoria[9:0]),
		 .datos_salida(valor_mascara_27)
		 );	
	
	defparam ff_3_grupo_9.BITS_EN_REGISTRO = BITS_ELEMENTO_MASCARA	;	
	
	
	
endmodule




