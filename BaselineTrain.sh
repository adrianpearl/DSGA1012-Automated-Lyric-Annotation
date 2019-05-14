#!/bin/sh
#SBATCH -n 1
#SBATCH --tasks-per-node=1
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:p40:1
#SBATCH --mem=64GB

python OpenNMT-py/train.py -save_model model_full \
    -data ../data/CNNDM \
    -train_steps 110000 \
    -global_attention mlp \
    -word_vec_size 256 \
    -rnn_size 1024 \
    -layers 2 \
    -encoder_type brnn \
    -batch_size 32 \
    -valid_batch_size 32 \
    -optim adagrad \
    -max_grad_norm 2 \
    -dropout 0.2 \
    -learning_rate 0.02 \
    -gpu_ranks 0 1 \
    -train_from model_full_step_55000.pt






