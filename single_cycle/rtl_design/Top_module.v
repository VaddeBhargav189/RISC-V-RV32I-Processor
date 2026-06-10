`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 12:02:50
// Design Name: 
// Module Name: Top_module
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


module Top_module(
     input clk,
     input reset
    );
   wire [31:0] next_pc ;
   wire [31:0] pc;
   wire [31:0] Instruction;
   wire [6:0] opcode;
   wire [2:0] funct3;
   wire [6:0] funct7;
   wire [4:0] rs1,rs2,rd;
   wire Regwrite,memread,memwrite,branch,jump,jalr,opdsel;
   wire [2:0] alu_op;
   wire [1:0] Resultsrc;
   wire [31:0] immediate_value;
   wire [3:0] alu_sel;
   wire [31:0] Writedata;
   wire [31:0] read_data1,read_data2;
   wire [31:0] A,B;
   wire [31:0] result;
   wire Zero_flag,set_lt,set_ltu;
   wire branch_taken;
   wire [31:0] memory_data;
   
  Program_counter   Program_counter_insta(.clk(clk),.reset(reset),.next_pc(next_pc),.pc(pc));
  
  Instruction_memory Instruction_memory_insta(.pc(pc),.Instruction(Instruction));
  
  Instruction_decode Instruction_decode_insta(.Instruction(Instruction),.opcode(opcode),.funct3(funct3),.funct7(funct7),.rs1(rs1),.rs2(rs2),.rd(rd));
  
  Control_unit Control_unit_insta(.opcode(opcode),.Regwrite(Regwrite),.memread(memread),.memwrite(memwrite),.branch(branch),.jump(jump),.jalr(jalr),.opdsel(opdsel),.alu_op(alu_op),.Resultsrc(Resultsrc));
  
  Immediate_generator Immediate_generator_insta(.instruction(Instruction),.immediate_value(immediate_value));
  
  Alu_controller Alu_controller_insta(.alu_op(alu_op),.funct3(funct3),.funct7(funct7),.alu_sel(alu_sel));
  
  Register_file Register_file_insta(.clk(clk),.Regwrite(Regwrite),.rs1(rs1),.rs2(rs2),.rd(rd),.Writedata(Writedata),.read_data1(read_data1),.read_data2(read_data2));
  
  // Operand selections 
  // Operand A selection
  assign A = (opcode==7'b0010111)?pc:read_data1;
  
  //Operand B selection
  assign B = (opdsel)?immediate_value:read_data2;
  
  ALU ALU_insta(.A(A),.B(B),.alu_sel( alu_sel),.result(result),.Zero_flag(Zero_flag),.set_lt(set_lt),.set_ltu(set_ltu));
  
  Branch_logic Branch_logic_insta(.branch(branch),.Zero_flag(Zero_flag),.set_lt(set_lt),.set_ltu(set_ltu),.funct3(funct3),.branch_taken(branch_taken));
  
   PC_update  PC_update_insta(.jump(jump),.jalr(jalr),.branch_taken(branch_taken),.pc(pc),.read_data1(read_data1),.immediate(immediate_value),.next_pc(next_pc));
   
   Data_memory Data_memory_insta(.clk(clk),.memwrite(memwrite),.memread(memread),.adrs(result),.write_data(read_data2),.funct3(funct3),.read_data(memory_data));

   Write_back Write_back_insta(.alu_result(result),.pc(pc),.immediate(immediate_value),.memory_data(memory_data),.resultsrc(Resultsrc),.write_data(Write_data));
endmodule
