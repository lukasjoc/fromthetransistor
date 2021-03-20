// Verilator "SIMPLE" testbench
// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating
#include "Vhello.h"

int main(int argc, char** argv, char** env) {

  if (false && argc && argv && env) {}

  Vhello * model = new Vhello;

  // Simulate until $finish
  while (!Verilated::gotFinish()) model->eval();

  // Final model cleanup
  model->final();

  delete model;

  return 0;
}

