`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_controladorEntradas;
    logic[13:0] binA;
    logic[13:0] binB;
    logic[1:0] modo;
    logic i0;
    logic i1;
    logic i2;
    logic i3;
    logic i4;
    logic i5;
    logic i6;
    logic i7;
    logic i8;
    logic i9;
    logic i10;
    logic i11;
    logic i12;
    logic i13;
    logic i14;
    logic i15;
    
    controladorEntradas DUT (
    .binA (binA),
    .binB (binB),
    .modo (modo),
    .i0 (i0),
    .i1 (i1),
    .i2 (i2),
    .i3 (i3),
    .i4 (i4),
    .i5 (i5),
    .i6 (i6),
    .i7 (i7),
    .i8 (i8),
    .i9 (i9),
    .i10 (i10),
    .i11 (i11),
    .i12 (i12),
    .i13 (i13),
    .i14 (i14),
    .i15 (i15)
    );
    
    initial begin 
        i0 = 1;
        i1 = 0;
        i2 = 1;
        i3 = 0;
        i4 = 1;
        i5 = 0;
        i6 = 1;
        i7 = 0;
        i8 = 1;
        i9 = 0;
        i10 = 1;
        i11 = 0;
        i12 = 1;
        i13 = 0;
        i14 = 1;
        i15 = 0;
        modo[0]=i14;
        modo[1]=i15;
        #10;
        $finish;
    end 
endmodule
