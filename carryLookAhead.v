`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 01:37:49 PM
// Design Name: 
// Module Name: carryLookAhead
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


module carryLookAhead(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] onesPlace,
    output [3:0] tensPlace
    );
    
    
    wire [3:0] SUM;
    wire Cout;
    
    wire [3:0] G, P, C;
    
    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign SUM =( A ^ B ^ C )|( A & B & C);
    assign Cout = G[3] | (P[3] & C[3]);
    
    binToDec uut1(.SUM(SUM), .Cout(Cout), .onesPlace(onesPlace), .tensPlace(tensPlace));
    
endmodule


module binToDec (input [3:0] SUM, input Cout, output reg[3:0] onesPlace,
    output reg [3:0]  tensPlace );
    
    always @ (SUM, Cout)
        if(!Cout)
            begin
                if (SUM < 4'b1010)
                    begin
                        onesPlace = SUM;
                        tensPlace = 4'b0000;
                    end
                else if (SUM == 4'b1100)
                    begin
                        onesPlace = 4'b0010;
                        tensPlace = 4'b0001;
                    end
                else if (SUM == 4'b1101)
                    begin
                        onesPlace = 4'b0011;
                        tensPlace = 4'b0001;
                    end
                else
                    begin
                        onesPlace = SUM ^ 4'b1010;
                        tensPlace = 4'b0001;
                    end
            end
       else
            begin
                if (!SUM)
                    begin
                        onesPlace = 4'b0110;
                        tensPlace = 4'b0001;
                    end
                else if (SUM == 4'b0001)
                    begin
                        onesPlace = 4'b0111;
                        tensPlace = 4'b0001;
                    end
                else if (SUM == 4'b0010)
                    begin
                        onesPlace = 4'b1000;
                        tensPlace = 4'b0001;
                    end
                else if (SUM == 4'b0011)
                    begin
                        onesPlace = 4'b1001;
                        tensPlace = 4'b0001;
                    end
                else if (SUM < 4'b1000)
                    begin
                        onesPlace = SUM ^ 4'b0100;
                        tensPlace = 4'b0010;
                    end
                else if (SUM < 4'b1100)
                    begin
                        onesPlace = SUM ^ 4'b1100;
                        tensPlace = 4'b0010;
                    end
                else if (SUM < 4'b1110)
                    begin
                        onesPlace = SUM ^ 4'b0100;
                        tensPlace = 4'b0010;
                    end
                else
                    begin
                        onesPlace = SUM ^ 4'b1110;
                        tensPlace = 4'b0011;
                    end
            end
endmodule

module sevenSeg(SUM, display);
    input [3:0] SUM;
    output [6:0] display;
    reg [6:0] disp;
    
    always @ (SUM)
       begin
         case (SUM)
            4'b0000: disp = 7'b1000000; //0
            4'b0001: disp = 7'b1111001; //1
            4'b0010: disp = 7'b0100100; //2
            4'b0011: disp = 7'b0110000;//3
            4'b0100: disp = 7'b0011001; //4
            4'b0101: disp = 7'b0010010; //5
            4'b0110: disp = 7'b0000010; //6
            4'b0111: disp = 7'b1111000; //7
            4'b1000: disp = 7'b0000000; //8
            4'b1001: disp = 7'b0011000; //9
            4'b1010: disp = 7'b1000000; //10
            4'b1011: disp = 7'b1000000; //11
            4'b1100: disp = 7'b1000000; //12
            4'b1101: disp = 7'b1000000; //13
            4'b1110: disp = 7'b1000000; //14
            4'b1111: disp = 7'b1000000; //15
         endcase
       end
     
     assign display = disp;

endmodule