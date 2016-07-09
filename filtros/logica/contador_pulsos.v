`timescale 1ns / 1ps

/*
Autor: Mauricio Paz Valverde

==========================================================================
NOMBRE: contador_pulsos

==========================================================================
PARAMETROS

*BITS_PARA_CUENTA: cantidad de bits necesarios para satisfacer el valor de conteo

*CUENTA_LIMITE: valor que activa la se�al de "cuenta_finalizada"

==========================================================================
PUERTOS FISICOS EN USO: 

*clk: reloj del sistema

*reset: pulso para reinicio

==========================================================================
ENTRADAS: 

*clk

*reset 

*habilitar_cuenta: pulso que en alto permite sumar 1 al registro del contador

==========================================================================
SALIDAS: 

*cuenta_finalizada: pulso que se activa una vez que se han contado "CUENTA_LIMIET" veces


==========================================================================
DESCRIPCION

Modulo que cuenta pulsos, para que se efectue una cuenta, la entrada "habilitar_cuenta" debe estar
en alto. Los pulsos que se cuentan dependen de los parametros para la cantidad de bits y el valor de
conteos. 

*/


module contador_pulsos(
	clk,
	reset,
	habilitar_cuenta,
	cuenta_finalizada
    );
		
	parameter BITS_PARA_CUENTA = 1;
	parameter CUENTA_LIMITE = 1;
	
	input clk;
	input reset;
	input habilitar_cuenta;	
	output cuenta_finalizada;
	
	reg [BITS_PARA_CUENTA-1:0] contador;
	
	always @(posedge clk) begin
		if(reset)
			contador <= 0;
		else
			if(habilitar_cuenta)
				contador <= contador + 1;
			else
				contador <= contador;
	end
	
	assign cuenta_finalizada = (contador >= CUENTA_LIMITE);
	


endmodule





