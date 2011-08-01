#!/bin/sh

qsub -N sleeper -l nodes=1:ppn=8 null_driver.sh

