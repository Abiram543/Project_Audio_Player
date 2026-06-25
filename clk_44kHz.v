`default_nettype none
module clk_44kHz(
    input wire clk, rst,
    output reg enable,
    output reg [17:0] addr
   );
   reg [11:0] count;
   always @ (posedge clk or posedge rst) begin
    if(rst) begin   
        addr <= 0;
        count <= 0;
        enable <= 0;
    end
    else begin
        enable <= 1;
        if(count == 12'd2266) begin
            if(addr == 18'd200001)
                addr <= 0;
            else begin
                addr <= addr + 1;
                count <= 0;
            end
        end
        else begin
            count <= count + 1;
        end
    end
   end
    
endmodule
