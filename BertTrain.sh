#!/bin/sh
#SBATCH -n 1
#SBATCH --tasks-per-node=1
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:p40:1
#SBATCH --mem=64GB

python OpenNMT-py/train.py -save_model model_Bert \
    -data ../data_full/split/BERT/BERT \
    -train_steps 1000 \
    -word_vec_size 500 \
    -encoder_type bert \
    -batch_size 64 \
    -valid_batch_size 64 \
    -learning_rate 0.02






