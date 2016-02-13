#!/bin/bash

# A script to start my WARP job -- probably something from the DDIP pipeline
# hacked up by Tomasz Malisiewicz (tomasz@cmu.edu)
# THIS IS A DRIVER THAT SHOULD ONLY BE CALLED FROM warp_starter.sh
# DO NOT CALL THIS SCRIPT DIRECTLY!!!

# $Id: warp_driver.sh,v 1.4 2009/04/06 23:06:18 tmalisie Exp $
# $Date: 2009/04/06 23:06:18 $
# $Author: tmalisie $
# $Revision: 1.4 $

if [ ! -n "$PROCSTRING" ]
    then
    echo "PROCSTRING UNDEFINED, not running anything"
    exit
fi


#Output gets written to a unique file per process
#OUTPUT_FILER=/nfs/baikal/tmalisie/lustre/${USER}/outputs/${PROCSTRING}.${HOSTNAME}.$$.output
OUTPUT_FILER=/lustre/${USER}/outputs/${PROCSTRING}.${HOSTNAME}.$$.output

#1.) Jump into my home directory
cd /nfs/hn22/tmalisie/exemplarsvm

#2.) run a niced matlab script  (removed nice!)
#2a) add all subdirectories
#2b) execute the process PROCSTRING which is visible after adding paths 
#2c) exit matlab after running, or on error
#2d) keep writing output to some files continually
#/usr/local/bin/matlab -nodesktop -nosplash -r "cvpr11_paths; try,${PROCSTRING};,catch,disp('Error with script ${PROCSTRING}');end;exit(1);" > $OUTPUT_FILER

#It is quicker to just load the paths necessary for the current project
#Also, I am trying to not write all debug output since it can create rather large log files
#/usr/local/bin/matlab -nodesktop -nosplash -r "addpath(genpath(pwd)); try,${PROCSTRING};,catch,disp('Error with script ${PROCSTRING}');end;exit(1);"

matlab -nodesktop -nosplash -r "addpath(genpath(pwd)); try,${PROCSTRING};,catch,disp('Error with script ${PROCSTRING}');end;exit(1);" > $OUTPUT_FILER

#echo "Finished Without Problems" >> $OUTPUT_FILER
echo "..::Vision Solved::.."
