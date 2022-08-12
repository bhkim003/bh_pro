module tb_sequence_detector();
    reg clk;
    reg reset_n;
    reg X;

    reg a_0, a_1, a_2, a_3, a_4, a_5, a_6, a_7, a_8, a_9, a_10, a_11, a_12, a_13, a_14;
    wire Z;
    always begin
        #5 clk = ~clk;
    end
    
    integer f_test_pattern, f_result;
    initial begin
        f_test_pattern = $fopen("C:\Users\bhkim\Desktop\ref_c_rand_test_pattern.txt", "rb");
        f_result = $fopen("C:\Users\bhkim\Desktop\ref_v_result.txt", "wb");
    end

    integer iterate;
    initial begin
        // initialalize
        reset_n = 1'b1;
        clk = 0;

        //reset
        $display("Reset. [%d]", $time);
        #100 reset_n = 0;
        #10 reset_n = 1;

        //read test pattern
        $display("give test pattern. [%d]", $time);
        for(iterate = 0; iterate < 100; iterate = iterate + 1) begin
            $fscanf(f_test_pattern, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d \n",
                    a_0, a_1, a_2, a_3, a_4, a_5, a_6, a_7, a_8, a_9, a_10, a_11, a_12, a_13, a_14);
           
            @(posedge clk) #2
            X = a_0; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_1; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_2; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_3; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_4; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_5; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_6; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_7; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_8; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_9; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_10; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_11; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_12; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_13; #1
            $fwrite(f_result, "%d ", Z);

            @(posedge clk) #2
            X = a_14; #1
            $fwrite(f_result, "%d ", Z);

            $fwrite(f_result, "\n");
        end

        $fclose(f_test_paatern);
        $fclose(f_result);
        #100
        $display("Simulation finish [%d]", $time);
        $finish
    end
endmodule