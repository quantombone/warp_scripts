Here are my WARP scripts.  WARP is CMU's cluster owned by the Graphics Group -- you need a special account (beyond SCS) to be able to access this computational resource.

To check the status of the WARP you must be on CMU's network and you can go to the webpage:
http://warp.hpc1.cs.cmu.edu/wordpress/

To log into warp you need to ssh into warp.hpc1.cs.cmu.edu (please see the Graphics group at CMU first)

First edit your home directory which the script automatically cd's into:

    nano warp_driver.sh

To start a job:

    ./warp_starter.sh JOB_NAME N_REPLICATE N_CORES_PER_JOB

To list running jobs:

    ./warp_killer.sh

To kill jobs of name JOB_NAME

    ./warp_killer.sh JOB_NAME

to check jobs:

    showq


----

##Older screen-based parallel job running library

You can also invoke a parallel job using sc.sh, which will launch a special [GNU screen](http://www.gnu.org/s/screen/) session where each tab will be SSH-ed into a single machine.  Please note that this is for old-style SSH-based clusters, not ones based on torque.  If you run sc.sh on a cluster such as CMU's warp people will be unhappy.  If I was an admin, I would probably ban you.

First set up a list of machines you can SSH into which into

    cp machine_list.sh-example machine_list.sh
    nano machine_list.sh

To start a job:

    ./sc.sh JOB_NAME