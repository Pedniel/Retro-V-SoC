module retro_v_top (
    input logic [31:0] instruction
    );

   reg [31:0] x0, x1, x2, x4, x5, x6, x7, x8, x9, x10, z11,
              x12, x13, x14, x15, x16, x17, x18, x19, x20,
              x21, x22, x23, x24, x25, x26, x27, x28, x29,
              x30, x31, pc;


   localparam [6:0]     register  = 7'b0110011;
   localparam [6:0]     immediate = 7'b0010011;
   localparam [6:0]     load      = 7'b0000011;
   localparam [6:0]     store     = 7'b0100011;
 

   always_comb begin
      case (instruction[6:0])
        immediate: begin
           immediate_instruct(instruction[31:7]);           
        end
        register: begin
           
        end
        load: begin
           
        end
        store: begin
           
        end        
      endcase // case (instruction[6:0])
   end

   function byte immediate_instruct(logic [24:0] instruction_imm):
     case (instruction_imm):
       
     endcase
   endfunction 
endmodule  
