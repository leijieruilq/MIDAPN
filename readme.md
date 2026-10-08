# Revisiting Identity and Spectra Dispersion in Media-Bridged Time Series Forecasting: Linking Multivariate Signals and Narrative Flows

### Introduction
MIDAPN is a unified spatiotemporal forecasting framework for media-bridged time series, designed to bridge conventional multivariate forecasting and narrative-flow multimodal forecasting within a shared backbone. It addresses two key challenges after media pre-alignment: heterogeneous variate relation modeling and temporal-scale mismatch. MIDAPN combines a Multimedia Identity-Aware Graph (MIDAG) for identity-aware cross-variate/cross-media dependency learning with Spectral Prism Convolution (SPConv) for scale-adaptive temporal modeling, enabling broad compatibility across diverse forecasting settings (13 multivariate and 12 multimodal time series datasets).


### Datasets

>> "raw_files.zip" contains 14 multivariate time series datasets while "TaTS-main/data" displays 11 multimodal time series datasets. (Note: "multivariate" NASDQ and "multimodal"  LEU/PTF/MSPG are updated ! Since LEU, PTF, MSPG are originally consist of dispersed time-series–text pairs. We use Gemini 3.1 Pro to organize)

## running programme

### Running style for "multivariate" scenario:


> >(1) cd Time-Series-Library-main.

> >(2) run: nohup bash scripts/long_term_forecast/ECL_script/MIDAG_SPCN.sh > midag_spcn_ecl.log 2>&1 & **(please use your own root path (e.g., --root_path "your_patch" + /electricity/))**.

> >(3) The results are in the corresponding midag_spcn_ecl.log file.


###  Running style for "multimodal" scenario:

> >(1) cd TaTS-main.

> >(2) run: nohup bash scripts/main_forecast_midag_spcn.sh > midag_spcn.log 2>&1 &

> >(3) The results are in the corresponding midag_spcn.log file.
