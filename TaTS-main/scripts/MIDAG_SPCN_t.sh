#!/bin/bash

set -euo pipefail

# --- 配置区 ---
GPU=${GPU:-0}
root_path=${root_path:-./data}
seed=${seed:-2025}
all_models=(
    "MIDAG_SPCN_t"
    "wo_dff" "wo_g" "wo_sp" "wo_his" "wo_pred" "wo_all"
    "w_adp" "w_conv" "w_fconv"
    "wo_sid" "wo_did" "wo_cluster" "wo_cmi"
)
dataset="LEU_highfreq"
seq_len=8
batch_size=8
prior_weight=0.5
text_emb=12

# Format: pred_len:layers:num_clusters:id_dim:cluster_dim:graph_dim:d_model
configs=(
    "8:1:4:4:16:8:256"
    "10:1:4:4:4:4:512"
    "12:1:4:4:8:4:512"
)

data_path=${dataset}.csv
model_id_prefix=$(basename "${root_path}")

for model_name in "${all_models[@]}"
do
    for config in "${configs[@]}"
    do
        IFS=: read -r pred_len layers num_clusters id_dim cluster_dim graph_dim d_model <<< "$config"

        echo "Running model $model_name on dataset $dataset"
        echo "Hyperparams: layers=$layers, num_clusters=$num_clusters, id_dim=$id_dim, cluster_dim=$cluster_dim, graph_dim=$graph_dim, d_model=$d_model"
        echo "Settings: seq_len=$seq_len, pred_len=$pred_len, batch_size=$batch_size"

        CUDA_VISIBLE_DEVICES=${GPU} python -u run_multi.py \
            --task_name long_term_forecast \
            --is_training 1 \
            --root_path "$root_path" \
            --data_path "$data_path" \
            --model_id "${model_id_prefix}_${seed}_s${seq_len}_p${pred_len}_b${batch_size}_${dataset}" \
            --model "$model_name" \
            --data multi \
            --seq_len "$seq_len" \
            --label_len 0 \
            --pred_len "$pred_len" \
            --text_emb "$text_emb" \
            --batch_size "$batch_size" \
            --des Exp \
            --seed "$seed" \
            --prior_weight "$prior_weight" \
            --enc_in 16 --dec_in 16 --c_out 16 \
            --save_name "result_${model_name}_${dataset}_bert" \
            --llm_model BERT \
            --huggingface_token NA \
            --train_epochs 10 \
            --patience 5 \
            --layers "$layers" \
            --use_revin 0 \
            --use_last 1 \
            --num_clusters "$num_clusters" \
            --id_dim "$id_dim" \
            --cluster_dim "$cluster_dim" \
            --graph_dim "$graph_dim" \
            --d_model "$d_model"
    done
done
