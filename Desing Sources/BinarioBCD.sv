`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Instituto Tecnológico de Costa Rica
// Students: Alonso Azofeifa - Andrés Vargas - Jose David Luna
// 
// Design Name: Convertidor de Binario a BCD
// Module Name: ConvertidorBCD
// Project Name: Proyecto 2 de Diseño Lógico
// Description: Convierte una entrada de un número bianrio de máximo 14 bit para transformarlo en un código BCD de 16 bits
// 
//////////////////////////////////////////////////////////////////////////////////


module ConvertidorBCD(
    input           clk,
    input           en,
    input   [13:0]  bin_in,
    output  [15:0]  bcd_out,
    output          rdy
    );
    
    //Coficación de los estados
    parameter Inactivo = 3'b000;
    parameter Inicio = 3'b001;
    parameter Agregar = 3'b010;
    parameter SHIFT = 3'b011;
    parameter Final = 3'b100;
    
    //reg [11:0]  bin_data=0;
    reg [27:0]bcd_data = 0;
    reg [2:0]estado = 0;
    reg ocupado = 0;
    reg [3:0]sh_contador = 0;
    reg [1:0]agregar_contador = 0;
    reg resultado = 0;
    
    
    always @(posedge clk)
        begin
        if(en)
            begin
                if(~ocupado)
                    begin
                    bcd_data <= {16'b0, bin_in};
                    estado <= Inicio;
                    end
            end
        
        case(estado)
        
               
            Agregar:
                begin
                case(agregar_contador)
                    0:
                        begin
                        if(bcd_data[15:12] > 4)
                            begin
                                bcd_data[27:12] <= bcd_data[27:12] + 3;
                            end
                            agregar_contador <= agregar_contador + 1;
                        end
                    1:
                        begin
                        if(bcd_data[19:16] > 4)
                            begin
                                bcd_data[27:16] <= bcd_data[27:16] + 3;
                            end
                            agregar_contador <= agregar_contador + 1;
                        end
                    2:
                        begin
                        if((agregar_contador == 2) && (bcd_data[23:20] > 4))
                            begin
                                bcd_data[27:20] <= bcd_data[27:20] + 3;
                            end
                            agregar_contador <= agregar_contador + 1;
                        end
                    3:
                        begin
                        if((agregar_contador == 3) && (bcd_data[27:24] > 4))
                            begin
                                bcd_data[27:24] <= bcd_data[27:24] + 3;
                            end
                            agregar_contador <= 0;
                            estado   <= SHIFT;
                        end
                    endcase
                end
            Inicio:
                begin
                ocupado <= 1;
                estado <= Agregar;
                end
            Inactivo:
                begin
                    resultado <= 0;
                    ocupado <= 0;
                end               
            SHIFT:
                begin
                sh_contador <= sh_contador + 1;
                bcd_data <= bcd_data << 1;
                
                if(sh_contador == 11)
                    begin
                    sh_contador <= 0;
                    estado <= Final;
                    end
                else
                    begin
                    estado <= Agregar;
                    end
                end
            Final:
                begin
                resultado <= 1;
                estado <= Inactivo;
                end
            default:
                begin
                estado <= Inactivo;
                end
            endcase
        end
    assign bcd_out = bcd_data[27:12];
    assign rdy = resultado;
endmodule
