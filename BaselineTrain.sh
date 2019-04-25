#!/bin/sh
#SBATCH -n=1
#SBATCH --tasks-per-node=1
#SBATCH --time=48:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=8GB

python OpenNMT-py/train.py -save_model demo_model \
    -data ../data/CNNDM \
    -train_steps 1500 \
    -global_attention mlp \
    -word_vec_size 128 \
    -rnn_size 512 \
    -layers 1 \
    -encoder_type brnn \
    -batch_size 16 \
    -valid_batch_size 16 \
    -optim adagrad \
    -max_grad_norm 2 \
    -dropout 0. \
    -learning_rate 0.02 \
    -gpu_ranks 0






