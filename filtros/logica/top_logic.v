
module top_logic(
	clk,
	reset,
	iniciar,
	datos_leidos_port1,
	datos_leidos_port2,
	transaccion_completada_port1,
	transaccion_completada_port2,
	//
	leer_port1,
	leer_port2,
	direccion_port1,
	direccion_port2,
	escribir_port1,
	escribir_port2,
	datos_escribir_port1,
	datos_escribir_port2

    );
	 
	//parameter BITS_DIRECCION = 17;
	parameter BITS_DIRECCION_P1 = 18;
	parameter BITS_DIRECCION_P2 = 17;
	parameter BITS_PALABRA = 64;
	parameter BITS_DATOS = 8;
	 
//=========================================================================

	input clk;
	input reset;
	input iniciar;
	
	input [BITS_PALABRA-1:0] datos_leidos_port1;
	input [BITS_PALABRA-1:0] datos_leidos_port2;
	
	input transaccion_completada_port1;
	input transaccion_completada_port2;
	
	
	output leer_port1;
	output leer_port2;
	output [BITS_DIRECCION_P1-1:0] direccion_port1;
	output [BITS_DIRECCION_P2-1:0] direccion_port2;
	
	
	output escribir_port1;
	output escribir_port2;
	output [BITS_PALABRA-1:0] datos_escribir_port1;
	output [BITS_PALABRA-1:0] datos_escribir_port2;
	
	
	
//=========================================================================


/*	 senales que llevan el valor de la
	 posicion de memoria que quiere
	 acceder cada ventana
*/	
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v1;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v2;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v3;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v4;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v5;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v6;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v7;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v8;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v9;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v10;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v11;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v12;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v13;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v14;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v15;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v16;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v17;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v18;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v19;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v20;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v21;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v22;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v23;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v24;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v25;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v26;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v27;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v28;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v29;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v30;
	wire [BITS_DIRECCION_P1-1:0] direccion_mem_v31;
	wire [BITS_DIRECCION_P2-1:0] direccion_mem_v32;
	
	
	
	// salidas de los bancos de registros
	
	wire [BITS_PALABRA-1:0] fila1_v1;
	wire [BITS_PALABRA-1:0] fila2_v1;
	wire [BITS_PALABRA-1:0] fila3_v1;
	wire [BITS_PALABRA-1:0] fila4_v1;
	wire [BITS_PALABRA-1:0] fila5_v1;
	
	wire [BITS_PALABRA-1:0] fila1_v2;
	wire [BITS_PALABRA-1:0] fila2_v2;
	wire [BITS_PALABRA-1:0] fila3_v2;
	wire [BITS_PALABRA-1:0] fila4_v2;
	wire [BITS_PALABRA-1:0] fila5_v2;
	
	wire [BITS_PALABRA-1:0] fila1_v3;
	wire [BITS_PALABRA-1:0] fila2_v3;
	wire [BITS_PALABRA-1:0] fila3_v3;
	wire [BITS_PALABRA-1:0] fila4_v3;
	wire [BITS_PALABRA-1:0] fila5_v3;
	
	wire [BITS_PALABRA-1:0] fila1_v4;
	wire [BITS_PALABRA-1:0] fila2_v4;
	wire [BITS_PALABRA-1:0] fila3_v4;
	wire [BITS_PALABRA-1:0] fila4_v4;
	wire [BITS_PALABRA-1:0] fila5_v4;
	
	wire [BITS_PALABRA-1:0] fila1_v5;
	wire [BITS_PALABRA-1:0] fila2_v5;
	wire [BITS_PALABRA-1:0] fila3_v5;
	wire [BITS_PALABRA-1:0] fila4_v5;
	wire [BITS_PALABRA-1:0] fila5_v5;
	
	wire [BITS_PALABRA-1:0] fila1_v6;
	wire [BITS_PALABRA-1:0] fila2_v6;
	wire [BITS_PALABRA-1:0] fila3_v6;
	wire [BITS_PALABRA-1:0] fila4_v6;
	wire [BITS_PALABRA-1:0] fila5_v6;
	
	wire [BITS_PALABRA-1:0] fila1_v7;
	wire [BITS_PALABRA-1:0] fila2_v7;
	wire [BITS_PALABRA-1:0] fila3_v7;
	wire [BITS_PALABRA-1:0] fila4_v7;
	wire [BITS_PALABRA-1:0] fila5_v7;
	
	wire [BITS_PALABRA-1:0] fila1_v8;
	wire [BITS_PALABRA-1:0] fila2_v8;
	wire [BITS_PALABRA-1:0] fila3_v8;
	wire [BITS_PALABRA-1:0] fila4_v8;
	wire [BITS_PALABRA-1:0] fila5_v8;
	
	wire [BITS_PALABRA-1:0] fila1_v9;
	wire [BITS_PALABRA-1:0] fila2_v9;
	wire [BITS_PALABRA-1:0] fila3_v9;
	wire [BITS_PALABRA-1:0] fila4_v9;
	wire [BITS_PALABRA-1:0] fila5_v9;
	
	wire [BITS_PALABRA-1:0] fila1_v10;
	wire [BITS_PALABRA-1:0] fila2_v10;
	wire [BITS_PALABRA-1:0] fila3_v10;
	wire [BITS_PALABRA-1:0] fila4_v10;
	wire [BITS_PALABRA-1:0] fila5_v10;
	
	wire [BITS_PALABRA-1:0] fila1_v11;
	wire [BITS_PALABRA-1:0] fila2_v11;
	wire [BITS_PALABRA-1:0] fila3_v11;
	wire [BITS_PALABRA-1:0] fila4_v11;
	wire [BITS_PALABRA-1:0] fila5_v11;
	
	wire [BITS_PALABRA-1:0] fila1_v12;
	wire [BITS_PALABRA-1:0] fila2_v12;
	wire [BITS_PALABRA-1:0] fila3_v12;
	wire [BITS_PALABRA-1:0] fila4_v12;
	wire [BITS_PALABRA-1:0] fila5_v12;
	
	wire [BITS_PALABRA-1:0] fila1_v13;
	wire [BITS_PALABRA-1:0] fila2_v13;
	wire [BITS_PALABRA-1:0] fila3_v13;
	wire [BITS_PALABRA-1:0] fila4_v13;
	wire [BITS_PALABRA-1:0] fila5_v13;
	
	wire [BITS_PALABRA-1:0] fila1_v14;
	wire [BITS_PALABRA-1:0] fila2_v14;
	wire [BITS_PALABRA-1:0] fila3_v14;
	wire [BITS_PALABRA-1:0] fila4_v14;
	wire [BITS_PALABRA-1:0] fila5_v14;
	
	wire [BITS_PALABRA-1:0] fila1_v15;
	wire [BITS_PALABRA-1:0] fila2_v15;
	wire [BITS_PALABRA-1:0] fila3_v15;
	wire [BITS_PALABRA-1:0] fila4_v15;
	wire [BITS_PALABRA-1:0] fila5_v15;
	
	wire [BITS_PALABRA-1:0] fila1_v16;
	wire [BITS_PALABRA-1:0] fila2_v16;
	wire [BITS_PALABRA-1:0] fila3_v16;
	wire [BITS_PALABRA-1:0] fila4_v16;
	wire [BITS_PALABRA-1:0] fila5_v16;
	
	wire [BITS_PALABRA-1:0] fila1_v17;
	wire [BITS_PALABRA-1:0] fila2_v17;
	wire [BITS_PALABRA-1:0] fila3_v17;
	wire [BITS_PALABRA-1:0] fila4_v17;
	wire [BITS_PALABRA-1:0] fila5_v17;
	
	wire [BITS_PALABRA-1:0] fila1_v18;
	wire [BITS_PALABRA-1:0] fila2_v18;
	wire [BITS_PALABRA-1:0] fila3_v18;
	wire [BITS_PALABRA-1:0] fila4_v18;
	wire [BITS_PALABRA-1:0] fila5_v18;
	
	wire [BITS_PALABRA-1:0] fila1_v19;
	wire [BITS_PALABRA-1:0] fila2_v19;
	wire [BITS_PALABRA-1:0] fila3_v19;
	wire [BITS_PALABRA-1:0] fila4_v19;
	wire [BITS_PALABRA-1:0] fila5_v19;
	
	wire [BITS_PALABRA-1:0] fila1_v20;
	wire [BITS_PALABRA-1:0] fila2_v20;
	wire [BITS_PALABRA-1:0] fila3_v20;
	wire [BITS_PALABRA-1:0] fila4_v20;
	wire [BITS_PALABRA-1:0] fila5_v20;
	
	wire [BITS_PALABRA-1:0] fila1_v21;
	wire [BITS_PALABRA-1:0] fila2_v21;
	wire [BITS_PALABRA-1:0] fila3_v21;
	wire [BITS_PALABRA-1:0] fila4_v21;
	wire [BITS_PALABRA-1:0] fila5_v21;
	
	wire [BITS_PALABRA-1:0] fila1_v22;
	wire [BITS_PALABRA-1:0] fila2_v22;
	wire [BITS_PALABRA-1:0] fila3_v22;
	wire [BITS_PALABRA-1:0] fila4_v22;
	wire [BITS_PALABRA-1:0] fila5_v22;
	
	wire [BITS_PALABRA-1:0] fila1_v23;
	wire [BITS_PALABRA-1:0] fila2_v23;
	wire [BITS_PALABRA-1:0] fila3_v23;
	wire [BITS_PALABRA-1:0] fila4_v23;
	wire [BITS_PALABRA-1:0] fila5_v23;
	
	wire [BITS_PALABRA-1:0] fila1_v24;
	wire [BITS_PALABRA-1:0] fila2_v24;
	wire [BITS_PALABRA-1:0] fila3_v24;
	wire [BITS_PALABRA-1:0] fila4_v24;
	wire [BITS_PALABRA-1:0] fila5_v24;
	
	wire [BITS_PALABRA-1:0] fila1_v25;
	wire [BITS_PALABRA-1:0] fila2_v25;
	wire [BITS_PALABRA-1:0] fila3_v25;
	wire [BITS_PALABRA-1:0] fila4_v25;
	wire [BITS_PALABRA-1:0] fila5_v25;
	
	wire [BITS_PALABRA-1:0] fila1_v26;
	wire [BITS_PALABRA-1:0] fila2_v26;
	wire [BITS_PALABRA-1:0] fila3_v26;
	wire [BITS_PALABRA-1:0] fila4_v26;
	wire [BITS_PALABRA-1:0] fila5_v26;
	
	wire [BITS_PALABRA-1:0] fila1_v27;
	wire [BITS_PALABRA-1:0] fila2_v27;
	wire [BITS_PALABRA-1:0] fila3_v27;
	wire [BITS_PALABRA-1:0] fila4_v27;
	wire [BITS_PALABRA-1:0] fila5_v27;
	
	wire [BITS_PALABRA-1:0] fila1_v28;
	wire [BITS_PALABRA-1:0] fila2_v28;
	wire [BITS_PALABRA-1:0] fila3_v28;
	wire [BITS_PALABRA-1:0] fila4_v28;
	wire [BITS_PALABRA-1:0] fila5_v28;
	
	wire [BITS_PALABRA-1:0] fila1_v29;
	wire [BITS_PALABRA-1:0] fila2_v29;
	wire [BITS_PALABRA-1:0] fila3_v29;
	wire [BITS_PALABRA-1:0] fila4_v29;
	wire [BITS_PALABRA-1:0] fila5_v29;
	
	wire [BITS_PALABRA-1:0] fila1_v30;
	wire [BITS_PALABRA-1:0] fila2_v30;
	wire [BITS_PALABRA-1:0] fila3_v30;
	wire [BITS_PALABRA-1:0] fila4_v30;
	wire [BITS_PALABRA-1:0] fila5_v30;
	
	wire [BITS_PALABRA-1:0] fila1_v31;
	wire [BITS_PALABRA-1:0] fila2_v31;
	wire [BITS_PALABRA-1:0] fila3_v31;
	wire [BITS_PALABRA-1:0] fila4_v31;
	wire [BITS_PALABRA-1:0] fila5_v31;
	
	wire [BITS_PALABRA-1:0] fila1_v32;
	wire [BITS_PALABRA-1:0] fila2_v32;
	wire [BITS_PALABRA-1:0] fila3_v32;
	wire [BITS_PALABRA-1:0] fila4_v32;
	wire [BITS_PALABRA-1:0] fila5_v32;
	
	
	
	

	// senales para cambiar los buses segun las ventanas que lo ocupen

	wire liberar_bus_mem_v1;
	wire liberar_bus_mem_v2;
	wire liberar_bus_mem_v3;
	wire liberar_bus_mem_v4;
	wire liberar_bus_mem_v5;
	wire liberar_bus_mem_v6;
	wire liberar_bus_mem_v7;
	wire liberar_bus_mem_v8;
	wire liberar_bus_mem_v9;
	wire liberar_bus_mem_v10;
	wire liberar_bus_mem_v11;
	wire liberar_bus_mem_v12;
	wire liberar_bus_mem_v13;
	wire liberar_bus_mem_v14;
	wire liberar_bus_mem_v15;
	wire liberar_bus_mem_v16;
	wire liberar_bus_mem_v17;
	wire liberar_bus_mem_v18;
	wire liberar_bus_mem_v19;
	wire liberar_bus_mem_v20;
	wire liberar_bus_mem_v21;
	wire liberar_bus_mem_v22;
	wire liberar_bus_mem_v23;
	wire liberar_bus_mem_v24;
	wire liberar_bus_mem_v25;
	wire liberar_bus_mem_v26;
	wire liberar_bus_mem_v27;
	wire liberar_bus_mem_v28;
	wire liberar_bus_mem_v29;
	wire liberar_bus_mem_v30;
	wire liberar_bus_mem_v31;
	wire liberar_bus_mem_v32;
	
	wire liberar_bus_v1_v2;
	wire liberar_bus_v3_v4;
	wire liberar_bus_v5_v6;
	wire liberar_bus_v7_v8;
	wire liberar_bus_v9_v10;
	wire liberar_bus_v11_v12;
	wire liberar_bus_v13_v14;
	wire liberar_bus_v15_v16;
	wire liberar_bus_v17_v18;
	wire liberar_bus_v19_v20;
	wire liberar_bus_v21_v22;
	wire liberar_bus_v23_v24;
	wire liberar_bus_v25_v26;
	wire liberar_bus_v27_v28;
	wire liberar_bus_v29_v30;
	wire liberar_bus_v31_v32;
	
	
	wire liberar_bus;
	
	// senales para habilitar las siguientes ventanas
	
	wire habilitar_v3_v4;
	wire habilitar_v5_v6;
	wire habilitar_v7_v8;
	wire habilitar_v9_v10;
	wire habilitar_v11_v12;
	wire habilitar_v13_v14;
	wire habilitar_v15_v16;
	wire habilitar_v17_v18;
	wire habilitar_v19_v20;
	wire habilitar_v21_v22;
	wire habilitar_v23_v24;
	wire habilitar_v25_v26;
	wire habilitar_v27_v28;
	wire habilitar_v29_v30;
	wire habilitar_v31_v32;
	
	// senales para iniciar lectura
	
	wire leer_v1;
	wire leer_v2;
	wire leer_v3;
	wire leer_v4;
	wire leer_v5;
	wire leer_v6;
	wire leer_v7;
	wire leer_v8;
	wire leer_v9;
	wire leer_v10;
	wire leer_v11;
	wire leer_v12;
	wire leer_v13;
	wire leer_v14;
	wire leer_v15;
	wire leer_v16;
	wire leer_v17;
	wire leer_v18;
	wire leer_v19;
	wire leer_v20;
	wire leer_v21;
	wire leer_v22;
	wire leer_v23;
	wire leer_v24;
	wire leer_v25;
	wire leer_v26;
	wire leer_v27;
	wire leer_v28;
	wire leer_v29;
	wire leer_v30;
	wire leer_v31;
	wire leer_v32;
	
	// pulso que indica que se debe contar una fila procesada
	wire contar_fila_procesada;
	// pulso que indica que todas las filas han sido procesadas
	wire proceso_filas_completado;
	// pulso que indica que se debe inicar el proceso de un siguiente fila
	wire procesar_sig_fila;
	
	wire actualizar_bus_mem;
	wire seleccion_bus_memoria;
	wire [3:0] bus_mem_permitido;	
	
	
	wire [BITS_DIRECCION_P1-1:0] direcciones_lectura_1;
	wire [BITS_DIRECCION_P2-1:0] direcciones_lectura_2;
	
	
	//########################################

	wire iniciar_escritura;
	
	wire escribir_memoria;
	wire escrituras_completadas;
	
	wire seleccion_bus_memoria_final;
	
	wire [BITS_DIRECCION_P1-1:0] direcciones_escritura_1;
	wire [BITS_DIRECCION_P2-1:0] direcciones_escritura_2;
	
	// pulso que indica que se ha escrito una ventana
	wire contar_columna_procesada;
	// pulso que indica cuando se han escritos todas las ventanas listas
	wire conteo_cols_procesadas;
	// pulso que actualiza el valor de las filas
	wire sumar_siguiente_fila;
	
	wire actualizar_dir_col;
	wire reiniciar_conteo_columnas;
	wire guardar_fila;
	
	wire [BITS_DIRECCION_P1-1:0] direccion_fila_actual_p1;
	wire [BITS_DIRECCION_P2-1:0] direccion_fila_actual_p2;
	
		
	wire [3:0] seleccion_datos_escribir_mem;
	wire actualizar_selec_data_escr_mem;
	
	wire proceso_escritura_terminado;
	
	
	assign escribir_port1 = escribir_memoria;
	assign escribir_port2 = escribir_memoria;	
	
	
	

	
/*
CONTEXTO
==========================================================================

*/

	manejo_ventana v_1 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(iniciar),
		.actualizar_ventana(procesar_sig_fila),
		
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v1),
		
		.fila1(fila1_v1),
		.fila2(fila2_v1),
		.fila3(fila3_v1),
		.fila4(fila4_v1),
		.fila5(fila5_v1),
		.liberar_bus_mem(liberar_bus_mem_v1),
		.direccion_mem(direccion_mem_v1)
		
		 );

	defparam v_1.COLUMNA_MEM = 131072;
	defparam v_1.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;
 
		 
/*
CONTEXTO
==========================================================================

*/

	manejo_ventana v_2 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(iniciar),
		.actualizar_ventana(procesar_sig_fila),
		
		.datos_mem(datos_leidos_port2),
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v2),
		
		.fila1(fila1_v2),
		.fila2(fila2_v2),
		.fila3(fila3_v2),
		.fila4(fila4_v2),
		.fila5(fila5_v2),		
		
		.liberar_bus_mem(liberar_bus_mem_v2),
		.direccion_mem(direccion_mem_v2)

		 );
		 
	defparam v_2.COLUMNA_MEM = 8;
	defparam v_2.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;
		 
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_1(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v1),
		.liberar_2(liberar_bus_mem_v2),
		.liberar_bus(liberar_bus_v1_v2),
		.habilitar_siguiente(habilitar_v3_v4)
	);



/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_3 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v3_v4), 
		.actualizar_ventana(habilitar_v3_v4),
		
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v3),
		
		.fila1(fila1_v3),
		.fila2(fila2_v3),
		.fila3(fila3_v3),
		.fila4(fila4_v3),
		.fila5(fila5_v3),				
		
		.liberar_bus_mem(liberar_bus_mem_v3),
		.direccion_mem(direccion_mem_v3)

		 );
	
	defparam v_3.COLUMNA_MEM = 131088;
	defparam v_3.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_4 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v3_v4), 
		.actualizar_ventana(habilitar_v3_v4),
		
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v4),
		
		.fila1(fila1_v4),
		.fila2(fila2_v4),
		.fila3(fila3_v4),
		.fila4(fila4_v4),
		.fila5(fila5_v4),			
		.liberar_bus_mem(liberar_bus_mem_v4),
		.direccion_mem(direccion_mem_v4)

		 );

	defparam v_4.COLUMNA_MEM = 24;
	defparam v_4.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/	
	FSM_liberar_bus liberar_bus_2(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v3),
		.liberar_2(liberar_bus_mem_v4),
		.liberar_bus(liberar_bus_v3_v4),
		.habilitar_siguiente(habilitar_v5_v6)
	);
	


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_5 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v5_v6), 
		.actualizar_ventana(habilitar_v5_v6),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v5),
		.fila1(fila1_v5),
		.fila2(fila2_v5),
		.fila3(fila3_v5),
		.fila4(fila4_v5),
		.fila5(fila5_v5),				
		.liberar_bus_mem(liberar_bus_mem_v5),
		.direccion_mem(direccion_mem_v5)

		 );
	
	defparam v_5.COLUMNA_MEM = 131104;
	defparam v_5.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_6 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v5_v6), 
		.actualizar_ventana(habilitar_v5_v6),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v6),
		.fila1(fila1_v6),
		.fila2(fila2_v6),
		.fila3(fila3_v6),
		.fila4(fila4_v6),
		.fila5(fila5_v6),			
		.liberar_bus_mem(liberar_bus_mem_v6),
		.direccion_mem(direccion_mem_v6)

		 );

	defparam v_6.COLUMNA_MEM = 40;
	defparam v_6.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_3(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v5),
		.liberar_2(liberar_bus_mem_v6),
		.liberar_bus(liberar_bus_v5_v6),
		.habilitar_siguiente(habilitar_v7_v8)
	);
		
	
	
/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_7 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v7_v8), 
		.actualizar_ventana(habilitar_v7_v8),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v7),
		.fila1(fila1_v7),
		.fila2(fila2_v7),
		.fila3(fila3_v7),
		.fila4(fila4_v7),
		.fila5(fila5_v7),				
		.liberar_bus_mem(liberar_bus_mem_v7),
		.direccion_mem(direccion_mem_v7)

		 );
	
	defparam v_7.COLUMNA_MEM = 131120;
	defparam v_7.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_8 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v7_v8), 
		.actualizar_ventana(habilitar_v7_v8),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v8),
		.fila1(fila1_v8),
		.fila2(fila2_v8),
		.fila3(fila3_v8),
		.fila4(fila4_v8),
		.fila5(fila5_v8),			
		.liberar_bus_mem(liberar_bus_mem_v8),
		.direccion_mem(direccion_mem_v8)

		 );

	defparam v_8.COLUMNA_MEM = 56;
	defparam v_8.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_4(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v7),
		.liberar_2(liberar_bus_mem_v8),
		.liberar_bus(liberar_bus_v7_v8),
		.habilitar_siguiente(habilitar_v9_v10)
	);	
	
	
/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_9 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v9_v10), 
		.actualizar_ventana(habilitar_v9_v10),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v9),
		.fila1(fila1_v9),
		.fila2(fila2_v9),
		.fila3(fila3_v9),
		.fila4(fila4_v9),
		.fila5(fila5_v9),				
		.liberar_bus_mem(liberar_bus_mem_v9),
		.direccion_mem(direccion_mem_v9)

		 );
	
	defparam v_9.COLUMNA_MEM = 131136;
	defparam v_9.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_10 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v9_v10), 
		.actualizar_ventana(habilitar_v9_v10),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v10),
		.fila1(fila1_v10),
		.fila2(fila2_v10),
		.fila3(fila3_v10),
		.fila4(fila4_v10),
		.fila5(fila5_v10),			
		.liberar_bus_mem(liberar_bus_mem_v10),
		.direccion_mem(direccion_mem_v10)

		 );

	defparam v_10.COLUMNA_MEM = 72;
	defparam v_10.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_5(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v9),
		.liberar_2(liberar_bus_mem_v10),
		.liberar_bus(liberar_bus_v9_v10),
		.habilitar_siguiente(habilitar_v11_v12)
	);	
	


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_11 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v11_v12), 
		.actualizar_ventana(habilitar_v11_v12),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v11),
		.fila1(fila1_v11),
		.fila2(fila2_v11),
		.fila3(fila3_v11),
		.fila4(fila4_v11),
		.fila5(fila5_v11),				
		.liberar_bus_mem(liberar_bus_mem_v11),
		.direccion_mem(direccion_mem_v11)

		 );
	
	defparam v_11.COLUMNA_MEM = 131152;
	defparam v_11.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_12 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v11_v12), 
		.actualizar_ventana(habilitar_v11_v12),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v12),
		.fila1(fila1_v12),
		.fila2(fila2_v12),
		.fila3(fila3_v12),
		.fila4(fila4_v12),
		.fila5(fila5_v12),			
		.liberar_bus_mem(liberar_bus_mem_v12),
		.direccion_mem(direccion_mem_v12)

		 );

	defparam v_12.COLUMNA_MEM = 88;
	defparam v_12.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_6(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v11),
		.liberar_2(liberar_bus_mem_v12),
		.liberar_bus(liberar_bus_v11_v12),
		.habilitar_siguiente(habilitar_v13_v14)
	);	
	
	
/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_13 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v13_v14), 
		.actualizar_ventana(habilitar_v13_v14),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v13),
		.fila1(fila1_v13),
		.fila2(fila2_v13),
		.fila3(fila3_v13),
		.fila4(fila4_v13),
		.fila5(fila5_v13),				
		.liberar_bus_mem(liberar_bus_mem_v13),
		.direccion_mem(direccion_mem_v13)

		 );
	
	defparam v_13.COLUMNA_MEM = 131168;
	defparam v_13.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_14 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v13_v14), 
		.actualizar_ventana(habilitar_v13_v14),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v14),
		.fila1(fila1_v14),
		.fila2(fila2_v14),
		.fila3(fila3_v14),
		.fila4(fila4_v14),
		.fila5(fila5_v14),			
		.liberar_bus_mem(liberar_bus_mem_v14),
		.direccion_mem(direccion_mem_v14)

		 );

	defparam v_14.COLUMNA_MEM = 104;
	defparam v_14.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_7(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v13),
		.liberar_2(liberar_bus_mem_v14),
		.liberar_bus(liberar_bus_v13_v14),
		.habilitar_siguiente(habilitar_v15_v16)
	);	



/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_15 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v15_v16), 
		.actualizar_ventana(habilitar_v15_v16),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v15),
		.fila1(fila1_v15),
		.fila2(fila2_v15),
		.fila3(fila3_v15),
		.fila4(fila4_v15),
		.fila5(fila5_v15),				
		.liberar_bus_mem(liberar_bus_mem_v15),
		.direccion_mem(direccion_mem_v15)

		 );
	
	defparam v_15.COLUMNA_MEM = 131184;
	defparam v_15.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_16 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v15_v16), 
		.actualizar_ventana(habilitar_v15_v16),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v16),
		.fila1(fila1_v16),
		.fila2(fila2_v16),
		.fila3(fila3_v16),
		.fila4(fila4_v16),
		.fila5(fila5_v16),			
		.liberar_bus_mem(liberar_bus_mem_v16),
		.direccion_mem(direccion_mem_v16)

		 );

	defparam v_16.COLUMNA_MEM = 120;
	defparam v_16.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_8(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v15),
		.liberar_2(liberar_bus_mem_v16),
		.liberar_bus(liberar_bus_v15_v16),
		.habilitar_siguiente(habilitar_v17_v18)
	);	
	
/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_17 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v17_v18), 
		.actualizar_ventana(habilitar_v17_v18),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v17),
		.fila1(fila1_v17),
		.fila2(fila2_v17),
		.fila3(fila3_v17),
		.fila4(fila4_v17),
		.fila5(fila5_v17),				
		.liberar_bus_mem(liberar_bus_mem_v17),
		.direccion_mem(direccion_mem_v17)

		 );
	
	defparam v_17.COLUMNA_MEM = 131200;
	defparam v_17.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_18 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v17_v18), 
		.actualizar_ventana(habilitar_v17_v18),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v18),
		.fila1(fila1_v18),
		.fila2(fila2_v18),
		.fila3(fila3_v18),
		.fila4(fila4_v18),
		.fila5(fila5_v18),			
		.liberar_bus_mem(liberar_bus_mem_v18),
		.direccion_mem(direccion_mem_v18)

		 );

	defparam v_18.COLUMNA_MEM = 136;
	defparam v_18.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_9(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v17),
		.liberar_2(liberar_bus_mem_v18),
		.liberar_bus(liberar_bus_v17_v18),
		.habilitar_siguiente(habilitar_v19_v20)
	);	
	

/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_19 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v19_v20), 
		.actualizar_ventana(habilitar_v19_v20),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v19),
		.fila1(fila1_v19),
		.fila2(fila2_v19),
		.fila3(fila3_v19),
		.fila4(fila4_v19),
		.fila5(fila5_v19),				
		.liberar_bus_mem(liberar_bus_mem_v19),
		.direccion_mem(direccion_mem_v19)

		 );
	
	defparam v_19.COLUMNA_MEM = 131216;
	defparam v_19.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_20 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v19_v20), 
		.actualizar_ventana(habilitar_v19_v20),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v20),
		.fila1(fila1_v20),
		.fila2(fila2_v20),
		.fila3(fila3_v20),
		.fila4(fila4_v20),
		.fila5(fila5_v20),			
		.liberar_bus_mem(liberar_bus_mem_v20),
		.direccion_mem(direccion_mem_v20)

		 );

	defparam v_20.COLUMNA_MEM = 152;
	defparam v_20.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_10(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v19),
		.liberar_2(liberar_bus_mem_v20),
		.liberar_bus(liberar_bus_v19_v20),
		.habilitar_siguiente(habilitar_v21_v22)
	);	


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_21 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v21_v22), 
		.actualizar_ventana(habilitar_v21_v22),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v21),
		.fila1(fila1_v21),
		.fila2(fila2_v21),
		.fila3(fila3_v21),
		.fila4(fila4_v21),
		.fila5(fila5_v21),				
		.liberar_bus_mem(liberar_bus_mem_v21),
		.direccion_mem(direccion_mem_v21)

		 );
	
	defparam v_21.COLUMNA_MEM = 131232;
	defparam v_21.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_22 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v21_v22), 
		.actualizar_ventana(habilitar_v21_v22),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v22),
		.fila1(fila1_v22),
		.fila2(fila2_v22),
		.fila3(fila3_v22),
		.fila4(fila4_v22),
		.fila5(fila5_v22),			
		.liberar_bus_mem(liberar_bus_mem_v22),
		.direccion_mem(direccion_mem_v22)

		 );

	defparam v_22.COLUMNA_MEM = 168;
	defparam v_22.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_11(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v21),
		.liberar_2(liberar_bus_mem_v22),
		.liberar_bus(liberar_bus_v21_v22),
		.habilitar_siguiente(habilitar_v23_v24)
	);	

	
/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_23 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v23_v24), 
		.actualizar_ventana(habilitar_v23_v24),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v23),
		.fila1(fila1_v23),
		.fila2(fila2_v23),
		.fila3(fila3_v23),
		.fila4(fila4_v23),
		.fila5(fila5_v23),				
		.liberar_bus_mem(liberar_bus_mem_v23),
		.direccion_mem(direccion_mem_v23)

		 );
	
	defparam v_23.COLUMNA_MEM = 131248;
	defparam v_23.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_24 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v23_v24), 
		.actualizar_ventana(habilitar_v23_v24),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v24),
		.fila1(fila1_v24),
		.fila2(fila2_v24),
		.fila3(fila3_v24),
		.fila4(fila4_v24),
		.fila5(fila5_v24),			
		.liberar_bus_mem(liberar_bus_mem_v24),
		.direccion_mem(direccion_mem_v24)

		 );

	defparam v_24.COLUMNA_MEM = 184;
	defparam v_24.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_12(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v23),
		.liberar_2(liberar_bus_mem_v24),
		.liberar_bus(liberar_bus_v23_v24),
		.habilitar_siguiente(habilitar_v25_v26)
	);	


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_25 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v25_v26), 
		.actualizar_ventana(habilitar_v25_v26),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v25),
		.fila1(fila1_v25),
		.fila2(fila2_v25),
		.fila3(fila3_v25),
		.fila4(fila4_v25),
		.fila5(fila5_v25),				
		.liberar_bus_mem(liberar_bus_mem_v25),
		.direccion_mem(direccion_mem_v25)

		 );
	
	defparam v_25.COLUMNA_MEM = 131264;
	defparam v_25.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_26 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v25_v26), 
		.actualizar_ventana(habilitar_v25_v26),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v26),
		.fila1(fila1_v26),
		.fila2(fila2_v26),
		.fila3(fila3_v26),
		.fila4(fila4_v26),
		.fila5(fila5_v26),			
		.liberar_bus_mem(liberar_bus_mem_v26),
		.direccion_mem(direccion_mem_v26)

		 );

	defparam v_26.COLUMNA_MEM = 200;
	defparam v_26.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_13(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v25),
		.liberar_2(liberar_bus_mem_v26),
		.liberar_bus(liberar_bus_v25_v26),
		.habilitar_siguiente(habilitar_v27_v28)
	);	


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_27 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v27_v28), 
		.actualizar_ventana(habilitar_v27_v28),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v27),
		.fila1(fila1_v27),
		.fila2(fila2_v27),
		.fila3(fila3_v27),
		.fila4(fila4_v27),
		.fila5(fila5_v27),				
		.liberar_bus_mem(liberar_bus_mem_v27),
		.direccion_mem(direccion_mem_v27)

		 );
	
	defparam v_27.COLUMNA_MEM = 131280;
	defparam v_27.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_28 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v27_v28), 
		.actualizar_ventana(habilitar_v27_v28),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v28),
		.fila1(fila1_v28),
		.fila2(fila2_v28),
		.fila3(fila3_v28),
		.fila4(fila4_v28),
		.fila5(fila5_v28),			
		.liberar_bus_mem(liberar_bus_mem_v28),
		.direccion_mem(direccion_mem_v28)

		 );

	defparam v_28.COLUMNA_MEM = 216;
	defparam v_28.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_14(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v27),
		.liberar_2(liberar_bus_mem_v28),
		.liberar_bus(liberar_bus_v27_v28),
		.habilitar_siguiente(habilitar_v29_v30)
	);	
	

/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_29 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v29_v30), 
		.actualizar_ventana(habilitar_v29_v30),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v29),
		.fila1(fila1_v29),
		.fila2(fila2_v29),
		.fila3(fila3_v29),
		.fila4(fila4_v29),
		.fila5(fila5_v29),				
		.liberar_bus_mem(liberar_bus_mem_v29),
		.direccion_mem(direccion_mem_v29)

		 );
	
	defparam v_29.COLUMNA_MEM = 131296;
	defparam v_29.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_30 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v29_v30), 
		.actualizar_ventana(habilitar_v29_v30),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v30),
		.fila1(fila1_v30),
		.fila2(fila2_v30),
		.fila3(fila3_v30),
		.fila4(fila4_v30),
		.fila5(fila5_v30),			
		.liberar_bus_mem(liberar_bus_mem_v30),
		.direccion_mem(direccion_mem_v30)

		 );

	defparam v_30.COLUMNA_MEM = 232;
	defparam v_30.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_15(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v29),
		.liberar_2(liberar_bus_mem_v30),
		.liberar_bus(liberar_bus_v29_v30),
		.habilitar_siguiente(habilitar_v31_v32)
	);	


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_31 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v31_v32), 
		.actualizar_ventana(habilitar_v31_v32),
		.datos_mem(datos_leidos_port1),
		.transaccion_mem_completada(transaccion_completada_port1),
		//salidas
		.leer_mem(leer_v31),
		.fila1(fila1_v31),
		.fila2(fila2_v31),
		.fila3(fila3_v31),
		.fila4(fila4_v31),
		.fila5(fila5_v31),				
		.liberar_bus_mem(liberar_bus_mem_v31),
		.direccion_mem(direccion_mem_v31)

		 );
	
	defparam v_31.COLUMNA_MEM = 131312;
	defparam v_31.BITS_DIRECCION_MEM = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	manejo_ventana v_32 (
		.clk(clk), 
		.reset(reset), 
		.iniciar_proceso(habilitar_v31_v32), 
		.actualizar_ventana(habilitar_v31_v32),
		.datos_mem(datos_leidos_port2), 
		.transaccion_mem_completada(transaccion_completada_port2),
		//salidas
		.leer_mem(leer_v32),
		.fila1(fila1_v32),
		.fila2(fila2_v32),
		.fila3(fila3_v32),
		.fila4(fila4_v32),
		.fila5(fila5_v32),			
		.liberar_bus_mem(liberar_bus_mem_v32),
		.direccion_mem(direccion_mem_v32)

		 );

	defparam v_32.COLUMNA_MEM = 248;
	defparam v_32.BITS_DIRECCION_MEM = BITS_DIRECCION_P2;

	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus liberar_bus_16(
		.clk(clk),
		.reset(reset),
		.liberar_1(liberar_bus_mem_v31),
		.liberar_2(liberar_bus_mem_v32),
		.liberar_bus(liberar_bus_v31_v32),
		.habilitar_siguiente(iniciar_escritura)
	);	
	
	
/* 
CONTEXTO
==========================================================================

*/
	FSM_control_pos_memoria control_bus_mem (
		 .clk(clk), 
		 .reset(reset), 
		 .cambio_pos(liberar_bus),
		 //
		 .habilitar_cambio(actualizar_bus_mem), 
		 .posicion(seleccion_bus_memoria)
		 );
		 

/*
CONTEXTO
==========================================================================

*/	
	seleccion_pos_mem registro_bus_memoria (
		 .clk(clk), 
		 .reset(reset), 
		 .sumar(actualizar_bus_mem), 
		 .seleccion(seleccion_bus_memoria), 
		 //
		 .resultado(bus_mem_permitido)
		 );		 
	defparam registro_bus_memoria.BITS_DATOS = 4;

/*
CONTEXTO
==========================================================================

*/
	mux_16_1 bus_direccion_puerto_1 (
		 .entrada_1(direccion_mem_v1),
		 .entrada_2(direccion_mem_v3),
		 .entrada_3(direccion_mem_v5),
		 .entrada_4(direccion_mem_v7),
		 .entrada_5(direccion_mem_v9),
		 .entrada_6(direccion_mem_v11),
		 .entrada_7(direccion_mem_v13),
		 .entrada_8(direccion_mem_v15),
		 .entrada_9(direccion_mem_v17),
		 .entrada_10(direccion_mem_v19),
		 .entrada_11(direccion_mem_v21),
		 .entrada_12(direccion_mem_v23),
		 .entrada_13(direccion_mem_v25),
		 .entrada_14(direccion_mem_v27),
		 .entrada_15(direccion_mem_v29),
		 .entrada_16(direccion_mem_v31),
		 .seleccion(bus_mem_permitido), 
		 .salida(direcciones_lectura_1)
		 );
	
	defparam bus_direccion_puerto_1.BITS_DATOS = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	mux_16_1 bus_direccion_puerto_2 (	
	.entrada_1(direccion_mem_v2),
	 .entrada_2(direccion_mem_v4),
	 .entrada_3(direccion_mem_v6),
	 .entrada_4(direccion_mem_v8),
	 .entrada_5(direccion_mem_v10),
	 .entrada_6(direccion_mem_v12),
	 .entrada_7(direccion_mem_v14),
	 .entrada_8(direccion_mem_v16),
	 .entrada_9(direccion_mem_v18),
	 .entrada_10(direccion_mem_v20),
	 .entrada_11(direccion_mem_v22),
	 .entrada_12(direccion_mem_v24),
	 .entrada_13(direccion_mem_v26),
	 .entrada_14(direccion_mem_v28),
	 .entrada_15(direccion_mem_v30),
	 .entrada_16(direccion_mem_v32),
	 .seleccion(bus_mem_permitido), 
	 .salida(direcciones_lectura_2)
    );
	
	defparam bus_direccion_puerto_2.BITS_DATOS = BITS_DIRECCION_P2;


/*
CONTEXTO
==========================================================================

*/	

	
	FSM_control_actualizacion_filas control_filas (
		 .clk(clk), 
		 .reset(reset), 
		 .actualizar_primera_ventana(proceso_escritura_terminado), 
		 .filas_actualizadas(proceso_filas_completado), 
		 //
		 .iniciar_actualizacion(procesar_sig_fila), 
		 .contar_fila(contar_fila_procesada)
		 );
		 
		 
		 
	contador_pulsos contador_filas (
    .clk(clk), 
    .reset(reset), 
    .habilitar_cuenta(contar_fila_procesada),
	 //
    .cuenta_finalizada(proceso_filas_completado)
    );
	 
	defparam contador_filas.BITS_PARA_CUENTA = 9;
	defparam contador_filas.CUENTA_LIMITE = 256;	

	
	
//==========================================================================
	
	
	assign leer_port1 = 
		leer_v1 || 
		leer_v3 ||
		leer_v5 || 
		leer_v7 ||
		leer_v9 || 
		leer_v11 ||
		leer_v13 || 
		leer_v15 ||
		leer_v17 || 
		leer_v19 ||
		leer_v21 || 
		leer_v23 ||
		leer_v25 || 
		leer_v27 ||
		leer_v29 || 
		leer_v31;

		
	assign leer_port2 = 
		leer_v2 || 
		leer_v4 ||
		leer_v6 || 
		leer_v8 ||
		leer_v10 || 
		leer_v12 ||
		leer_v14 || 
		leer_v16 ||
		leer_v18 || 
		leer_v20 ||
		leer_v22 || 
		leer_v24 ||
		leer_v26 || 
		leer_v28 ||
		leer_v30 || 
		leer_v32;
	
	assign liberar_bus = 
		liberar_bus_v1_v2 || 
		liberar_bus_v3_v4 ||
		liberar_bus_v5_v6 ||
		liberar_bus_v7_v8 ||
		liberar_bus_v9_v10 ||
		liberar_bus_v11_v12 ||
		liberar_bus_v13_v14 ||
		liberar_bus_v15_v16 ||
		liberar_bus_v17_v18 ||
		liberar_bus_v19_v20 ||
		liberar_bus_v21_v22 ||
		liberar_bus_v23_v24 ||
		liberar_bus_v25_v26 ||
		liberar_bus_v27_v28 ||
		liberar_bus_v29_v30 ||
		liberar_bus_v31_v32;
	
	
//#######################################################################################################
//#######################################################################################################
//#######################################################################################################
//#######################################################################################################
//#######################################################################################################


	wire [7:0] byte_mayor_v1;
	wire [7:0] byte_mayor_v2;
	wire [7:0] byte_mayor_v3;
	wire [7:0] byte_mayor_v4;
	wire [7:0] byte_mayor_v5;
	wire [7:0] byte_mayor_v6;
	wire [7:0] byte_mayor_v7;
	wire [7:0] byte_mayor_v8;
	wire [7:0] byte_mayor_v9;
	wire [7:0] byte_mayor_v10;
	wire [7:0] byte_mayor_v11;
	wire [7:0] byte_mayor_v12;
	wire [7:0] byte_mayor_v13;
	wire [7:0] byte_mayor_v14;
	wire [7:0] byte_mayor_v15;
	wire [7:0] byte_mayor_v16;
	wire [7:0] byte_mayor_v17;
	wire [7:0] byte_mayor_v18;
	wire [7:0] byte_mayor_v19;
	wire [7:0] byte_mayor_v20;
	wire [7:0] byte_mayor_v21;
	wire [7:0] byte_mayor_v22;
	wire [7:0] byte_mayor_v23;
	wire [7:0] byte_mayor_v24;
	wire [7:0] byte_mayor_v25;
	wire [7:0] byte_mayor_v26;
	wire [7:0] byte_mayor_v27;
	wire [7:0] byte_mayor_v28;
	wire [7:0] byte_mayor_v29;
	wire [7:0] byte_mayor_v30;
	wire [7:0] byte_mayor_v31;
	wire [7:0] byte_mayor_v32;
	
	wire [7:0] byte_mayor_v1_v2;
	wire [7:0] byte_mayor_v2_v3;
	wire [7:0] byte_mayor_v3_v4;
	wire [7:0] byte_mayor_v4_v5;
	wire [7:0] byte_mayor_v5_v6;
	wire [7:0] byte_mayor_v6_v7;
	wire [7:0] byte_mayor_v7_v8;
	wire [7:0] byte_mayor_v8_v9;
	wire [7:0] byte_mayor_v9_v10;
	wire [7:0] byte_mayor_v10_v11;
	wire [7:0] byte_mayor_v11_v12;
	wire [7:0] byte_mayor_v12_v13;
	wire [7:0] byte_mayor_v13_v14;
	wire [7:0] byte_mayor_v14_v15;
	wire [7:0] byte_mayor_v15_v16;
	wire [7:0] byte_mayor_v16_v17;
	wire [7:0] byte_mayor_v17_v18;
	wire [7:0] byte_mayor_v18_v19;
	wire [7:0] byte_mayor_v19_v20;
	wire [7:0] byte_mayor_v20_v21;
	wire [7:0] byte_mayor_v21_v22;
	wire [7:0] byte_mayor_v22_v23;
	wire [7:0] byte_mayor_v23_v24;
	wire [7:0] byte_mayor_v24_v25;
	wire [7:0] byte_mayor_v25_v26;
	wire [7:0] byte_mayor_v26_v27;
	wire [7:0] byte_mayor_v27_v28;
	wire [7:0] byte_mayor_v28_v29;
	wire [7:0] byte_mayor_v29_v30;
	wire [7:0] byte_mayor_v30_v31;
	wire [7:0] byte_mayor_v31_v32;
	
	
	wire [3:0] habilitador_v1_v2;
	wire [3:0] habilitador_v3_v4;
	wire [3:0] habilitador_v5_v6;
	wire [3:0] habilitador_v7_v8;
	wire [3:0] habilitador_v9_v10;
	wire [3:0] habilitador_v11_v12;
	wire [3:0] habilitador_v13_v14;
	wire [3:0] habilitador_v15_v16;
	wire [3:0] habilitador_v17_v18;
	wire [3:0] habilitador_v19_v20;
	wire [3:0] habilitador_v21_v22;
	wire [3:0] habilitador_v23_v24;
	wire [3:0] habilitador_v25_v26;
	wire [3:0] habilitador_v27_v28;
	wire [3:0] habilitador_v29_v30;
	wire [3:0] habilitador_v31_v32;
	
	wire [31:0] resultado_v1;
	wire [31:0] resultado_v2;
	wire [31:0] resultado_v3;
	wire [31:0] resultado_v4;
	wire [31:0] resultado_v5;
	wire [31:0] resultado_v6;
	wire [31:0] resultado_v7;
	wire [31:0] resultado_v8;
	wire [31:0] resultado_v9;
	wire [31:0] resultado_v10;
	wire [31:0] resultado_v11;
	wire [31:0] resultado_v12;
	wire [31:0] resultado_v13;
	wire [31:0] resultado_v14;
	wire [31:0] resultado_v15;
	wire [31:0] resultado_v16;
	wire [31:0] resultado_v17;
	wire [31:0] resultado_v18;
	wire [31:0] resultado_v19;
	wire [31:0] resultado_v20;
	wire [31:0] resultado_v21;
	wire [31:0] resultado_v22;
	wire [31:0] resultado_v23;
	wire [31:0] resultado_v24;
	wire [31:0] resultado_v25;
	wire [31:0] resultado_v26;
	wire [31:0] resultado_v27;
	wire [31:0] resultado_v28;
	wire [31:0] resultado_v29;
	wire [31:0] resultado_v30;
	wire [31:0] resultado_v31;
	wire [31:0] resultado_v32;
	
	wire [31:0] resultado_v1_v2;
	wire [31:0] resultado_v2_v3;
	wire [31:0] resultado_v3_v4;
	wire [31:0] resultado_v4_v5;
	wire [31:0] resultado_v5_v6;
	wire [31:0] resultado_v6_v7;
	wire [31:0] resultado_v7_v8;
	wire [31:0] resultado_v8_v9;
	wire [31:0] resultado_v9_v10;
	wire [31:0] resultado_v10_v11;
	wire [31:0] resultado_v11_v12;
	wire [31:0] resultado_v12_v13;
	wire [31:0] resultado_v13_v14;
	wire [31:0] resultado_v14_v15;
	wire [31:0] resultado_v15_v16;
	wire [31:0] resultado_v16_v17;
	wire [31:0] resultado_v17_v18;
	wire [31:0] resultado_v18_v19;
	wire [31:0] resultado_v19_v20;
	wire [31:0] resultado_v20_v21;
	wire [31:0] resultado_v21_v22;
	wire [31:0] resultado_v22_v23;
	wire [31:0] resultado_v23_v24;
	wire [31:0] resultado_v24_v25;
	wire [31:0] resultado_v25_v26;
	wire [31:0] resultado_v26_v27;
	wire [31:0] resultado_v27_v28;
	wire [31:0] resultado_v28_v29;
	wire [31:0] resultado_v29_v30;
	wire [31:0] resultado_v30_v31;
	wire [31:0] resultado_v31_v32;

	//
	wire [1:0] seleccion_pixeles_v_1_2;
	wire [1:0] seleccion_pixeles_v_3_4;
	wire [1:0] seleccion_pixeles_v_5_6;
	wire [1:0] seleccion_pixeles_v_7_8;
	wire [1:0] seleccion_pixeles_v_9_10;
	wire [1:0] seleccion_pixeles_v_11_12;
	wire [1:0] seleccion_pixeles_v_13_14;
	wire [1:0] seleccion_pixeles_v_15_16;
	wire [1:0] seleccion_pixeles_v_17_18;
	wire [1:0] seleccion_pixeles_v_19_20;
	wire [1:0] seleccion_pixeles_v_21_22;
	wire [1:0] seleccion_pixeles_v_23_24;
	wire [1:0] seleccion_pixeles_v_25_26;
	wire [1:0] seleccion_pixeles_v_27_28;
	wire [1:0] seleccion_pixeles_v_29_30;
	wire [1:0] seleccion_pixeles_v_31_32;

	
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v1 (
		 .fila_1(fila1_v1), 
		 .fila_2(fila2_v1), 
		 .fila_3(fila3_v1), 
		 .fila_4(fila4_v1), 
		 .fila_5(fila5_v1), 
		 .seleccion(seleccion_pixeles_v_1_2), 
		 //
		 .byte_mayor(byte_mayor_v1)
		 );		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v1(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v1_v2),
		 .datos_entrada(byte_mayor_v1),
		 .datos_salida(resultado_v1)
		 );		 
		 

/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v2 (
		 .fila_1(fila1_v2), 
		 .fila_2(fila2_v2), 
		 .fila_3(fila3_v2), 
		 .fila_4(fila4_v2), 
		 .fila_5(fila5_v2), 
		 .seleccion(seleccion_pixeles_v_1_2), 
		 //
		 .byte_mayor(byte_mayor_v2)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v2(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v1_v2),
		 .datos_entrada(byte_mayor_v2),
		 .datos_salida(resultado_v2)
		 );		 


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_1_2 (
		 .fila_1({fila1_v1[31:0],fila1_v2[63:32]}), 
		 .fila_2({fila2_v1[31:0],fila2_v2[63:32]}), 
		 .fila_3({fila3_v1[31:0],fila3_v2[63:32]}), 
		 .fila_4({fila4_v1[31:0],fila4_v2[63:32]}), 
		 .fila_5({fila5_v1[31:0],fila5_v2[63:32]}), 
		 .seleccion(seleccion_pixeles_v_1_2), 
		 .byte_mayor(byte_mayor_v1_v2)
		 );		 

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v1_v2(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v1_v2),
		 .datos_entrada(byte_mayor_v1_v2),
		 .datos_salida(resultado_v1_v2)
		 );		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_1_2 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v1_v2),
		 //
		 .guardar_dato(habilitador_v1_v2),
		 .valor_pixel(seleccion_pixeles_v_1_2)
		 );

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v3 (
		 .fila_1(fila1_v3), 
		 .fila_2(fila2_v3), 
		 .fila_3(fila3_v3), 
		 .fila_4(fila4_v3), 
		 .fila_5(fila5_v3), 
		 .seleccion(seleccion_pixeles_v_3_4), 
		 //
		 .byte_mayor(byte_mayor_v3)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v3(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v3_v4),
		 .datos_entrada(byte_mayor_v3),
		 .datos_salida(resultado_v3)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_2_3 (
		 .fila_1({fila1_v2[31:0],fila1_v3[63:32]}), 
		 .fila_2({fila2_v2[31:0],fila2_v3[63:32]}), 
		 .fila_3({fila3_v2[31:0],fila3_v3[63:32]}), 
		 .fila_4({fila4_v2[31:0],fila4_v3[63:32]}), 
		 .fila_5({fila5_v2[31:0],fila5_v3[63:32]}), 
		 .seleccion(seleccion_pixeles_v_3_4), 
		 .byte_mayor(byte_mayor_v2_v3)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v2_v3(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v3_v4),
		 .datos_entrada(byte_mayor_v2_v3),
		 .datos_salida(resultado_v2_v3)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v4 (
		 .fila_1(fila1_v4), 
		 .fila_2(fila2_v4), 
		 .fila_3(fila3_v4), 
		 .fila_4(fila4_v4), 
		 .fila_5(fila5_v4), 
		 .seleccion(seleccion_pixeles_v_3_4), 
		 //
		 .byte_mayor(byte_mayor_v4)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v4(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v3_v4),
		 .datos_entrada(byte_mayor_v4),
		 .datos_salida(resultado_v4)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_3_4 (
		 .fila_1({fila1_v3[31:0],fila1_v4[63:32]}), 
		 .fila_2({fila2_v3[31:0],fila2_v4[63:32]}), 
		 .fila_3({fila3_v3[31:0],fila3_v4[63:32]}), 
		 .fila_4({fila4_v3[31:0],fila4_v4[63:32]}), 
		 .fila_5({fila5_v3[31:0],fila5_v4[63:32]}), 
		 .seleccion(seleccion_pixeles_v_3_4), 
		 .byte_mayor(byte_mayor_v3_v4)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v3_v4(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v3_v4),
		 .datos_entrada(byte_mayor_v3_v4),
		 .datos_salida(resultado_v3_v4)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_3_4 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v3_v4), 
		 //
		 .guardar_dato(habilitador_v3_v4),
		 .valor_pixel(seleccion_pixeles_v_3_4)
		 );

/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v5 (
		 .fila_1(fila1_v5), 
		 .fila_2(fila2_v5), 
		 .fila_3(fila3_v5), 
		 .fila_4(fila4_v5), 
		 .fila_5(fila5_v5), 
		 .seleccion(seleccion_pixeles_v_5_6),
		 //
		 .byte_mayor(byte_mayor_v5)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v5(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v5_v6),
		 .datos_entrada(byte_mayor_v5),
		 .datos_salida(resultado_v5)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_4_5 (
		 .fila_1({fila1_v4[31:0],fila1_v5[63:32]}), 
		 .fila_2({fila2_v4[31:0],fila2_v5[63:32]}), 
		 .fila_3({fila3_v4[31:0],fila3_v5[63:32]}), 
		 .fila_4({fila4_v4[31:0],fila4_v5[63:32]}), 
		 .fila_5({fila5_v4[31:0],fila5_v5[63:32]}), 
		 .seleccion(seleccion_pixeles_v_5_6), 
		 .byte_mayor(byte_mayor_v4_v5)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v4_v5(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v5_v6),
		 .datos_entrada(byte_mayor_v4_v5),
		 .datos_salida(resultado_v4_v5)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v6 (
		 .fila_1(fila1_v6), 
		 .fila_2(fila2_v6), 
		 .fila_3(fila3_v6), 
		 .fila_4(fila4_v6), 
		 .fila_5(fila5_v6), 
		 .seleccion(seleccion_pixeles_v_5_6), 
		 //
		 .byte_mayor(byte_mayor_v6)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v6(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v5_v6),
		 .datos_entrada(byte_mayor_v6),
		 .datos_salida(resultado_v6)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_5_6 (
		 .fila_1({fila1_v5[31:0],fila1_v6[63:32]}), 
		 .fila_2({fila2_v5[31:0],fila2_v6[63:32]}), 
		 .fila_3({fila3_v5[31:0],fila3_v6[63:32]}), 
		 .fila_4({fila4_v5[31:0],fila4_v6[63:32]}), 
		 .fila_5({fila5_v5[31:0],fila5_v6[63:32]}), 
		 .seleccion(seleccion_pixeles_v_5_6), 
		 .byte_mayor(byte_mayor_v5_v6)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v5_v6(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v5_v6),
		 .datos_entrada(byte_mayor_v5_v6),
		 .datos_salida(resultado_v5_v6)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_5_6 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v5_v6), 
		 //
		 .guardar_dato(habilitador_v5_v6),
		 .valor_pixel(seleccion_pixeles_v_5_6)
		 );


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v7 (
		 .fila_1(fila1_v7), 
		 .fila_2(fila2_v7), 
		 .fila_3(fila3_v7), 
		 .fila_4(fila4_v7), 
		 .fila_5(fila5_v7), 
		 .seleccion(seleccion_pixeles_v_7_8),
		 //
		 .byte_mayor(byte_mayor_v7)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v7(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v7_v8),
		 .datos_entrada(byte_mayor_v7),
		 .datos_salida(resultado_v7)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_6_7 (
		 .fila_1({fila1_v6[31:0],fila1_v7[63:32]}), 
		 .fila_2({fila2_v6[31:0],fila2_v7[63:32]}), 
		 .fila_3({fila3_v6[31:0],fila3_v7[63:32]}), 
		 .fila_4({fila4_v6[31:0],fila4_v7[63:32]}), 
		 .fila_5({fila5_v6[31:0],fila5_v7[63:32]}), 
		 .seleccion(seleccion_pixeles_v_7_8), 
		 .byte_mayor(byte_mayor_v6_v7)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v6_v7(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v7_v8),
		 .datos_entrada(byte_mayor_v6_v7),
		 .datos_salida(resultado_v6_v7)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v8 (
		 .fila_1(fila1_v8), 
		 .fila_2(fila2_v8), 
		 .fila_3(fila3_v8), 
		 .fila_4(fila4_v8), 
		 .fila_5(fila5_v8), 
		 .seleccion(seleccion_pixeles_v_7_8), 
		 //
		 .byte_mayor(byte_mayor_v8)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v8(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v7_v8),
		 .datos_entrada(byte_mayor_v8),
		 .datos_salida(resultado_v8)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_7_8 (
		 .fila_1({fila1_v7[31:0],fila1_v8[63:32]}), 
		 .fila_2({fila2_v7[31:0],fila2_v8[63:32]}), 
		 .fila_3({fila3_v7[31:0],fila3_v8[63:32]}), 
		 .fila_4({fila4_v7[31:0],fila4_v8[63:32]}), 
		 .fila_5({fila5_v7[31:0],fila5_v8[63:32]}), 
		 .seleccion(seleccion_pixeles_v_7_8), 
		 .byte_mayor(byte_mayor_v7_v8)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v7_v8(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v7_v8),
		 .datos_entrada(byte_mayor_v7_v8),
		 .datos_salida(resultado_v7_v8)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_7_8 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v7_v8), 
		 //
		 .guardar_dato(habilitador_v7_v8),
		 .valor_pixel(seleccion_pixeles_v_7_8)
		 );
		 
		 

/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v9 (
		 .fila_1(fila1_v9), 
		 .fila_2(fila2_v9), 
		 .fila_3(fila3_v9), 
		 .fila_4(fila4_v9), 
		 .fila_5(fila5_v9), 
		 .seleccion(seleccion_pixeles_v_9_10),
		 //
		 .byte_mayor(byte_mayor_v9)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v9(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v9_v10),
		 .datos_entrada(byte_mayor_v9),
		 .datos_salida(resultado_v9)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_8_9 (
		 .fila_1({fila1_v8[31:0],fila1_v9[63:32]}), 
		 .fila_2({fila2_v8[31:0],fila2_v9[63:32]}), 
		 .fila_3({fila3_v8[31:0],fila3_v9[63:32]}), 
		 .fila_4({fila4_v8[31:0],fila4_v9[63:32]}), 
		 .fila_5({fila5_v8[31:0],fila5_v9[63:32]}), 
		 .seleccion(seleccion_pixeles_v_9_10), 
		 .byte_mayor(byte_mayor_v8_v9)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v8_v9(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v9_v10),
		 .datos_entrada(byte_mayor_v8_v9),
		 .datos_salida(resultado_v8_v9)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v10 (
		 .fila_1(fila1_v10), 
		 .fila_2(fila2_v10), 
		 .fila_3(fila3_v10), 
		 .fila_4(fila4_v10), 
		 .fila_5(fila5_v10), 
		 .seleccion(seleccion_pixeles_v_9_10), 
		 //
		 .byte_mayor(byte_mayor_v10)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v10(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v9_v10),
		 .datos_entrada(byte_mayor_v10),
		 .datos_salida(resultado_v10)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_9_10 (
		 .fila_1({fila1_v9[31:0],fila1_v10[63:32]}), 
		 .fila_2({fila2_v9[31:0],fila2_v10[63:32]}), 
		 .fila_3({fila3_v9[31:0],fila3_v10[63:32]}), 
		 .fila_4({fila4_v9[31:0],fila4_v10[63:32]}), 
		 .fila_5({fila5_v9[31:0],fila5_v10[63:32]}), 
		 .seleccion(seleccion_pixeles_v_9_10), 
		 .byte_mayor(byte_mayor_v9_v10)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v9_v10(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v9_v10),
		 .datos_entrada(byte_mayor_v9_v10),
		 .datos_salida(resultado_v9_v10)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_9_10 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v9_v10), 
		 //
		 .guardar_dato(habilitador_v9_v10),
		 .valor_pixel(seleccion_pixeles_v_9_10)
		 );


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v11 (
		 .fila_1(fila1_v11), 
		 .fila_2(fila2_v11), 
		 .fila_3(fila3_v11), 
		 .fila_4(fila4_v11), 
		 .fila_5(fila5_v11), 
		 .seleccion(seleccion_pixeles_v_11_12),
		 //
		 .byte_mayor(byte_mayor_v11)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v11(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v11_v12),
		 .datos_entrada(byte_mayor_v11),
		 .datos_salida(resultado_v11)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_10_11 (
		 .fila_1({fila1_v10[31:0],fila1_v11[63:32]}), 
		 .fila_2({fila2_v10[31:0],fila2_v11[63:32]}), 
		 .fila_3({fila3_v10[31:0],fila3_v11[63:32]}), 
		 .fila_4({fila4_v10[31:0],fila4_v11[63:32]}), 
		 .fila_5({fila5_v10[31:0],fila5_v11[63:32]}), 
		 .seleccion(seleccion_pixeles_v_11_12), 
		 .byte_mayor(byte_mayor_v10_v11)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v10_v11(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v11_v12),
		 .datos_entrada(byte_mayor_v10_v11),
		 .datos_salida(resultado_v10_v11)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v12 (
		 .fila_1(fila1_v12), 
		 .fila_2(fila2_v12), 
		 .fila_3(fila3_v12), 
		 .fila_4(fila4_v12), 
		 .fila_5(fila5_v12), 
		 .seleccion(seleccion_pixeles_v_11_12), 
		 //
		 .byte_mayor(byte_mayor_v12)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v12(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v11_v12),
		 .datos_entrada(byte_mayor_v12),
		 .datos_salida(resultado_v12)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_11_12 (
		 .fila_1({fila1_v11[31:0],fila1_v12[63:32]}), 
		 .fila_2({fila2_v11[31:0],fila2_v12[63:32]}), 
		 .fila_3({fila3_v11[31:0],fila3_v12[63:32]}), 
		 .fila_4({fila4_v11[31:0],fila4_v12[63:32]}), 
		 .fila_5({fila5_v11[31:0],fila5_v12[63:32]}), 
		 .seleccion(seleccion_pixeles_v_11_12), 
		 .byte_mayor(byte_mayor_v11_v12)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v11_v12(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v11_v12),
		 .datos_entrada(byte_mayor_v11_v12),
		 .datos_salida(resultado_v11_v12)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_11_12 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v11_v12), 
		 //
		 .guardar_dato(habilitador_v11_v12),
		 .valor_pixel(seleccion_pixeles_v_11_12)
		 );

/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v13 (
		 .fila_1(fila1_v13), 
		 .fila_2(fila2_v13), 
		 .fila_3(fila3_v13), 
		 .fila_4(fila4_v13), 
		 .fila_5(fila5_v13), 
		 .seleccion(seleccion_pixeles_v_13_14),
		 //
		 .byte_mayor(byte_mayor_v13)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v13(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v13_v14),
		 .datos_entrada(byte_mayor_v13),
		 .datos_salida(resultado_v13)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_12_13 (
		 .fila_1({fila1_v12[31:0],fila1_v13[63:32]}), 
		 .fila_2({fila2_v12[31:0],fila2_v13[63:32]}), 
		 .fila_3({fila3_v12[31:0],fila3_v13[63:32]}), 
		 .fila_4({fila4_v12[31:0],fila4_v13[63:32]}), 
		 .fila_5({fila5_v12[31:0],fila5_v13[63:32]}), 
		 .seleccion(seleccion_pixeles_v_13_14), 
		 .byte_mayor(byte_mayor_v12_v13)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v12_v13(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v13_v14),
		 .datos_entrada(byte_mayor_v12_v13),
		 .datos_salida(resultado_v12_v13)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v14 (
		 .fila_1(fila1_v14), 
		 .fila_2(fila2_v14), 
		 .fila_3(fila3_v14), 
		 .fila_4(fila4_v14), 
		 .fila_5(fila5_v14), 
		 .seleccion(seleccion_pixeles_v_13_14), 
		 //
		 .byte_mayor(byte_mayor_v14)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v14(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v13_v14),
		 .datos_entrada(byte_mayor_v14),
		 .datos_salida(resultado_v14)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_13_14 (
		 .fila_1({fila1_v13[31:0],fila1_v14[63:32]}), 
		 .fila_2({fila2_v13[31:0],fila2_v14[63:32]}), 
		 .fila_3({fila3_v13[31:0],fila3_v14[63:32]}), 
		 .fila_4({fila4_v13[31:0],fila4_v14[63:32]}), 
		 .fila_5({fila5_v13[31:0],fila5_v14[63:32]}), 
		 .seleccion(seleccion_pixeles_v_13_14), 
		 .byte_mayor(byte_mayor_v13_v14)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v13_v14(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v13_v14),
		 .datos_entrada(byte_mayor_v13_v14),
		 .datos_salida(resultado_v13_v14)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_13_14 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v13_v14), 
		 //
		 .guardar_dato(habilitador_v13_v14),
		 .valor_pixel(seleccion_pixeles_v_13_14)
		 );


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v15 (
		 .fila_1(fila1_v15), 
		 .fila_2(fila2_v15), 
		 .fila_3(fila3_v15), 
		 .fila_4(fila4_v15), 
		 .fila_5(fila5_v15), 
		 .seleccion(seleccion_pixeles_v_15_16),
		 //
		 .byte_mayor(byte_mayor_v15)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v15(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v15_v16),
		 .datos_entrada(byte_mayor_v15),
		 .datos_salida(resultado_v15)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_14_15 (
		 .fila_1({fila1_v14[31:0],fila1_v15[63:32]}), 
		 .fila_2({fila2_v14[31:0],fila2_v15[63:32]}), 
		 .fila_3({fila3_v14[31:0],fila3_v15[63:32]}), 
		 .fila_4({fila4_v14[31:0],fila4_v15[63:32]}), 
		 .fila_5({fila5_v14[31:0],fila5_v15[63:32]}), 
		 .seleccion(seleccion_pixeles_v_15_16), 
		 .byte_mayor(byte_mayor_v14_v15)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v14_v15(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v15_v16),
		 .datos_entrada(byte_mayor_v14_v15),
		 .datos_salida(resultado_v14_v15)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v16 (
		 .fila_1(fila1_v16), 
		 .fila_2(fila2_v16), 
		 .fila_3(fila3_v16), 
		 .fila_4(fila4_v16), 
		 .fila_5(fila5_v16), 
		 .seleccion(seleccion_pixeles_v_15_16), 
		 //
		 .byte_mayor(byte_mayor_v16)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v16(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v15_v16),
		 .datos_entrada(byte_mayor_v16),
		 .datos_salida(resultado_v16)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_15_16 (
		 .fila_1({fila1_v15[31:0],fila1_v16[63:32]}), 
		 .fila_2({fila2_v15[31:0],fila2_v16[63:32]}), 
		 .fila_3({fila3_v15[31:0],fila3_v16[63:32]}), 
		 .fila_4({fila4_v15[31:0],fila4_v16[63:32]}), 
		 .fila_5({fila5_v15[31:0],fila5_v16[63:32]}), 
		 .seleccion(seleccion_pixeles_v_15_16), 
		 .byte_mayor(byte_mayor_v15_v16)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v15_v16(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v15_v16),
		 .datos_entrada(byte_mayor_v15_v16),
		 .datos_salida(resultado_v15_v16)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_15_16 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v15_v16), 
		 //
		 .guardar_dato(habilitador_v15_v16),
		 .valor_pixel(seleccion_pixeles_v_15_16)
		 );
		
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v17 (
		 .fila_1(fila1_v17), 
		 .fila_2(fila2_v17), 
		 .fila_3(fila3_v17), 
		 .fila_4(fila4_v17), 
		 .fila_5(fila5_v17), 
		 .seleccion(seleccion_pixeles_v_17_18),
		 //
		 .byte_mayor(byte_mayor_v17)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v17(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v17_v18),
		 .datos_entrada(byte_mayor_v17),
		 .datos_salida(resultado_v17)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_16_17 (
		 .fila_1({fila1_v16[31:0],fila1_v17[63:32]}), 
		 .fila_2({fila2_v16[31:0],fila2_v17[63:32]}), 
		 .fila_3({fila3_v16[31:0],fila3_v17[63:32]}), 
		 .fila_4({fila4_v16[31:0],fila4_v17[63:32]}), 
		 .fila_5({fila5_v16[31:0],fila5_v17[63:32]}), 
		 .seleccion(seleccion_pixeles_v_17_18), 
		 .byte_mayor(byte_mayor_v16_v17)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v16_v17(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v17_v18),
		 .datos_entrada(byte_mayor_v16_v17),
		 .datos_salida(resultado_v16_v17)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v18 (
		 .fila_1(fila1_v18), 
		 .fila_2(fila2_v18), 
		 .fila_3(fila3_v18), 
		 .fila_4(fila4_v18), 
		 .fila_5(fila5_v18), 
		 .seleccion(seleccion_pixeles_v_17_18), 
		 //
		 .byte_mayor(byte_mayor_v18)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v18(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v17_v18),
		 .datos_entrada(byte_mayor_v18),
		 .datos_salida(resultado_v18)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_17_18 (
		 .fila_1({fila1_v17[31:0],fila1_v18[63:32]}), 
		 .fila_2({fila2_v17[31:0],fila2_v18[63:32]}), 
		 .fila_3({fila3_v17[31:0],fila3_v18[63:32]}), 
		 .fila_4({fila4_v17[31:0],fila4_v18[63:32]}), 
		 .fila_5({fila5_v17[31:0],fila5_v18[63:32]}), 
		 .seleccion(seleccion_pixeles_v_17_18), 
		 .byte_mayor(byte_mayor_v17_v18)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v17_v18(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v17_v18),
		 .datos_entrada(byte_mayor_v17_v18),
		 .datos_salida(resultado_v17_v18)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_17_18 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v17_v18), 
		 //
		 .guardar_dato(habilitador_v17_v18),
		 .valor_pixel(seleccion_pixeles_v_17_18)
		 );

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v19 (
		 .fila_1(fila1_v19), 
		 .fila_2(fila2_v19), 
		 .fila_3(fila3_v19), 
		 .fila_4(fila4_v19), 
		 .fila_5(fila5_v19), 
		 .seleccion(seleccion_pixeles_v_19_20),
		 //
		 .byte_mayor(byte_mayor_v19)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v19(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v19_v20),
		 .datos_entrada(byte_mayor_v19),
		 .datos_salida(resultado_v19)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_18_19 (
		 .fila_1({fila1_v18[31:0],fila1_v19[63:32]}), 
		 .fila_2({fila2_v18[31:0],fila2_v19[63:32]}), 
		 .fila_3({fila3_v18[31:0],fila3_v19[63:32]}), 
		 .fila_4({fila4_v18[31:0],fila4_v19[63:32]}), 
		 .fila_5({fila5_v18[31:0],fila5_v19[63:32]}), 
		 .seleccion(seleccion_pixeles_v_19_20), 
		 .byte_mayor(byte_mayor_v18_v19)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v18_v19(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v19_v20),
		 .datos_entrada(byte_mayor_v18_v19),
		 .datos_salida(resultado_v18_v19)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v20 (
		 .fila_1(fila1_v20), 
		 .fila_2(fila2_v20), 
		 .fila_3(fila3_v20), 
		 .fila_4(fila4_v20), 
		 .fila_5(fila5_v20), 
		 .seleccion(seleccion_pixeles_v_19_20), 
		 //
		 .byte_mayor(byte_mayor_v20)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v20(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v19_v20),
		 .datos_entrada(byte_mayor_v20),
		 .datos_salida(resultado_v20)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_19_20 (
		 .fila_1({fila1_v19[31:0],fila1_v20[63:32]}), 
		 .fila_2({fila2_v19[31:0],fila2_v20[63:32]}), 
		 .fila_3({fila3_v19[31:0],fila3_v20[63:32]}), 
		 .fila_4({fila4_v19[31:0],fila4_v20[63:32]}), 
		 .fila_5({fila5_v19[31:0],fila5_v20[63:32]}), 
		 .seleccion(seleccion_pixeles_v_19_20), 
		 .byte_mayor(byte_mayor_v19_v20)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v19_v20(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v19_v20),
		 .datos_entrada(byte_mayor_v19_v20),
		 .datos_salida(resultado_v19_v20)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_19_20 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v19_v20), 
		 //
		 .guardar_dato(habilitador_v19_v20),
		 .valor_pixel(seleccion_pixeles_v_19_20)
		 );

/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v21 (
		 .fila_1(fila1_v21), 
		 .fila_2(fila2_v21), 
		 .fila_3(fila3_v21), 
		 .fila_4(fila4_v21), 
		 .fila_5(fila5_v21), 
		 .seleccion(seleccion_pixeles_v_21_22),
		 //
		 .byte_mayor(byte_mayor_v21)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v21(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v21_v22),
		 .datos_entrada(byte_mayor_v21),
		 .datos_salida(resultado_v21)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_20_21 (
		 .fila_1({fila1_v20[31:0],fila1_v21[63:32]}), 
		 .fila_2({fila2_v20[31:0],fila2_v21[63:32]}), 
		 .fila_3({fila3_v20[31:0],fila3_v21[63:32]}), 
		 .fila_4({fila4_v20[31:0],fila4_v21[63:32]}), 
		 .fila_5({fila5_v20[31:0],fila5_v21[63:32]}), 
		 .seleccion(seleccion_pixeles_v_21_22), 
		 .byte_mayor(byte_mayor_v20_v21)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v20_v21(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v21_v22),
		 .datos_entrada(byte_mayor_v20_v21),
		 .datos_salida(resultado_v20_v21)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v22 (
		 .fila_1(fila1_v22), 
		 .fila_2(fila2_v22), 
		 .fila_3(fila3_v22), 
		 .fila_4(fila4_v22), 
		 .fila_5(fila5_v22), 
		 .seleccion(seleccion_pixeles_v_21_22), 
		 //
		 .byte_mayor(byte_mayor_v22)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v22(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v21_v22),
		 .datos_entrada(byte_mayor_v22),
		 .datos_salida(resultado_v22)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_21_22 (
		 .fila_1({fila1_v21[31:0],fila1_v22[63:32]}), 
		 .fila_2({fila2_v21[31:0],fila2_v22[63:32]}), 
		 .fila_3({fila3_v21[31:0],fila3_v22[63:32]}), 
		 .fila_4({fila4_v21[31:0],fila4_v22[63:32]}), 
		 .fila_5({fila5_v21[31:0],fila5_v22[63:32]}), 
		 .seleccion(seleccion_pixeles_v_21_22), 
		 .byte_mayor(byte_mayor_v21_v22)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v21_v22(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v21_v22),
		 .datos_entrada(byte_mayor_v21_v22),
		 .datos_salida(resultado_v21_v22)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_21_22 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v21_v22), 
		 //
		 .guardar_dato(habilitador_v21_v22),
		 .valor_pixel(seleccion_pixeles_v_21_22)
		 );
	

/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v23 (
		 .fila_1(fila1_v23), 
		 .fila_2(fila2_v23), 
		 .fila_3(fila3_v23), 
		 .fila_4(fila4_v23), 
		 .fila_5(fila5_v23), 
		 .seleccion(seleccion_pixeles_v_23_24),
		 //
		 .byte_mayor(byte_mayor_v23)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v23(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v23_v24),
		 .datos_entrada(byte_mayor_v23),
		 .datos_salida(resultado_v23)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_22_23 (
		 .fila_1({fila1_v22[31:0],fila1_v23[63:32]}), 
		 .fila_2({fila2_v22[31:0],fila2_v23[63:32]}), 
		 .fila_3({fila3_v22[31:0],fila3_v23[63:32]}), 
		 .fila_4({fila4_v22[31:0],fila4_v23[63:32]}), 
		 .fila_5({fila5_v22[31:0],fila5_v23[63:32]}), 
		 .seleccion(seleccion_pixeles_v_23_24), 
		 .byte_mayor(byte_mayor_v22_v23)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v22_v23(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v23_v24),
		 .datos_entrada(byte_mayor_v22_v23),
		 .datos_salida(resultado_v22_v23)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v24 (
		 .fila_1(fila1_v24), 
		 .fila_2(fila2_v24), 
		 .fila_3(fila3_v24), 
		 .fila_4(fila4_v24), 
		 .fila_5(fila5_v24), 
		 .seleccion(seleccion_pixeles_v_23_24), 
		 //
		 .byte_mayor(byte_mayor_v24)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v24(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v23_v24),
		 .datos_entrada(byte_mayor_v24),
		 .datos_salida(resultado_v24)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_23_24 (
		 .fila_1({fila1_v23[31:0],fila1_v24[63:32]}), 
		 .fila_2({fila2_v23[31:0],fila2_v24[63:32]}), 
		 .fila_3({fila3_v23[31:0],fila3_v24[63:32]}), 
		 .fila_4({fila4_v23[31:0],fila4_v24[63:32]}), 
		 .fila_5({fila5_v23[31:0],fila5_v24[63:32]}), 
		 .seleccion(seleccion_pixeles_v_23_24), 
		 .byte_mayor(byte_mayor_v23_v24)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v23_v24(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v23_v24),
		 .datos_entrada(byte_mayor_v23_v24),
		 .datos_salida(resultado_v23_v24)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_23_24 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v23_v24), 
		 //
		 .guardar_dato(habilitador_v23_v24),
		 .valor_pixel(seleccion_pixeles_v_23_24)
		 );


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v25 (
		 .fila_1(fila1_v25), 
		 .fila_2(fila2_v25), 
		 .fila_3(fila3_v25), 
		 .fila_4(fila4_v25), 
		 .fila_5(fila5_v25), 
		 .seleccion(seleccion_pixeles_v_25_26),
		 //
		 .byte_mayor(byte_mayor_v25)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v25(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v25_v26),
		 .datos_entrada(byte_mayor_v25),
		 .datos_salida(resultado_v25)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_24_25 (
		 .fila_1({fila1_v24[31:0],fila1_v25[63:32]}), 
		 .fila_2({fila2_v24[31:0],fila2_v25[63:32]}), 
		 .fila_3({fila3_v24[31:0],fila3_v25[63:32]}), 
		 .fila_4({fila4_v24[31:0],fila4_v25[63:32]}), 
		 .fila_5({fila5_v24[31:0],fila5_v25[63:32]}), 
		 .seleccion(seleccion_pixeles_v_25_26), 
		 .byte_mayor(byte_mayor_v24_v25)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v24_v25(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v25_v26),
		 .datos_entrada(byte_mayor_v24_v25),
		 .datos_salida(resultado_v24_v25)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v26 (
		 .fila_1(fila1_v26), 
		 .fila_2(fila2_v26), 
		 .fila_3(fila3_v26), 
		 .fila_4(fila4_v26), 
		 .fila_5(fila5_v26), 
		 .seleccion(seleccion_pixeles_v_25_26), 
		 //
		 .byte_mayor(byte_mayor_v26)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v26(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v25_v26),
		 .datos_entrada(byte_mayor_v26),
		 .datos_salida(resultado_v26)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_25_26 (
		 .fila_1({fila1_v25[31:0],fila1_v26[63:32]}), 
		 .fila_2({fila2_v25[31:0],fila2_v26[63:32]}), 
		 .fila_3({fila3_v25[31:0],fila3_v26[63:32]}), 
		 .fila_4({fila4_v25[31:0],fila4_v26[63:32]}), 
		 .fila_5({fila5_v25[31:0],fila5_v26[63:32]}), 
		 .seleccion(seleccion_pixeles_v_25_26), 
		 .byte_mayor(byte_mayor_v25_v26)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v25_v26(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v25_v26),
		 .datos_entrada(byte_mayor_v25_v26),
		 .datos_salida(resultado_v25_v26)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_25_26 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v25_v26), 
		 //
		 .guardar_dato(habilitador_v25_v26),
		 .valor_pixel(seleccion_pixeles_v_25_26)
		 );


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v27 (
		 .fila_1(fila1_v27), 
		 .fila_2(fila2_v27), 
		 .fila_3(fila3_v27), 
		 .fila_4(fila4_v27), 
		 .fila_5(fila5_v27), 
		 .seleccion(seleccion_pixeles_v_27_28),
		 //
		 .byte_mayor(byte_mayor_v27)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v27(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v27_v28),
		 .datos_entrada(byte_mayor_v27),
		 .datos_salida(resultado_v27)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_26_27 (
		 .fila_1({fila1_v26[31:0],fila1_v27[63:32]}), 
		 .fila_2({fila2_v26[31:0],fila2_v27[63:32]}), 
		 .fila_3({fila3_v26[31:0],fila3_v27[63:32]}), 
		 .fila_4({fila4_v26[31:0],fila4_v27[63:32]}), 
		 .fila_5({fila5_v26[31:0],fila5_v27[63:32]}), 
		 .seleccion(seleccion_pixeles_v_27_28), 
		 .byte_mayor(byte_mayor_v26_v27)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v26_v27(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v27_v28),
		 .datos_entrada(byte_mayor_v26_v27),
		 .datos_salida(resultado_v26_v27)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v28 (
		 .fila_1(fila1_v28), 
		 .fila_2(fila2_v28), 
		 .fila_3(fila3_v28), 
		 .fila_4(fila4_v28), 
		 .fila_5(fila5_v28), 
		 .seleccion(seleccion_pixeles_v_27_28), 
		 //
		 .byte_mayor(byte_mayor_v28)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v28(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v27_v28),
		 .datos_entrada(byte_mayor_v28),
		 .datos_salida(resultado_v28)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_27_28 (
		 .fila_1({fila1_v27[31:0],fila1_v28[63:32]}), 
		 .fila_2({fila2_v27[31:0],fila2_v28[63:32]}), 
		 .fila_3({fila3_v27[31:0],fila3_v28[63:32]}), 
		 .fila_4({fila4_v27[31:0],fila4_v28[63:32]}), 
		 .fila_5({fila5_v27[31:0],fila5_v28[63:32]}), 
		 .seleccion(seleccion_pixeles_v_27_28), 
		 .byte_mayor(byte_mayor_v27_v28)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v27_v28(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v27_v28),
		 .datos_entrada(byte_mayor_v27_v28),
		 .datos_salida(resultado_v27_v28)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_27_28 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v27_v28), 
		 //
		 .guardar_dato(habilitador_v27_v28),
		 .valor_pixel(seleccion_pixeles_v_27_28)
		 );

/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v29 (
		 .fila_1(fila1_v29), 
		 .fila_2(fila2_v29), 
		 .fila_3(fila3_v29), 
		 .fila_4(fila4_v29), 
		 .fila_5(fila5_v29), 
		 .seleccion(seleccion_pixeles_v_29_30),
		 //
		 .byte_mayor(byte_mayor_v29)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v29(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v29_v30),
		 .datos_entrada(byte_mayor_v29),
		 .datos_salida(resultado_v29)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_28_29 (
		 .fila_1({fila1_v28[31:0],fila1_v29[63:32]}), 
		 .fila_2({fila2_v28[31:0],fila2_v29[63:32]}), 
		 .fila_3({fila3_v28[31:0],fila3_v29[63:32]}), 
		 .fila_4({fila4_v28[31:0],fila4_v29[63:32]}), 
		 .fila_5({fila5_v28[31:0],fila5_v29[63:32]}), 
		 .seleccion(seleccion_pixeles_v_29_30), 
		 .byte_mayor(byte_mayor_v28_v29)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v28_v29(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v29_v30),
		 .datos_entrada(byte_mayor_v28_v29),
		 .datos_salida(resultado_v28_v29)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v30 (
		 .fila_1(fila1_v30), 
		 .fila_2(fila2_v30), 
		 .fila_3(fila3_v30), 
		 .fila_4(fila4_v30), 
		 .fila_5(fila5_v30), 
		 .seleccion(seleccion_pixeles_v_29_30), 
		 //
		 .byte_mayor(byte_mayor_v30)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v30(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v29_v30),
		 .datos_entrada(byte_mayor_v30),
		 .datos_salida(resultado_v30)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_29_30 (
		 .fila_1({fila1_v29[31:0],fila1_v30[63:32]}), 
		 .fila_2({fila2_v29[31:0],fila2_v30[63:32]}), 
		 .fila_3({fila3_v29[31:0],fila3_v30[63:32]}), 
		 .fila_4({fila4_v29[31:0],fila4_v30[63:32]}), 
		 .fila_5({fila5_v29[31:0],fila5_v30[63:32]}), 
		 .seleccion(seleccion_pixeles_v_29_30), 
		 .byte_mayor(byte_mayor_v29_v30)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v29_v30(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v29_v30),
		 .datos_entrada(byte_mayor_v29_v30),
		 .datos_salida(resultado_v29_v30)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_29_30 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v29_v30), 
		 //
		 .guardar_dato(habilitador_v29_v30),
		 .valor_pixel(seleccion_pixeles_v_29_30)
		 );

//##
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v31 (
		 .fila_1(fila1_v31), 
		 .fila_2(fila2_v31), 
		 .fila_3(fila3_v31), 
		 .fila_4(fila4_v31), 
		 .fila_5(fila5_v31), 
		 .seleccion(seleccion_pixeles_v_31_32),
		 //
		 .byte_mayor(byte_mayor_v31)
		 );


/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v31(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v31_v32),
		 .datos_entrada(byte_mayor_v31),
		 .datos_salida(resultado_v31)
		 );	

		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_30_31 (
		 .fila_1({fila1_v30[31:0],fila1_v31[63:32]}), 
		 .fila_2({fila2_v30[31:0],fila2_v31[63:32]}), 
		 .fila_3({fila3_v30[31:0],fila3_v31[63:32]}), 
		 .fila_4({fila4_v30[31:0],fila4_v31[63:32]}), 
		 .fila_5({fila5_v30[31:0],fila5_v31[63:32]}), 
		 .seleccion(seleccion_pixeles_v_31_32), 
		 .byte_mayor(byte_mayor_v30_v31)
		 );	 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v30_v31(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v31_v32),
		 .datos_entrada(byte_mayor_v30_v31),
		 .datos_salida(resultado_v30_v31)
		 );		 


/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_v32 (
		 .fila_1(fila1_v32), 
		 .fila_2(fila2_v32), 
		 .fila_3(fila3_v32), 
		 .fila_4(fila4_v32), 
		 .fila_5(fila5_v32), 
		 .seleccion(seleccion_pixeles_v_31_32), 
		 //
		 .byte_mayor(byte_mayor_v32)
		 );

/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v32(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v31_v32),
		 .datos_entrada(byte_mayor_v32),
		 .datos_salida(resultado_v32)
);


		 
/*
CONTEXTO
==========================================================================

*/	
	comparador_bytes_filas comparador_limite_31_32 (
		 .fila_1({fila1_v31[31:0],fila1_v32[63:32]}), 
		 .fila_2({fila2_v31[31:0],fila2_v32[63:32]}), 
		 .fila_3({fila3_v31[31:0],fila3_v32[63:32]}), 
		 .fila_4({fila4_v31[31:0],fila4_v32[63:32]}), 
		 .fila_5({fila5_v31[31:0],fila5_v32[63:32]}), 
		 .seleccion(seleccion_pixeles_v_31_32), 
		 .byte_mayor(byte_mayor_v31_v32)
		 );

		 
		 
/*
CONTEXTO
==========================================================================

*/	
	registro_resultado reg_v31_v32(
		 .clk(clk),
		 .reset(reset),
		 .habilitador(habilitador_v31_v32),
		 .datos_entrada(byte_mayor_v31_v32),
		 .datos_salida(resultado_v31_v32)
);		 
		 
		 
		 
/*
CONTEXTO
==========================================================================

*/	
	FSM_control_pixeles control_pixeles_31_32 (
		 .clk(clk), 
		 .reset(reset), 
		 .iniciar_cambio(liberar_bus_v31_v32), 
		 //
		 .guardar_dato(habilitador_v31_v32),
		 .valor_pixel(seleccion_pixeles_v_31_32)
		 );
		 
		 
//#######################################################################################################
//#######################################################################################################
//#######################################################################################################
//#######################################################################################################
//#######################################################################################################


	
/*
CONTEXTO
==========================================================================

*/
	mux_2_1 direccion_final_puerto_1 (
		 .entrada_1(direcciones_lectura_1), 
		 .entrada_2(direcciones_escritura_1), 
		 .seleccion(seleccion_bus_memoria_final), 
		 .salida(direccion_port1)
		 );
	
	defparam direccion_final_puerto_1.BITS_DATOS = BITS_DIRECCION_P1;


/*
CONTEXTO
==========================================================================

*/
	mux_2_1 direccion_final_puerto_2 (
    .entrada_1(direcciones_lectura_2), 
    .entrada_2(direcciones_escritura_2), 
    .seleccion(seleccion_bus_memoria_final), 
    .salida(direccion_port2)
    );
	
	defparam direccion_final_puerto_2.BITS_DATOS = BITS_DIRECCION_P2;


		 
/*
CONTEXTO
==========================================================================

*/
	mux_16_1 datos_escritura_p1 (
		 .entrada_1({16'b0, 						  resultado_v1,  resultado_v1_v2[31:16]}), 
		 .entrada_2({resultado_v2_v3[15:0],   resultado_v3,  resultado_v3_v4[31:16]}),
		 .entrada_3({resultado_v4_v5[15:0],   resultado_v5,  resultado_v5_v6[31:16]}),
		 .entrada_4({resultado_v6_v7[15:0],   resultado_v7,  resultado_v7_v8[31:16]}),
		 .entrada_5({resultado_v8_v9[15:0],   resultado_v9,  resultado_v9_v10[31:16]}),
		 .entrada_6({resultado_v10_v11[15:0], resultado_v11, resultado_v11_v12[31:16]}),
		 .entrada_7({resultado_v12_v13[15:0], resultado_v13, resultado_v13_v14[31:16]}),
		 .entrada_8({resultado_v14_v15[15:0], resultado_v15, resultado_v15_v16[31:16]}),
		 .entrada_9({resultado_v16_v17[15:0], resultado_v17, resultado_v17_v18[31:16]}),
		.entrada_10({resultado_v18_v19[15:0], resultado_v19, resultado_v19_v20[31:16]}),
		.entrada_11({resultado_v20_v21[15:0], resultado_v21, resultado_v21_v22[31:16]}),
		.entrada_12({resultado_v22_v23[15:0], resultado_v23, resultado_v23_v24[31:16]}),
		.entrada_13({resultado_v24_v25[15:0], resultado_v25, resultado_v25_v26[31:16]}),
		.entrada_14({resultado_v26_v27[15:0], resultado_v27, resultado_v27_v28[31:16]}),
		.entrada_15({resultado_v28_v29[15:0], resultado_v29, resultado_v29_v30[31:16]}),
		.entrada_16({resultado_v30_v31[15:0], resultado_v31, resultado_v31_v32[31:16]}),
		 .seleccion(seleccion_datos_escribir_mem), 
		 .salida(datos_escribir_port1)
		 );
	
	defparam datos_escritura_p1.BITS_DATOS = BITS_PALABRA;
	


	/*
CONTEXTO
==========================================================================

*/
	mux_16_1 datos_escritura_p2 (
		 .entrada_1({resultado_v1_v2[15:0],   resultado_v2,  resultado_v2_v3[31:16]}),
		 .entrada_2({resultado_v3_v4[15:0],   resultado_v4,  resultado_v4_v5[31:16]}),
		 .entrada_3({resultado_v5_v6[15:0],   resultado_v6,  resultado_v6_v7[31:16]}),
		 .entrada_4({resultado_v7_v8[15:0],   resultado_v8,  resultado_v8_v9[31:16]}),
		 .entrada_5({resultado_v9_v10[15:0],  resultado_v10, resultado_v10_v11[31:16]}),
		 .entrada_6({resultado_v11_v12[15:0], resultado_v12, resultado_v12_v13[31:16]}),
		 .entrada_7({resultado_v13_v14[15:0], resultado_v14, resultado_v14_v15[31:16]}),
		 .entrada_8({resultado_v15_v16[15:0], resultado_v16, resultado_v16_v17[31:16]}),
		 .entrada_9({resultado_v17_v18[15:0], resultado_v18, resultado_v18_v19[31:16]}),
		.entrada_10({resultado_v19_v20[15:0], resultado_v20, resultado_v20_v21[31:16]}),
		.entrada_11({resultado_v21_v22[15:0], resultado_v22, resultado_v22_v23[31:16]}),
		.entrada_12({resultado_v23_v24[15:0], resultado_v24, resultado_v24_v25[31:16]}),
		.entrada_13({resultado_v25_v26[15:0], resultado_v26, resultado_v26_v27[31:16]}),
		.entrada_14({resultado_v27_v28[15:0], resultado_v28, resultado_v28_v29[31:16]}),
		.entrada_15({resultado_v29_v30[15:0], resultado_v30, resultado_v30_v31[31:16]}),
		.entrada_16({resultado_v31_v32[15:0], resultado_v32, 16'b0}),
		
		 .seleccion(seleccion_datos_escribir_mem), 
		 .salida(datos_escribir_port2)
		 );
	
	defparam datos_escritura_p2.BITS_DATOS = BITS_PALABRA;

	
	
	


	registro_sumador selec_datos_mem (
		 .clk(clk), 
		 .reset(reset || reiniciar_conteo_columnas), 
		 .sumar(actualizar_selec_data_escr_mem),
		 .resultado(seleccion_datos_escribir_mem)
		 );
	
	defparam selec_datos_mem.CANTIDAD_SUMA = 1;
	defparam selec_datos_mem.BITS_DATOS = 4;	
	
/*
CONTEXTO
==========================================================================

*/
	FSM_liberar_bus sync_escrituras(
		.clk(clk),
		.reset(reset),
		.liberar_1(transaccion_completada_port1),
		.liberar_2(transaccion_completada_port2),
		.liberar_bus(escrituras_completadas),
		.habilitar_siguiente()
	);
	
	
	
/*
CONTEXTO
==========================================================================

*/	
	contador_pulsos contador_columnas (
		 .clk(clk), 
		 .reset(reset || reiniciar_conteo_columnas), 
		 .habilitar_cuenta(contar_columna_procesada), 
		 .cuenta_finalizada(conteo_cols_procesadas)
		 );
		 
	defparam contador_columnas.BITS_PARA_CUENTA = 5;
	defparam contador_columnas.CUENTA_LIMITE = 16;
	
	
/*
CONTEXTO
==========================================================================

*/
	registro_sumador direcciones_mem_wr__fila_1 (
		 .clk(clk), 
		 .reset(reset), 
		 .sumar(sumar_siguiente_fila),
		 .resultado(direccion_fila_actual_p1)
		 );

	defparam direcciones_mem_wr__fila_1.INICIO_REGISTRO = 196608;
	defparam direcciones_mem_wr__fila_1.CANTIDAD_SUMA = 256;
	defparam direcciones_mem_wr__fila_1.BITS_DATOS = BITS_DIRECCION_P1;
		

/*
CONTEXTO
==========================================================================

*/
	registro_sumador_dinamico direcciones_mem_wr_cols_1(
		.clk(clk),
		.reset(reset),
		.base(direccion_fila_actual_p1),
		.guardar(guardar_fila),
		.sumar(actualizar_dir_col),
		.resultado(direcciones_escritura_1)
		 );
		
	defparam direcciones_mem_wr_cols_1.BITS_DATOS = BITS_DIRECCION_P1;
/*
CONTEXTO
==========================================================================

*/
	registro_sumador direcciones_mem_wr__fila_2 (
		 .clk(clk), 
		 .reset(reset), 
		 .sumar(sumar_siguiente_fila),
		 .resultado(direccion_fila_actual_p2)
		 );

	defparam direcciones_mem_wr__fila_2.INICIO_REGISTRO = 65544;
	defparam direcciones_mem_wr__fila_2.CANTIDAD_SUMA = 256;
	defparam direcciones_mem_wr__fila_2.BITS_DATOS = BITS_DIRECCION_P2;	


/*
CONTEXTO
==========================================================================

*/
	registro_sumador_dinamico direcciones_mem_wr_cols_2(
		.clk(clk),
		.reset(reset),
		.base(direccion_fila_actual_p2),
		.guardar(guardar_fila),
		.sumar(actualizar_dir_col),
		.resultado(direcciones_escritura_2)
		 );

	defparam direcciones_mem_wr_cols_2.BITS_DATOS = BITS_DIRECCION_P2;

/*
CONTEXTO
==========================================================================

*/
	FSM_control_escritura control_escritura(
		.clk(clk),
		.reset(reset),
		.iniciar_escritura(iniciar_escritura),
		.escrituras_completadas(escrituras_completadas),
		.columnas_completadas(conteo_cols_procesadas),
		//
		.seleccion_final_bus_mem(seleccion_bus_memoria_final),
		.escribir_mem(escribir_memoria),
		.reiniciar_conteo_cols(reiniciar_conteo_columnas),
		.habilitar_cuenta_col(contar_columna_procesada),
		.guardar_fila_base(guardar_fila),
		.aumentar_fila_base(sumar_siguiente_fila),
		.actualizar_dir_columna(actualizar_dir_col),
		.fila_completa_escrita(proceso_escritura_terminado),
		.actualizar_seleccion_datos_escritura(actualizar_selec_data_escr_mem)
		 );


	
	
	
endmodule 




