#!/bin/bash

# Parse the docs and generate the main tex
./m2t.sh

# Compile the pdf
time ./t2p.sh