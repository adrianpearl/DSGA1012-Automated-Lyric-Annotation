#!/bin/sh
#SBATCH -n 1
#SBATCH --tasks-per-node 1
#SBATCH --time 48:00:00
#SBATCH —gres=gpu:1
#SBATCH —mem=8GB
#SBATCH —mail-user=egs345@nyu.edu

python OpenNMT-py/train.py -save_model demo_model \
                -data ../data/CNNDM \
                -train_steps 100 \
                -global_attention mlp \
                -word_vec_size 128 \
                -rnn_size 512 \
                -layers 1 \
                -batch_size 20 \
                -valid_batch_size 16 \
                -optim adagrad
