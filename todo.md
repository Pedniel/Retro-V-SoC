# RISC-V (RV32I) Core – TODO

## 1. Setup
- [x] Download RISC-V Unprivileged ISA spec (RV32I)
      → https://docs.riscv.org/reference/isa/unpriv/rv32.html
- [ ] Define instruction formats (R/I/S/B/U/J)
      → understand bit layouts + where opcode/rs1/rs2/rd/immediates live
- [ ] Set up project structure (src/, tb/)
- [ ] Use array for registers instead of hardcoded regs.

## 2. Basic Components
- [ ] Implement PC register
      → simple 32-bit register with enable/reset
- [ ] Implement register file (32×32, 2R1W)
      → 2 read ports, 1 write port, x0 hardwired to 0
- [ ] Implement ALU (ADD, SUB, AND, OR, XOR)
      → controlled via ALU control signals
- [ ] Implement immediate generator (I/S/B types first)
      → extract, reconstruct, sign-extend immediates

## 3. Instruction Decode
- [ ] Parse opcode, funct3, funct7
      → slice fields from instruction word
- [ ] Build main control unit (RegWrite, MemRead, etc.)
      → opcode → high-level control signals
- [ ] Build ALU control unit
      → funct3/funct7 → specific ALU operation

## 4. Datapath Wiring
- [ ] Connect register file → ALU  
    → rs1/rs2 as inputs
- [ ] Add ALU operand muxes (rs2 vs imm)  
      → select register or immediate
- [ ] Add writeback mux (ALU vs memory)  
      → choose result to write into rd
- [ ] Add PC+4 adder  
      → default next instruction

## 5. Memory
- [ ] Implement instruction memory (ROM or simple array)  
      → indexed by PC
- [ ] Implement data memory (load/store)  
      → address from ALU
- [ ] Wire LW / SW  
      → MemRead/MemWrite control

## 6. Control Flow
- [ ] Implement branch comparator (BEQ)  
      → compare rs1 == rs2
- [ ] Compute branch target (PC + imm)  
      → use B-type immediate
- [ ] Add next-PC mux (PC+4 vs branch)  
      → select based on branch condition
- [ ] Add JAL support (PC-relative jump)  
      → write PC+4 to rd, jump to target

## 7. Integration
- [ ] Build single-cycle top module  
      → connect datapath + control
- [ ] Connect all control signals  
      → ensure correct mux + enable behavior
- [ ] Run simple programs (hand-encoded)  
      → sanity check execution

## 8. Testing
- [ ] Write unit tests (ALU, regfile, decoder)  
      → verify modules in isolation
- [ ] Add integration testbench  
      → run instruction sequences
- [ ] Verify instruction sequences  
      → check register/memory results

## 9. Optional Improvements
- [ ] Add more instructions (SLT, ORI, etc.)  
      → expand ALU + decode
- [ ] Add JALR  
      → indirect jumps via register
- [ ] Add pipeline (5-stage)  
      → IF/ID/EX/MEM/WB split

