// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdff.h for the primary calling header

#include "Vdff.h"
#include "Vdff__Syms.h"

//==========

Vdff::Vdff(const char* __VCname)
    : VerilatedModule(__VCname)
 {
    Vdff__Syms* __restrict vlSymsp = __VlSymsp = new Vdff__Syms(this, name());
    Vdff* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vdff::__Vconfigure(Vdff__Syms* vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
    if (false && this->__VlSymsp) {}  // Prevent unused
    Verilated::timeunit(-12);
    Verilated::timeprecision(-12);
}

Vdff::~Vdff() {
    VL_DO_CLEAR(delete __VlSymsp, __VlSymsp = nullptr);
}

void Vdff::_initial__TOP__1(Vdff__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdff::_initial__TOP__1\n"); );
    Vdff* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    VL_FINISH_MT("dff.sv", 15, "");
}

void Vdff::_settle__TOP__3(Vdff__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdff::_settle__TOP__3\n"); );
    Vdff* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->invq = (1U & (~ (IData)(vlTOPp->q)));
}

void Vdff::_eval_initial(Vdff__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdff::_eval_initial\n"); );
    Vdff* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_initial__TOP__1(vlSymsp);
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP__r = vlTOPp->r;
}

void Vdff::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdff::final\n"); );
    // Variables
    Vdff__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vdff* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vdff::_eval_settle(Vdff__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdff::_eval_settle\n"); );
    Vdff* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__3(vlSymsp);
}

void Vdff::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdff::_ctor_var_reset\n"); );
    // Body
    d = VL_RAND_RESET_I(1);
    r = VL_RAND_RESET_I(1);
    clk = VL_RAND_RESET_I(1);
    q = VL_RAND_RESET_I(1);
    invq = VL_RAND_RESET_I(1);
}
