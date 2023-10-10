`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 01:49:00 PM
// Design Name: 
// Module Name: carryLookAhead_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module carryLookAhead_tb(
    );
    
    reg [3:0] A, B;
    reg CI;
    wire [3:0] onesPlace;
    wire [3:0] tensPlace;
    
    carryLookAhead uut(.A(A), .B(B), .Cin(CI), .onesPlace (onesPlace), .tensPlace(tensPlace));
    initial begin
        $dumpfile("waveforem.vcd");
        $dumpvars(0, carryLookAhead_tb);
        
        A = 4'b0000; B=4'b0000; CI=0;
       
        #10
        A = 4'b0001; B=4'b0000;CI=0;
        
        #10
        A = 4'b0010; B=4'b0000;CI=0;
        
        #10
        A = 4'b0011; B=4'b0000;CI=0;
      
        #10
        A = 4'b0100; B=4'b0000;CI=0;
     
        #10
        A = 4'b0101; B=4'b0000;CI=0;
        #10
        A = 4'b1101; B=4'b0001;CI=0;

        #10
        A = 4'b1110; B=4'b0001;CI=0;

        #10
        A = 4'b1111; B=4'b0001;CI=0;

        #10
        A = 4'b0010; B=4'b0010;CI=0;

        #10
        A = 4'b0011; B=4'b0010;CI=0;
 
        #10
        A = 4'b0100; B=4'b0010;CI=0;

        #10
        A = 4'b0101; B=4'b0010;CI=0;
        
        #10
        A = 4'b0110; B=4'b0010;CI=0;

        #10
        A = 4'b0111; B=4'b0010;CI=0;
  
        #10
        A = 4'b1000; B=4'b0010;CI=0;
   
        #10
        A = 4'b1001; B=4'b0010;CI=0;

        #10
        A = 4'b1010; B=4'b0010;CI=0;

        #10
        A = 4'b1011; B=4'b0010;CI=0;

        #10
        A = 4'b1100; B=4'b0010;CI=0;
        
        #10
        A = 4'b1101; B=4'b0010;CI=0;
 
        #10
        A = 4'b1101; B=4'b0010;CI=0;
    
        #10
        A = 4'b0000; B=4'b0000; CI=1;
       
        #10
        A = 4'b0001; B=4'b0000;CI=1;
        
        #10
        A = 4'b0010; B=4'b0000;CI=1;
        
        #10
        A = 4'b0011; B=4'b0000;CI=1;
      
        #10
        A = 4'b0100; B=4'b0000;CI=1;
     
        #10
        A = 4'b0101; B=4'b0000;CI=1;
        #10
        A = 4'b1101; B=4'b0001;CI=1;

        #10
        A = 4'b1110; B=4'b0001;CI=1;

        #10
        A = 4'b1111; B=4'b0001;CI=1;

        #10
        A = 4'b0010; B=4'b0010;CI=1;

        #10
        A = 4'b0011; B=4'b0010;CI=1;
 
        #10
        A = 4'b0100; B=4'b0010;CI=1;

        #10
        A = 4'b0101; B=4'b0010;CI=1;
        
        #10
        A = 4'b0110; B=4'b0010;CI=1;

        #10
        A = 4'b0111; B=4'b0010;CI=1;
  
        #10
        A = 4'b1000; B=4'b0010;CI=1;
   
        #10
        A = 4'b1001; B=4'b0010;CI=1;

        #10
        A = 4'b1010; B=4'b0010;CI=1;

        #10
        A = 4'b1011; B=4'b0010;CI=1;

        #10
        A = 4'b1100; B=4'b0010;CI=1;
 
        #10
        A = 4'b1101; B=4'b0010;CI=1;
        
        #10
        A = 4'b1111; B=4'b1111;CI=1;
        #10
        A = 4'b1111; B=4'b1111;CI=0;
        
        $finish;
     end
endmodule
