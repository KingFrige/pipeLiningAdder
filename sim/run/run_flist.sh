#!/bin/bash -f

iverilog -f flist.f -otest.vpp
./test.vpp
