#!/bin/bash -f

iverilog ../../hdl/pipeLiningAdder.v ../testbench/TestBench.v -otest.vpp
./test.vpp
