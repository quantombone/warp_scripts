Here are my WARP scripts.  WARP is CMU's cluster owned by the Graphics Group -- you need a special account (beyond SCS) to be able to access this computational resource.

To check the status of the WARP you must be on CMU's network and you can go to the webpage:
http://warp.hpc1.cs.cmu.edu/wordpress/

To log into warp you need to ssh into warp.hpc1.cs.cmu.edu

The main scripts are:

To start a job:

./warp_starter.sh JOB_NAME N_REPLICATE N_CORES_PER_JOB

To list running jobs:

./warp_killer.sh

To kill jobs of name JOB_NAME

./warp_killer.sh JOB_NAME

to check jobs:

showq

