python OpenNMT-py/preprocess.py -train_src ../data_200/src-train.txt \
                     -train_tgt ../data_200/tgt-train.txt \
                     -valid_src ../data_200/src-val.txt \
                     -valid_tgt ../data_200/tgt-val.txt \
                     -save_data ../data_200/CNNDM \
                     -src_seq_length 10000 \
                     -tgt_seq_length 10000 \
                     -src_seq_length_trunc 400 \
                     -tgt_seq_length_trunc 100 \
                     -dynamic_dict \
                     -share_vocab \
                     -shard_size 105000

python OpenNMT-py/translate.py -gpu 0 \
                    -batch_size 20 \
                    -beam_size 10 \
                    -model models/model_200_step_15000.pt \
                    -src ../data_200/src-train.txt \
                    -output model_200_train_predictions \
                    -min_length 35 \
                    -verbose \
                    -stepwise_penalty \
                    -coverage_penalty summary \
                    -beta 5 \
                    -length_penalty wu \
                    -alpha 0.9 \
                    -verbose \
                    -replace_unk \
                    -block_ngram_repeat 3