## 1. Log into prince

`ssh NETID@prince.hpc.nyu.edu`

## 2. Clone repo

`git clone https://github.com/adrianpearl/DSGA1012-Automated-Lyric-Annotation.git`

## 3. Transfer data

Run locally wherever data is currently:
`scp -r data ap3465@prince.hpc.nyu.edu:/home/ap3465`
(change ‘home to ‘scratch’ for large dataset)

## 4. Create BaselingTraining.sh file to start slurm job

Change python commands as needed

## 5. Create virtual environment and put the repo + data inside it (instructions in powerpoint)

`source ~pyenv/py3.6.3/bin/activate`

## 6. With the virtualenv activated, `cd` into the `OpenNMT-py` directory and run:

`pip install -r requirements.txt`

## 7. Launch job
`sbatch BaselineTraining.sh`

Slurm job currently fails with this error:

`THCudaCheck FAIL file=/pytorch/torch/csrc/cuda/Module.cpp line=34 error=35 : CUDA driver version is insufficient for CUDA runtime version`

## 8. As an alternative to the slurm job, start interactive GPU environment with:

`srun --gres=gpu:1 --pty /bin/bash`

Then run the training directly with train.py + the arguments in the BaselineTraining.sh file
