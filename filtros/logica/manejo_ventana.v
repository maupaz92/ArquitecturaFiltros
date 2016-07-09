`timescale 1ns / 1ps




module manejo_ventana(
	
	clk,
	reset,
	iniciar_proceso,
	datos_mem,
	actualizar_ventana,
	transaccion_mem_completada,
	
	fila1,
	fila2,
	fila3,
	fila4,
	fila5,
	
	//seleccion_pixel,
	//ventana_completa,
	//byte_mayor,
	//actualizar_pos_mem,
	
	leer_mem,
	liberar_bus_mem,
	direccion_mem
	
    );
	 
	parameter BITS_FILA = 64;
	parameter COLUMNA_MEM = 0;
	parameter BITS_DIRECCION_MEM = 17;
	parameter SUMA_SIG_FILA = 256;


	input clk;
	input reset;
	input iniciar_proceso;
	input actualizar_ventana;
	input [BITS_FILA-1:0] datos_mem;
	input transaccion_mem_completada;
	
	
	output [BITS_FILA-1:0] fila1;
	output [BITS_FILA-1:0] fila2;
	output [BITS_FILA-1:0] fila3;
	output [BITS_FILA-1:0] fila4;
	output [BITS_FILA-1:0] fila5;

	output leer_mem;
	output liberar_bus_mem;
	output [BITS_DIRECCION_MEM-1:0] direccion_mem;	

//=========================================================================

	wire cuenta_filas_concluida;
	wire aumentar_conteo_filas;
	wire guardar_fila_obtenida;
	wire actualizar_pos_mem;

	
/*
CONTEXTO
==========================================================================

*/
	registro_sumador direcciones_memoria (
		 .clk(clk), 
		 .reset(reset), 
		 .sumar(actualizar_pos_mem),
		 .resultado(direccion_mem)
		 );

	defparam direcciones_memoria.INICIO_REGISTRO = COLUMNA_MEM;
	defparam direcciones_memoria.CANTIDAD_SUMA = SUMA_SIG_FILA;
	defparam direcciones_memoria.BITS_DATOS = BITS_DIRECCION_MEM;	
	
	
	
/*
CONTEXTO
==========================================================================

*/	

	FSM_control_llenado_ventana control_ventana (
		 
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar(iniciar_proceso), 
		 .filas_obtenidas(cuenta_filas_concluida),
		 .actualizar_ventana(actualizar_ventana),
		 .dato_leido_disponible(transaccion_mem_completada),
		 
		 //salidas
		 
		 .leer_dato(leer_mem),		 
		 .actualizar_pos_mem(actualizar_pos_mem), 
		 .aumentar_conteo_filas(aumentar_conteo_filas), 
		 .guardar_fila(guardar_fila_obtenida),		 
		 .liberar_bus_mem(liberar_bus_mem)
		 
		 //.ventana_completa()
		 );

	

/*
CONTEXTO
==========================================================================
Se encarga de contar la cantidad de filas que han sido guardadas en la ventana.
Una vez que alcance el valor de 5, activara su salida indicando que el valor
limite que se queria alcanzar(5) ha sido obtenido.
*/	
	contador_pulsos contador_filas (
		 .clk(clk), 
		 .reset(reset), 
		 .habilitar_cuenta(aumentar_conteo_filas), 
		 .cuenta_finalizada(cuenta_filas_concluida)
		 );
		 
	defparam contador_filas.BITS_PARA_CUENTA = 3;
	defparam contador_filas.CUENTA_LIMITE = 5;

/*
CONTEXTO
==========================================================================
Especie de banco de registros que guardan los datos de 40 bytes, distribuidos
de forma 8bytes x 5 registros. La palabra de 8 bytes viene directamente de los
datos leidos de memoria. En cada pulso de guardar_fila el modulo automaticamente
activa el siguiente registro para guardar los datos. Se debe utilizar otro modulo
para evitar sobreescribir datos, en este caso el contador de 5 filas.
*/	
	ventana_5x8 ventana (
		 .clk(clk), 
		 .reset(reset), 
		 .guardar(guardar_fila_obtenida), 
		 .datos_entrada(datos_mem), 
		 .fila_1(fila1), 
		 .fila_2(fila2), 
		 .fila_3(fila3), 
		 .fila_4(fila4), 
		 .fila_5(fila5)
		 );


	
endmodule


