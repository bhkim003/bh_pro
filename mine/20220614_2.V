module my_module {
    input A, B, D,

    output E

};
    
    wire C;
    // 중간 연결다리 인풋 아웃풋에 해당 x
    assign C = A && B;
    assign E = C||D;
    

endmodule
