#!/bin/sh
#SBATCH -n 1
#SBATCH --tasks-per-node=1
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:p40:1
#SBATCH --mem=64GB

python OpenNMT-py/translate.py -gpu 0\
                    -batch_size 20 \
                    -beam_size 10 \
                    -model model_full_step_95000.pt \
                    -src ../data/src-val.txt \
                    -tgt ../data/tgt-val.txt \
                    -output tokenized_out_with_bleu \
                    -verbose \
                    -stepwise_penalty \
                    -coverage_penalty summary \
                    -beta 5 \
                    -length_penalty wu \
                    -alpha 0.9 \
                    -verbose \
                    -replace_unk \
                    -block_ngram_repeat 3
