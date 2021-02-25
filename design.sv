module BVM(output BVMvalid, input BVMd, input[1:0] BVMin, input BVMclk);
  
  reg BVMvalid = 1'b0;
  reg[3:0] counter = 4'b0000;
  
  reg temp=1'b0;
  
  always@(posedge BVMclk)
    begin
      if(~BVMvalid)
        begin
          temp=BVMd;
        end
      if(BVMvalid==1'b1)
        begin
          temp=1'b0;
          counter=counter+4'b0001;
          if(counter==4'b1010)
            begin
              BVMvalid=1'b0;
              counter=4'b0000;
              $display("Dispensing over. Now you can give next input.");
            end
        end
      else if(temp==1'b1)
        begin
          case(BVMin)
            2'b00:
              begin
                $display("Dispensing Water");
                $display("Inputs are disabled for next ten clock cycles.");
                BVMvalid=1'b1;
              end
            2'b01:
              begin
                $display("Dispensing Milk");
                $display("Inputs are disabled for next ten clock cycles.");
                BVMvalid=1'b1;
              end
            2'b10:
              begin
                $display("Dispensing Tea");
                $display("Inputs are disabled for next ten clock cycles.");
                BVMvalid=1'b1;
              end
            2'b11:
              begin
                $display("Dispensing Coffee");
                $display("Inputs are disabled for next ten clock cycles.");
                BVMvalid=1'b1;
              end
          endcase
        end
    end
endmodule

module clock(output cc);
  reg cc = 0;
  always
    begin
      #5
      cc=~cc;
    end
endmodule
