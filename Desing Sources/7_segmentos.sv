`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Instituto Tecnológico de Costa Rica
// Students: Alonso Azofeifa - Andrés Vargas - Jose David Luna
// 
// Design Name: 7 segmentos
// Module Name: Varios
// Project Name: Proyecto 2 de Diseño Lógico
// Description: Recibe numero BCD en el cual se va a extrael las unidades, con las cuales se va a tradcuir su contenido para poder mostrar en los paneles de 7 segmentos, ya sea en formato decimal o hexadecimal la representación de dicho número.
// 
//////////////////////////////////////////////////////////////////////////////////

module display_7segmentos(
    input clk,
    input reset,
    input [20:0] codigo_BCD,
    output [7:0] anodo,
    output [6:0] catodo
    );
    
    wire reloj_aux;
    wire [2:0] actualizar;
    wire [3:0] digito;
    
    divisor_reloj Divisor_Reloj (clk, reset, reloj_aux);
    contador_aux Contador (reloj_aux, reset, actualizar);
    
    anodos_encender Anodo (actualizar, anodo);
    unidades_BCD unidades_BCD (codigo_BCD, actualizar, digito);
    catodos_encender Catodos(digito, catodo);
    
endmodule
////////////////////////////////////////////////////////////////////////////
module anodos_encender(
    input [2:0] actualizar,
    output reg [7:0] anodo = 0
    );

    always @ (actualizar)
        begin
            case (actualizar)
                3'b000:
                    anodo = 8'b11111110; 
                3'b001:
                    anodo = 8'b11111101; 
                3'b010:
                    anodo = 8'b11111011; 
                3'b011:
                    anodo = 8'b11110111; 
                3'b100:
                    anodo = 8'b11101111; 
                3'b101:
                    anodo = 8'b11011111; 
                default:
                    anodo = 8'b11111110; 
            endcase
        end
    
endmodule
//////////////////////////////////////////////////////////////////////////////
module unidades_BCD(
    input [15:0] codigo_BCD, //Código BCD
    input [2:0] actualizar,
    output reg [3:0] digito = 0
    );

    always @ (codigo_BCD, actualizar)
        begin
            case (actualizar)
            3'b000: 
                digito = codigo_BCD [3:0]; //Unidades
            3'b001: 
                digito = codigo_BCD [7:4]; //Decenas
            3'b010: 
                digito = codigo_BCD [11:8]; //Centenas
            3'b011: 
                digito = codigo_BCD [15:12]; //Unidades de millar

          
            default:
                digito = codigo_BCD [3:0]; //Dígito que se muestra en el primer dígito (unidades).
            endcase
        end
    
endmodule
//////////////////////////////////////////////////////////////////////////////////
module catodos_encender(
    input [3:0] digito, //Dígito que se va a mostrar en la posición correspondiente.
    output reg [6:0] catodo = 0 //Dígito en código de cátodos que se va a mostrar.
    );

    always @ (digito)
        begin
            case(digito)
                4'b0000:
                    catodo = 7'b1111110; //0 decimal.
                4'b0001:
                    catodo = 7'b0110000; //1 decimal.
                4'b0010:
                    catodo = 7'b1101101; //2 decimal.
                4'b0011:
                    catodo = 7'b1111001; //3 decimal.
                4'b0100:
                    catodo = 7'b0110011; //4 decimal.
                4'b0101:
                    catodo = 7'b1011011; //5 decimal.
                4'b0110:
                    catodo = 7'b1011111; //6 decimal.
                4'b0111:
                    catodo = 7'b1110010; //7 decimal.
                4'b1000:
                    catodo = 7'b1111111; //8 decimal.
                4'b1001:
                    catodo = 7'b1110011; //9 decimal.
               
                    
                //Para los numeros en representacion hexadecimal
                4'b1010:
                    catodo = 7'b1110111; //A hexadecimal.
                    
                4'b1011:
                    catodo = 7'b0011111; //b hexadecimal.
               
                4'b1100:
                    catodo = 7'b1001110; //C hexadecimal.               
               
                4'b1101:
                    catodo = 7'b0111101; //d hexadecimal.
                    
                4'b1110:
                    catodo = 7'b1001111; //E hexadecimal.
                    
                4'b1111:
                    catodo = 7'b1000111; //F hexadecimal.                    
                    
                          
            endcase
        end
    
endmodule
