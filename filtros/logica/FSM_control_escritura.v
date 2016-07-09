


module FSM_control_escritura(
	clk,
	reset,
	iniciar_escritura,
	escrituras_completadas,
	columnas_completadas,
	//
	seleccion_final_bus_mem,
	escribir_mem,
	reiniciar_conteo_cols,
	habilitar_cuenta_col,
	guardar_fila_base,
	aumentar_fila_base,
	actualizar_dir_columna,
	fila_completa_escrita,
	actualizar_seleccion_datos_escritura
    );
	 
	 
	 
	 

	input clk;
	input reset;
	input iniciar_escritura;
	// pulso que indica que un proceso de escritura de datos ha concluido
	input escrituras_completadas;
	// pulso que indica que se han escrito los valores de ventanas correspondientes
	input columnas_completadas;
	
	// signal que indica si se debe utilizar las direcciones de memoria
	// para lectura o escritura, una vez que se inicie con el proceso
	// de escritura, el dato tendra valor de 1
	output seleccion_final_bus_mem;
	output escribir_mem;
	// pulso que reinicia el contador de ventanas escritas
	output reiniciar_conteo_cols;
	// pulso que habilita la cuenta de una ventana escrita en mem
	output habilitar_cuenta_col;
	// pulso que indica que se debe de guardar la direccion base actual de memoria
	// a partir de dicha direccion, las direcciones de ventanas aumentan una cantidad de unidades para 
	// escribir ventnas
	output guardar_fila_base;
	// pulso que aumenta la direccion base para las filas
	output aumentar_fila_base;
	// pulso que aumenta la direccion para escribir ventanas
	output actualizar_dir_columna;
	// pulso que indica que el proceso de escritura de toda una ventana se completo
	output fila_completa_escrita;
	// pulso que actualiza la seleccion de los datos que se van a escribir a memoria
	// depende de la cantidad de ventanas que hayan disponibles para escribir
	output actualizar_seleccion_datos_escritura;

//=========================================================================
	 reg [2:0] e_actual, e_siguiente;
	 
	 localparam 
		E_INICIO		= 0,
		E_1			= 1,
		E_2			= 2,
		E_3			= 3,
		E_4			= 4,
		E_5			= 5;
		
		
		
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
				if(iniciar_escritura)
					e_siguiente = E_1;
			end
			E_1: begin
				e_siguiente = E_2;
			end
			E_2: begin
				e_siguiente = E_3;
			end
			E_3: begin
				if(escrituras_completadas)
					e_siguiente = E_4;
			end
			E_4: begin
				if(columnas_completadas)
					e_siguiente = E_5;
				else
					e_siguiente = E_2;
			end
			E_5: begin
				e_siguiente = E_INICIO;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end		
		


//==========================================================================
		
	assign seleccion_final_bus_mem = (e_actual != E_INICIO);
	assign guardar_fila_base = (e_actual == E_1);
	
	assign escribir_mem = (e_actual == E_2);
	assign habilitar_cuenta_col = (e_actual == E_2);
	
	assign actualizar_dir_columna = (e_actual == E_4);
	assign actualizar_seleccion_datos_escritura = (e_actual == E_4);
	
	assign aumentar_fila_base = (e_actual == E_5);
	assign reiniciar_conteo_cols = (e_actual == E_5);
	assign fila_completa_escrita = (e_actual == E_5);
	
	
		
		
		
		
endmodule

