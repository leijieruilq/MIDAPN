# Revisiting Identity and Spectra Dispersion in Media-Bridged Time Series Forecasting: Linking Multivariate Signals and Narrative Flows


### Introduction
MIDAPN is a unified spatiotemporal forecasting framework for media-bridged time series, designed to bridge conventional multivariate forecasting and narrative-flow multimodal forecasting within a shared backbone. It addresses two key challenges after media pre-alignment: **heterogeneous variate relation modeling** and **temporal-scale mismatch**. MIDAPN combines a Multimedia Identity-Aware Graph (MIDAG) for identity-aware cross-variate/cross-media dependency learning with Spectral Prism Convolution (SPConv) for scale-adaptive temporal modeling, enabling broad compatibility across diverse forecasting settings (**13 multivariate and 12 multimodal time series datasets**).

## Running programme

### Running style for "multivariate" scenario:


> >(1) cd Time-Series-Library-main.

> >(2) run: nohup bash scripts/long_term_forecast/ECL_script/MIDAG_SPCN.sh > midag_spcn_ecl.log 2>&1 & **(please use your own root path (e.g., --root_path "your_patch" + /electricity/))**.

> >(3) The results are in the corresponding midag_spcn_ecl.log file.


###  Running style for "multimodal" scenario:

> >(1) cd TaTS-main.

> >(2) run: nohup bash scripts/main_forecast_midag_spcn.sh > midag_spcn.log 2>&1 &

> >(3) The results are in the corresponding midag_spcn.log file.

## Motivation
**(a) Revisit variate identity through essence, behavior, and commonality.** 

**(b) Draw inspiration from spectrum dispersion for hierarchical multi-scale temporal learning automatically.**

**(c) Validate the resulting design through cross-media comparison across multivariate and multimodal forecasting.**
<img width="4713" height="1794" alt="KDD图_02" src="https://github.com/user-attachments/assets/e20d7dee-91e5-411e-97ae-ba923c3a3380" />

## Pipeline
MIDAPN adopts a unified encode–project–refine pipeline for both multivariate and multimodal forecasting. Historical representations are extracted by TSEM-his, projected to future horizons by CI-MLP, and further refined by TSEM-pred; multimodal inputs are first aligned into time-series form before entering the same backbone.
<img width="4867" height="1620" alt="KDD图_03" src="https://github.com/user-attachments/assets/dd9f53e9-4449-4f8d-8441-5e8c969743f5" />

## Core Design
TSEM consists of three core modules: DFF for frequency-aware projection, MIDAG for identity-aware relation modeling, and SPConv for adaptive multi-scale temporal reconstruction.
<img width="5195" height="1158" alt="KDD图_04" src="https://github.com/user-attachments/assets/f653c9e8-ce52-4bb0-b83a-405900679ff5" />

## Datasets

>> we contain 13 multivariate time series datasets in "raw_files.zip" and other new csv,  while "TaTS-main/data" displays 12 multimodal time series datasets. (Note: Since LEU, PTF, MSPG are originally consist of dispersed time-series–text pairs. We use Gemini 3.1 Pro to organize)

### Dataset Statistics

We evaluate MIDAPN on **25 real-world datasets**, comprising **13 multivariate** and **12 text-assisted multimodal** benchmarks. These datasets span diverse domains, including **energy, weather, transportation, environment, economics, agriculture, and public health and society**.

The multimodal benchmarks include nine Time-MMD datasets and three multivariate-text datasets (MSPG, LEU, and PTF). Sampling frequencies range from **5-minute to monthly intervals**, enabling evaluation across numerical and narrative-flow forecasting settings.

| Datasets | Variates | Timestamps | Frequency |
|:---|:---:|---:|:---:|
| ETTm2 | 7 | 69680 | 15mins |
| ETTh2 | 7 | 17420 | 1h |
| Flight | 7 | 26304 | 1h |
| Weather | 21 | 52696 | 10mins |
| Traffic | 862 | 17544 | 1h |
| Electricity | 321 | 26304 | 1h |
| Solar | 137 | 35040 | 15mins |
| PEMS03 | 358 | 26208 | 5mins |
| PEMS04 | 307 | 16992 | 5mins |
| PEMS07 | 883 | 28224 | 5mins |
| PEMS08 | 170 | 17856 | 5mins |
| ILI | 7 | 966 | 1week |
| NASDAQ | 12 | 3914 | 1day |
| Agriculture | 1 (time series) + 12 (text dim) | 496 | Monthly |
| Climate | 1 (time series) + 12 (text dim) | 496 | Monthly |
| Economy | 1 (time series) + 12 (text dim) | 423 | Monthly |
| Energy | 1 (time series) + 12 (text dim) | 1479 | Weekly |
| Environment | 1 (time series) + 12 (text dim) | 11102 | Daily |
| Health | 1 (time series) + 12 (text dim) | 1389 | Weekly |
| Security | 1 (time series) + 12 (text dim) | 297 | Monthly |
| SocialGood | 1 (time series) + 12 (text dim) | 900 | Monthly |
| Traffic | 1 (time series) + 12 (text dim) | 531 | Monthly |
| MSPG | 27 (time series) + 12 (text dim) | 37536 | 15mins |
| LEU | 16 (time series) + 12 (text dim) | 34848 | 30mins |
| PTF | 32 (time series) + 12 (text dim) | 8640 | 1h |

### Results
**Comparison with 16 SOTA TSF models**
<img width="1044" height="280" alt="{268AC97D-29FB-4704-9BC0-42A222710D6F}" src="https://github.com/user-attachments/assets/3f5ca316-c35a-4d21-86cb-751e2fb5e485" />
**Long-Context Comparison with 14 SOTA TSFM and PLM-fused models**
<img width="1167" height="205" alt="{964F34B1-9112-440B-93C6-F02A9D48B0F7}" src="https://github.com/user-attachments/assets/e15cb835-5bdd-4b1e-bcf8-910c307c9943" />



