module fmul_tb;
    parameter DATA_WIDTH = 64;
    reg [DATA_WIDTH - 1:0] a_i;
    reg [DATA_WIDTH - 1:0] b_i;
    wire [DATA_WIDTH - 1:0] c_o;
    
    //Instanciranje DUT-a
    fmul dut (
    .a_i (a_i),
    .b_i (b_i),
    .c_o (c_o)
    );
    
    initial begin
        a_i = 64'h3FF8000000000000;   // 1.5  
        b_i = 64'h4000000000000000;   // 2.0
        #10;
        //expected = 0x4008000000000000
        
        a_i = 64'h4004000000000000;   // 2.5
        b_i = 64'h4010000000000000;   // 4.0
        #10;
        //expected = 0x4024000000000000

        a_i = 64'hBFF4000000000000;   // 1.25
        b_i = 64'h4020000000000000;   // 8.0
        #10;
        //expected = 0xC024000000000000
       
        a_i = 64'hC008000000000000;   // 3.0
        b_i = 64'hC000000000000000;   // -2.0
        #10;
        //expected = 0x4018000000000000
        
        a_i = 64'h3FFC000000000000;   // 1.75
        b_i = 64'h3FFC000000000000;   // 1.75
        #10;
        //expected = 0x4008800000000000
    
    end     
    
endmodule