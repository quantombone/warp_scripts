#!/bin/sh

# A shell script to start the main screen session on ANIM machines
# This can in theory run also on WARP (but please please only use PBS not this!)
# This works on the vision machines at CSAIL now
# hacked up by Tomasz Malisiewicz (tomasz@cmu.edu)
# Run like: ./sc.sh script_name
# The above command will run "script_name" on machine 8 through machine 10
# $Id: sc.sh,v 1.20 2009/03/03 05:33:07 tmalisie Exp $
# $Date: 2009/03/03 05:33:07 $
# $Author: tmalisie $
# $Revision: 1.20 $

#This script starts the big job on N anim machines

#read command line argument 1 which is ALWAYS required
if [ ! -n "$1" ]
    then
    echo "Usage: " $0 " script_to_run"
    echo "      script_to_run is MANDTORY"
    exit
else
    PROC=$1
    echo "Found script: " $PROC
fi

#create a name for our driver screen session
export CLUSTY_SESSION_NAME=anim_manage

#determine if the driver session is already running
export ALREADY_RUNNING=`screen -list | grep anim_manage | wc -l`

if [ $ALREADY_RUNNING = "1" ]; then
    echo "Cannot Continue: SCREEN called $CLUSTY_SESSION_NAME is running."
    echo "Just run \"screen -rd\" to resume it"
    #we could be sneaky here and manage a running session, but we don't
    exit;
fi

#echo 'Clearing Out Log Files'
#rm /afs/cs.cmu.edu/user/${USER}/www/screenlogs/mylog*

## START THE DRIVER SCREEN SESSION ###
screen -L -c animrc  

#here we run uncompiled matlabs
export PROCESS_STRING="(/afs/csail.mit.edu/system/amd64_linux26/matlab/latest/bin/matlab -nodesktop -nosplash -r \"try,${PROC};,catch,disp('Error with script');end;exit(1);\")"

#STARTID is a temporary counter variable
STARTID='1'

#run machine list
. ./machine_list.sh

for ind in $MACHINELIST
do
  export SSH_STRING="ssh ${ind}"

  #echo Initializing Virtual Terminal $ind
  # a short sleep is critical to let screen re-adjust its socks
  sleep .4

  screen -S anim_manage -X screen -fn -t A:${ind} $STARTID $SSH_STRING $PROCESS_STRING
  
  #Be verbose -- it is good for the soul
  echo screen -S anim_manage -X screen -fn -t A:${ind} $STARTID $SSH_STRING $PROCESS_STRING
  
  STARTID=`expr $STARTID + 1`
done

echo 'Ending Screener scripty: Now run screen -rd'
