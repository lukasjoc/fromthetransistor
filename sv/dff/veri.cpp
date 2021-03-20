// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating
#include "Vdff.h"

int main(int argc, char** argv, char** env) {

  if (false && argc && argv && env) {}

  Vdff * model = new Vdff;

  // Simulate until $finish
  while (!Verilated::gotFinish()) model->eval();

  // Final model cleanup
  model->final();

  delete model;

  return 0;
}

