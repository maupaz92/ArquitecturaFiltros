module avalon_master_interface(
	clk,
	reset_n,
	avalon_read_data,
	avalon_wait_request,
	direccion,
	leer,
	escribir,
	datos_escribir,
	//
	datos_leidos,
	avalon_address,
	avalon_read,
	avalon_write,
	avalon_write_data,
	transaccion_completada
    );

//=========================================================================	 
	 
	 parameter DATA_BITS = 8;
	 parameter ADDRESS_BITS = 5;

//=========================================================================

	input clk;
	input reset_n;
	input avalon_wait_request;
	input [DATA_BITS-1:0] avalon_read_data;
	input [ADDRESS_BITS-1:0] direccion;
	input leer;
	input escribir;
	input [DATA_BITS-1:0] datos_escribir;
	
	// ###
	
	output avalon_read;
	output avalon_write;
	output [DATA_BITS-1:0] avalon_write_data;
	output [ADDRESS_BITS-1:0] avalon_address;
	output [DATA_BITS-1:0] datos_leidos;
	output transaccion_completada;


//=========================================================================
//
//
//	reg [2:0] e_actual, e_siguiente;
//	// registro para mantener el valor del estado
//	// anterior de la singal waitReq, necesaria para indicar
//	// cuando hay un cambio de alto a bajo
//	reg wait_req_previous_state;
//	// signal que indica que ha pasado un pulso de reloj desde que 
//	// waitReq hizo un cambio de alto a bajo. Es decir que la accion que se
//	// estaba ejecutando, lectura o escritura ha concluido
//	reg latch_datos_leidos;
//	// signal que se activa cuando waitReq hace un cambio de 1 a cero
//	wire wait_req_fall;
//	// signal que indica que los datos de entrada deben guardarse
//	wire latch_data;
//	// signal que indica que los valores de los datos se mantienen
//	// hasta que la signla de WaitReq cambie
//	wire hold_data;
//	
//	// 
//	wire [ADDRESS_BITS-1:0] direccion_latch;
//	wire leer_latch;
//	wire escribir_latch;
//	wire [DATA_BITS-1:0] escribir_datos_latch;
//	wire [DATA_BITS-1:0] datos_leidos_latch;
//
//	localparam 
//		E_INICIO = 0,
//		e_1 		= 1,
//		e_2 		= 2;
//
////==========================================================================	
//
//// estado del registro
//	always @(posedge clk) begin
//		
//		wait_req_previous_state <= avalon_wait_request;
//		
//		latch_datos_leidos <= wait_req_fall;
//		
//		if(~reset_n)
//			e_actual <= E_INICIO;
//		else
//			e_actual <= e_siguiente;
//	end
//
//	
//
////==========================================================================
//// siguiente estado logico. Logica Moore
//	always@(*) begin
//		
//		e_siguiente = e_actual;
//		
//		case(e_actual)
//			
//			E_INICIO: begin
//				if(leer || escribir)
//					e_siguiente = e_1;
//			end			
//			e_1: begin
//				if(avalon_wait_request)
//					e_siguiente = e_2;
//				else
//					e_siguiente = E_INICIO;
//			end
//			e_2: begin
//				if(avalon_wait_request)
//					e_siguiente = e_2;
//				else
//					e_siguiente = E_INICIO;
//			end			
//			
//			default: begin
//				e_siguiente = E_INICIO;
//			end
//			
//		endcase
//	end
//
//
////==========================================================================	
//
//	
//	FlipFlopD_Habilitado ff_direccion(
//		 .clk(clk),
//		 .reset(~reset_n),
//		 .habilitador(latch_data),
//		 .datos_entrada(direccion),
//		 .datos_salida(direccion_latch)
//		 );	
//	
//	defparam ff_direccion.BITS_EN_REGISTRO = ADDRESS_BITS;	
//
//	
////==========================================================================	
//	
//	
//	FlipFlopD_Habilitado ff_lectura(
//		 .clk(clk),
//		 .reset(~reset_n),
//		 .habilitador(latch_data),
//		 .datos_entrada(leer),
//		 .datos_salida(leer_latch)
//		 );	
//
////==========================================================================	
//	
//	
//	FlipFlopD_Habilitado ff_escribir(
//		 .clk(clk),
//		 .reset(~reset_n),
//		 .habilitador(latch_data),
//		 .datos_entrada(escribir),
//		 .datos_salida(escribir_latch)
//		 );	
//
//		
////==========================================================================	
//	
//	
//	FlipFlopD_Habilitado ff_escribir_datos(
//		 .clk(clk),
//		 .reset(~reset_n),
//		 .habilitador(latch_data),
//		 .datos_entrada(datos_escribir),
//		 .datos_salida(escribir_datos_latch)
//		 );	
//	defparam ff_escribir_datos.BITS_EN_REGISTRO = DATA_BITS;
//
////==========================================================================	
//	
//	
//	FlipFlopD_Habilitado ff_datos_leidos(
//		 .clk(clk),
//		 .reset(~reset_n),
//		 .habilitador(latch_datos_leidos),
//		 .datos_entrada(avalon_read_data),
//		 .datos_salida(datos_leidos_latch)
//		 );	
//	defparam ff_datos_leidos.BITS_EN_REGISTRO = DATA_BITS;
//	defparam ff_datos_leidos.VALOR_EN_RESET = 1;
//	
////==========================================================================	
//
//
//	// asignaciones internas
//	
//	// al iniciar se guardan los valores de las senales
//	assign latch_data = (e_siguiente == e_1);
//	
//	// activo cuando el WR esta en alto despues del pulso inicial de read/write
//	// y en el pulso despues de que el WR pasa de 1->0	
//	assign hold_data = (e_actual != E_INICIO);
//	
//	//activo cuando el WR pasa de 1->0, esto para guardar los datos provenientes
//	assign wait_req_fall = (avalon_wait_request == 0) && (wait_req_previous_state == 1);
//	
////==========================================================================	
//	// salidas del modulo
//	
//	assign avalon_address = (hold_data == 1) ? direccion_latch : direccion;
//	 
//	assign datos_leidos = (latch_datos_leidos == 1) ? avalon_read_data : datos_leidos_latch;
//	
//	assign avalon_read = (hold_data == 1) ? leer_latch : leer;
//	
//	assign avalon_write = (hold_data == 1) ? escribir_latch : escribir;
//	
//	assign avalon_write_data = (hold_data == 1) ? escribir_datos_latch : datos_escribir;
//	
//	assign transaccion_completada = latch_datos_leidos;
	



	reg [2:0] e_actual, e_siguiente;
	
	// signal que indica que ha pasado un pulso de reloj desde que 
	// waitReq hizo un cambio de alto a bajo. Es decir que la accion que se
	// estaba ejecutando, lectura o escritura ha concluido
	reg latch_datos_leidos;
	
	// signal que indica que los datos de entrada deben guardarse
	wire latch_data;
	
	// signal que indica que los valores de los datos se mantienen
	// hasta que la signla de WaitReq cambie
	wire hold_data;
	
	// 
	wire [ADDRESS_BITS-1:0] direccion_latch;
	wire leer_latch;
	wire escribir_latch;
	wire [DATA_BITS-1:0] escribir_datos_latch;
	wire [DATA_BITS-1:0] datos_leidos_latch;

	localparam 
		E_INICIO = 0,
		e_1 		= 1,
		e_2 		= 2,
		e_3		= 3;

//==========================================================================	

// estado del registro
	always @(posedge clk) begin
	
		if(~reset_n)
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
				if(leer || escribir)
					e_siguiente = e_1;
			end			
			e_1: begin
				if(avalon_wait_request)
					e_siguiente = e_2;
				else
					e_siguiente = e_3;
			end
			e_2: begin
				if(avalon_wait_request)
					e_siguiente = e_2;
				else
					e_siguiente = e_3;
			end
			e_3: begin
				e_siguiente = E_INICIO;
			end
			default: begin
				e_siguiente = E_INICIO;
			end
			
		endcase
	end


//==========================================================================	

	
	FlipFlopD_Habilitado ff_direccion(
		 .clk(clk),
		 .reset(~reset_n),
		 .habilitador(latch_data),
		 .datos_entrada(direccion),
		 .datos_salida(direccion_latch)
		 );	
	
	defparam ff_direccion.BITS_EN_REGISTRO = ADDRESS_BITS;	

	
//==========================================================================	
	
	
	FlipFlopD_Habilitado ff_lectura(
		 .clk(clk),
		 .reset(~reset_n),
		 .habilitador(latch_data),
		 .datos_entrada(leer),
		 .datos_salida(leer_latch)
		 );	

//==========================================================================	
	
	
	FlipFlopD_Habilitado ff_escribir(
		 .clk(clk),
		 .reset(~reset_n),
		 .habilitador(latch_data),
		 .datos_entrada(escribir),
		 .datos_salida(escribir_latch)
		 );	

		
//==========================================================================	
	
	
	FlipFlopD_Habilitado ff_escribir_datos(
		 .clk(clk),
		 .reset(~reset_n),
		 .habilitador(latch_data),
		 .datos_entrada(datos_escribir),
		 .datos_salida(escribir_datos_latch)
		 );	
	defparam ff_escribir_datos.BITS_EN_REGISTRO = DATA_BITS;

//==========================================================================	
	
	
	FlipFlopD_Habilitado ff_datos_leidos(
		 .clk(clk),
		 .reset(~reset_n),
		 .habilitador(transaccion_completada),
		 .datos_entrada(avalon_read_data),
		 .datos_salida(datos_leidos_latch)
		 );	
	defparam ff_datos_leidos.BITS_EN_REGISTRO = DATA_BITS;
	defparam ff_datos_leidos.VALOR_EN_RESET = 1;
	
//==========================================================================	


	// asignaciones internas
	
	// al iniciar se guardan los valores de las senales
	assign latch_data = (e_siguiente == e_1);
	
	// activo cuando el WR esta en alto despues del pulso inicial de read/write
	// y en el pulso despues de que el WR pasa de 1->0	
	assign hold_data = (e_actual == e_1) || (e_actual == e_2);
	
//==========================================================================	
	// salidas del modulo
	
	assign transaccion_completada = (e_actual == e_3);
	
	assign avalon_address = (hold_data == 1) ? direccion_latch : direccion;
	
	assign avalon_read = (hold_data == 1) ? leer_latch : leer;
	
	assign avalon_write = (hold_data == 1) ? escribir_latch : escribir;
	
	assign avalon_write_data = (hold_data == 1) ? escribir_datos_latch : datos_escribir;
	
	assign datos_leidos = (transaccion_completada == 1) ? avalon_read_data : datos_leidos_latch;
	

	
	 
endmodule



