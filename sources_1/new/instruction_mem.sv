`timescale 1ns / 1ps

module instruction_mem (
    input  [31:0] instr_addr,
    output [31:0] instr_data
);

    logic [31:0] rom[0:31];

    initial begin
        //rs1 = 3이고 rs2가 4이고 rd가5fh로 고정
       
        rom[0] =  32'h004182b3;  // ADD  x3, x4, x5
        rom[1] =  32'h005201b3;  // ADD  x3, x4, x5
        
        rom[2]  = 32'h404182b3;  // SUB  x5, x3, x4 (순서 변경됨)
        rom[3]  = 32'h004192b3;  // SLL  x5, x3, x4
        rom[4]  = 32'h0041a2b3;  // SLT  x5, x3, x4
        rom[5]  = 32'h0041b2b3;  // SLTU x5, x3, x4
        rom[6]  = 32'h0041c2b3;  // XOR  x5, x3, x4
        rom[7]  = 32'h0041d2b3;  // SRL  x5, x3, x4
        rom[8]  = 32'h4041d2b3;  // SRA  x5, x3, x4
        rom[9]  = 32'h0041e2b3;  // OR   x5, x3, x4
        rom[10]  = 32'h0041f2b3;  // AND  x5, x3, x4
        
    end
    assign instr_data = rom[instr_addr[31:2]];

endmodule
 