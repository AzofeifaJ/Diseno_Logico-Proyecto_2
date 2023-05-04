`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Instituto Tecnológico de Costa Rica
// Students: Alonso Azofeifa - Andrés Vargas - Jose David Luna
// 
// Design Name: Controlador de las entradas (switches) 
// Module Name: controladorEntradas
// Project Name: Proyecto 2 de Diseño Lógico
// Description: Toma las entradas de los switches y almacena los datos en dos salidas de 14 bits y un seleccionador de modo de 2 bits
// 
//////////////////////////////////////////////////////////////////////////////////


module controladorEntradas(
    input logic i0,
    input logic i1,
    input logic i2,
    input logic i3,
    input logic i4,
    input logic i5,
    input logic i6,
    input logic i7,
    input logic i8,
    input logic i9,
    input logic i10,
    input logic i11,
    input logic i12,
    input logic i13,
    input logic i14,
    input logic i15,
    input logic[1:0] modo,
    output logic[13:0] binA,
    output logic[13:0] binB
    );
    
    always_comb begin
    if (modo==00) begin
        binA[0]=i0;
        binA[1]=i1;
        binA[2]=i2;
        binA[3]=i3;
        binA[4]=i4;
        binA[5]=i5;
        binA[6]=i6;
        binA[7]=i7;
        binA[8]=i8;
        binA[9]=i9;
        binA[10]=i10;
        binA[11]=i11;
        binA[12]=i12;
        binA[13]=0;
        binB=13'b0000000000000;
    end
    
    else if (modo==01)begin 
        binA[0]=i0;
        binA[1]=i1;
        binA[2]=i2;
        binA[3]=i3;
        binA[4]=i4;
        binA[5]=i5;
        binA[6]=0;
        binA[7]=0;
        binA[8]=0;
        binA[9]=0;
        binA[10]=0;
        binA[11]=0;
        binA[12]=0;
        binA[13]=0;
        binB[0]=i6;
        binB[1]=i7;
        binB[2]=i8;
        binB[3]=i9;
        binB[4]=i10;
        binB[5]=i11;
        binB[6]=0;
        binB[7]=0;
        binB[8]=0;
        binB[9]=0;
        binB[10]=0;
        binB[11]=0;
        binB[12]=0;
        binB[13]=0;
    end
    
    else if (modo==10)begin
    binA[0]=i0;
        binA[1]=i1;
        binA[2]=i2;
        binA[3]=i3;
        binA[4]=i4;
        binA[5]=i5;
        binA[6]=i6;
        binA[7]=i7;
        binA[8]=i8;
        binA[9]=i9;
        binA[10]=i10;
        binA[11]=i11;
        binA[12]=i12;
        binA[13]=i13; 
        binB=13'b0000000000000;
    end
    
    else if (modo==11)begin 
        binA=13'b0000001111111;
    end
    
    else begin 
        binA=13'b0000000000000;
        binB=13'b0000000000000;
    end
    
    end
    
endmodule
