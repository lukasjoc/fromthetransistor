// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating
#include "Vtop.h"

int main(int argc, char** argv, char** env) {

  if (false && argc && argv && env) {}

  Vtop * model = new Vtop;

  // Simulate until $finish
  while (!Verilated::gotFinish()) model->eval();
  model->final();
  delete model;

  return 0;
}

