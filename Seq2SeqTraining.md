**1. Log into prince**

`ssh NETID@prince.hpc.nyu.edu`

**2. Clone repo [DO ONCE]**

`git clone https://github.com/adrianpearl/DSGA1012-Automated-Lyric-Annotation.git`

Also run the following so that the OpenNMT-py repo is actually cloned (submodules by default are not cloned):

`git submodule update --init`

**3. Transfer data**

Run locally wherever data is currently:
`scp -r data ap3465@prince.hpc.nyu.edu:/home/ap3465`
(change ‘home to ‘scratch’ for large dataset)

**4. Create BaselingTraining.sh file to start slurm job**

Change python commands as needed

**5. Create virtual environment (instructions in powerpoint)**

`source pyenv/py3.6.3/bin/activate`

**6. With the virtualenv activated, `cd` into the `OpenNMT-py` directory and run: [ONLY ONCE]**

`pip install -r requirements.txt`

**7. Run the pre-processing command in OpenNMT-Commands.md**

python OpenNMT-py/preprocess.py -train_src ...
...
...

**8. Launch job**

`sbatch BaselineTrain.sh`

---> **To check status of job:**
-----> squeue -u <NETID>	// this will tell you if it's running
-----> cat slurm-<JOBID>.out	// this tells you what step it's on

**9. Run the test command in OpenNMT-Commands.md**

python OpenNMT-py/translate.py ...
...
...

**(10). As an alternative to the slurm job, start interactive GPU environment with:**

`srun --gres=gpu:1 --pty /bin/bash`
--> to quit: 'exit'

Then run the training directly with train.py + the arguments in the BaselineTraining.sh file
