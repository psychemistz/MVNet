# MVNet
Minimum Variance Representation Learning

## Abstract
Surface Enhanced Raman Scattering (SERS) spectroscopy is still considered poorly reproducible despite its numerous advantages and is not a sufficiently robust analytical technique for routine implementation outside of academia. In this article, we presented a self-supervised deep learning-based information fusion technique to minimize the variance in the SERS measurements of multiple laboratories for the same target analyte. In particular, a variation minimization model is designed called Minimum-Variance Network (MVNet). Furthermore, a linear regression model is trained using the output of the proposed MVNet. The proposed model showed improved performance in predicting the concentration of the unseen target analyte. The linear regression model trained on the output of the proposed model evaluated by several well-known metrics such as Root Mean Square Error of Prediction (RMSEP), BIAS, Standard Error of Prediction (SEP), and Coefficient of Determination (R^2). The Leave-One-LAB-Out Cross-Validation (LOLABO-CV) results showed that the MVNet also minimizes the variance of completely unseen laboratory datasets while improving the reproducibility and linear fit of the regression model.

## Graphical illustration
MVNet is an autoencoder-style neural network optimized for reducing inter-laboratory variation in SERS spectra. Its output offers improved latent representation compared to raw, unprocessed spectra, as demonstrated in the figure below.

![](https://github.com/psychemistz/MVNet/blob/main/Figures/Figure1.png?raw=true)

## PCA visualization of MVNet output
Compared to raw data embeddings in PC1 and PC2 spaces, MVNet output is centered around the mean spectra of each concentration measurement, as exemplified by the figure below.

![](https://github.com/psychemistz/MVNet/blob/main/Figures/Figure3.png?raw=true)

## Comparison of output spectra
MVNet output results in similar spectra for the same concentrations, albeit with some roughness due to the nonlinear nature of neural networks.

<p align="center">
  <img src="[image-url](https://github.com/psychemistz/MVNet/blob/main/Figures/Figure7.png?raw=true)">
</p>
