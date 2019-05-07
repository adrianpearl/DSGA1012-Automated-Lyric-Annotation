python OpenNMT-py/preprocess.py --train_src data_full/split/src_tok/src-train.txt \
                     --train_tgt data_full/split/tgt-train.txt \
                     --valid_src data_full/split/src_tok/src-val.txt \
                     --valid_tgt data_full/split/tgt-val.txt \
                     --save_data data_full/split/BERT/BERT \
                     --shard_size 100000 \
                     --src_vocab data_full/split/src_tok/src-vocab.txt \
                     --tgt_vocab data_full/split/tgt-vocab.txt
                     


change the name of "-output" below
python OpenNMT-py/translate.py -gpu 0 \
                    -batch_size 20 \
                    -beam_size 10 \
                    -model tokenized_step_40000.pt \
                    -src ../data_tokenized/src-val.txt \
                    -output tokenized_out \
                    -verbose \
                    -stepwise_penalty \
                    -coverage_penalty summary \
                    -beta 5 \
                    -length_penalty wu \
                    -alpha 0.9 \
                    -verbose \
                    -replace_unk \
                    -block_ngram_repeat 3