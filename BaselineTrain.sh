#!/bin/sh
#SBATCH -n 1
#SBATCH --tasks-per-node=1
#SBATCH --time=48:00:00
#SBATCH --gres=gpu:2
#SBATCH --mem=8GB

python OpenNMT-py/train.py -save_model demo_model \
    -data ../data/CNNDM \
    -train_steps 40000 \
    -global_attention mlp \
    -word_vec_size 256 \
    -rnn_size 1024 \
    -layers 2 \
    -encoder_type brnn \
    -batch_size 64 \
    -valid_batch_size 64 \
    -optim adagrad \
    -max_grad_norm 2 \
    -dropout 0. \
    -learning_rate 0.02 \
    -gpu_ranks 0 1






