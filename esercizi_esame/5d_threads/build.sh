#!/bin/bash

gcc -ansi -D_POSIX_C_SOURCE=200112L $1 DBGpthread.c -lpthread
