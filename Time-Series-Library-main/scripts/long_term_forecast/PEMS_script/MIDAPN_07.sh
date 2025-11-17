export CUDA_VISIBLE_DEVICES=1

model_name=MIDAPN

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./raw_files/PEMS07/ \
  --data_path PEMS07.npz \
  --model_id PEMS07_96_24 \
  --model $model_name \
  --data PEMS \
  --features M \
  --seq_len 96 \
  --pred_len 12 \
  --layers 1 \
  --num_clusters 64 \
  --id_dim 8 \
  --cluster_dim 8 \
  --graph_dim 32 \
  --d_model 256 \
  --enc_in 883 \
  --learning_rate 0.0005 \
  --des 'Exp' \
  --train_epochs 30 \
  --patience 3 \
  --itr 1 \
  --gpu 0 \
  --loss 'MAE' \
  --use_last 0 \
  --use_revin 0 \
  --batch_size 32

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./raw_files/PEMS07/ \
  --data_path PEMS07.npz \
  --model_id PEMS07_96_24 \
  --model $model_name \
  --data PEMS \
  --features M \
  --seq_len 96 \
  --pred_len 24 \
  --layers 1 \
  --num_clusters 64 \
  --id_dim 8 \
  --cluster_dim 8 \
  --graph_dim 32 \
  --d_model 256 \
  --enc_in 883 \
  --learning_rate 0.0005 \
  --des 'Exp' \
  --train_epochs 30 \
  --patience 3 \
  --itr 1 \
  --gpu 0 \
  --loss 'MAE' \
  --use_last 0 \
  --use_revin 0 \
  --batch_size 32

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./raw_files/PEMS07/ \
  --data_path PEMS07.npz \
  --model_id PEMS07_96_48 \
  --model $model_name \
  --data PEMS \
  --features M \
  --seq_len 96 \
  --pred_len 48 \
  --layers 1 \
  --num_clusters 64 \
  --id_dim 8 \
  --cluster_dim 8 \
  --graph_dim 32 \
  --d_model 512 \
  --enc_in 883 \
  --learning_rate 0.003 \
  --des 'Exp' \
  --train_epochs 30 \
  --patience 3 \
  --itr 1 \
  --gpu 0 \
  --loss 'MAE' \
  --use_last 1 \
  --use_revin 0 \
  --batch_size 32
  # --weight_decay 0.0003 \
  # --use_last 1 \
  # --use_revin 1 \

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path ./raw_files/PEMS07/ \
  --data_path PEMS07.npz \
  --model_id PEMS07_96_96 \
  --model $model_name \
  --data PEMS \
  --features M \
  --seq_len 96 \
  --pred_len 96 \
  --layers 1 \
  --num_clusters 64 \
  --id_dim 32 \
  --cluster_dim 8 \
  --graph_dim 32 \
  --d_model 128 \
  --enc_in 883 \
  --learning_rate 0.003 \
  --des 'Exp' \
  --train_epochs 30 \
  --patience 3 \
  --itr 1 \
  --gpu 0 \
  --loss 'MAE' \
  --use_last 1 \
  --use_revin 0 \
  --batch_size 32
  # --weight_decay 0.0003 \
  # --use_last 1 \
  # --use_revin 1 \
