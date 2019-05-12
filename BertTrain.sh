#!/bin/sh
#SBATCH -n 1
#SBATCH --tasks-per-node=1
#SBATCH --time=48:00:00
#SBATCH --gres=gpu:p1080:1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB

python OpenNMT-py/train.py -save_model model_Bert \
    -data ../../data_full/split/BERT/BERT \
    -train_steps 125000 \
    -encoder_type bert \
    -layers 1 \
    -rnn_size 768 \
    -batch_size 32 \
    -valid_batch_size 32 \
    -learning_rate 0.02 \
    -gpu_ranks 0 \
    -save_checkpoint_steps 8000 \
    -bert_vocab ../../data_full/split/src_tok/src-vocab.vcb
