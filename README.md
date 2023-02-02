# Self-Supervised Learning for Inter-laboratory Variation Minimization in Surface Enhanced Raman Scattering (SERS) Spectroscopy
## Abstract
Surface Enhanced Raman Scattering (SERS) spectroscopy is still considered poorly reproducible despite its numerous advantages and is not a sufficiently robust analytical technique for routine implementation outside of academia. In this article, we presented a self-supervised deep learning-based information fusion technique to minimize the variance in the SERS measurements of multiple laboratories for the same target analyte. In particular, a variation minimization model is designed called Minimum-Variance Network (MVNet). Furthermore, a linear regression model is trained using the output of the proposed MVNet. The proposed model showed improved performance in predicting the concentration of the unseen target analyte. The linear regression model trained on the output of the proposed model evaluated by several well-known metrics such as Root Mean Square Error of Prediction (RMSEP), BIAS, Standard Error of Prediction (SEP), and Coefficient of Determination (R^2). The Leave-One-LAB-Out Cross-Validation (LOLABO-CV) results showed that the MVNet also minimizes the variance of completely unseen laboratory datasets while improving the reproducibility and linear fit of the regression model.

## How to use MVNet (Minimum Variance Representation Learning) Network?
The proposed MVNet is a variation minimization method trained on a large-scale European multi-instrument interlaboratory SERS dataset [1]. The dataset is freely available at https://zenodo.org/record/3572359#.Y863YnbMJaQ. The network can be used for both the pre-processing and post processing in concentration prediction linear regression modelling. 
![](https://github.com/psychemistz/MVNet/blob/main/Figures/Figure2.png?raw=true)
Above figure illustrate the data processing pipeline and architecture of the proposed MVNet. (a) MVNet (without concentration level constraint) as a post processing tool for LOESS normalized spectra for regression modeling, (b) MVNet (with concentration level constraint) is used as post-processing tool for EMSC based baseline corrected spectra for regression modeling.

The links to the python implementation of MVNet models using colab notebook are available below

Model1: @https://github.com/psychemistz/MVNet/blob/main/Minimum_Variance_SERS_Net_Laboratory_final.ipynb
Model2: @https://github.com/psychemistz/MVNet/blob/main/MVNet_Model2.ipynb

## Graphical illustration
MVNet is an autoencoder-style neural network optimized for reducing inter-laboratory variation in SERS spectra. Its output offers improved latent representation compared to raw, unprocessed spectra, as demonstrated in the figure below.

![](https://github.com/psychemistz/MVNet/blob/main/Figures/Figure1.png?raw=true)

## PCA visualization of MVNet output
Compared to raw data embeddings in PC1 and PC2 spaces, MVNet output is centered around the mean spectra of each concentration measurement, as exemplified by the figure below.

![](https://github.com/psychemistz/MVNet/blob/main/Figures/Figure3.png?raw=true)

## Comparison of output spectra
MVNet output results in similar spectra for the same concentrations, albeit with some roughness due to the nonlinear nature of neural networks.

<p align="center">
  <img src="https://github.com/psychemistz/MVNet/blob/main/Figures/Figure7.png?raw=true)">
</p>

## Linear Regression Analysis
The linear regression analysis codes were obtained from the following sources
1) For linear regression analysis code, please refer to the authors of [2]. 
2) For other analysis codes e.g., R code of EMSC, please contact to the professor Alois Bonifacio at University of Trieste. (email: abonifacio@units.it)

## Reference
[1] Fornasaro, Stefano, Alsamad, Fatima, Baia, Monica, Batista de Carvalho, Luis A. E., Beleites, Claudia, Byrne, Hugh J., Chiadò, Alessandro, Chis, Mihaela, Chisanga, Malama, Daniel, Amuthachelvi, Dybas, Jakub, Eppe, Gauthier, Falgayrac, Guillaume, Faulds, Karen, Gebavi, Hrvoje, Giorgis, Fabrizio, Goodacre, Royston, Graham, Duncan, La Manna, Pietro, … Bonifacio, Alois. (2019). Dataset for Surface Enhanced Raman Spectroscopy for quantitative analysis: results of a large-scale European multi-instrument interlaboratory study [Data set]. Zenodo. https://doi.org/10.5281/zenodo.3572359

[2] Fornasaro et. al., Surface Enhanced Raman Spectroscopy for Quantitative Analysis: Results of a Large-Scale European Multi-Instrument Interlaboratory Study, Anal Chem, 2020. (https://doi.org/10.1021/acs.analchem.9b05658) 
