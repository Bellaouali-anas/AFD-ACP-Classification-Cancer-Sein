# Factorial Discriminant Analysis (FDA) and PCA for Breast Cancer Classification

## 📌 Project Overview

This repository contains an academic project developed as part of a **Master’s program in Applied Statistics and Data Analysis** at **Université Hassan II – Faculty of Sciences Ain Chock**.

The objective of this project is to apply **Principal Component Analysis (PCA / ACP)** and **Factorial Discriminant Analysis (FDA / AFD)** to classify breast cancer cells as **benign** or **malignant**, using the **Breast Cancer Wisconsin dataset**.

The project combines:

- theoretical foundations of discriminant analysis,
- geometric interpretation of FDA,
- practical implementation in **R**,
- and visualization of classification results.

---

## 🧠 Methods Used

### 1. Principal Component Analysis (PCA / ACP)

- Dimensionality reduction of 30 correlated continuous variables
- Identification of principal components explaining most of the variance
- Selection of components based on eigenvalues and explained variance

### 2. Factorial Discriminant Analysis (FDA / AFD)

- Supervised classification method
- Maximization of inter-class variance relative to intra-class variance
- Projection onto discriminant axes
- Linear classification of cancer cells

---

## 📊 Dataset

- **Name:** Breast Cancer Wisconsin Dataset
- **Source:** UCI Machine Learning Repository
- **Observations:** 569
- **Variables:** 32
  - 1 ID variable
  - 1 diagnostic variable (`B` = benign, `M` = malignant)
  - 30 numerical features describing cell nucleus characteristics

---

## 🧪 Workflow

1. Data import and preprocessing
2. Exploratory data analysis (means, standard deviations, correlations)
3. PCA using `prcomp()`
4. Selection of principal components
5. FDA applied on selected PCA components
6. Visualization of:
   - PCA projections
   - Discriminant axis
   - Class separation
7. Interpretation of classification performance

---

## 🛠 Technologies & Tools

- **Language:** R
- **Main Libraries:**
  - `stats`
  - `MASS`
  - `ggplot2`
  - `factoextra`
  - `caret`

---

## 📈 Results

- Over **89% of total variance** explained by the first 6 principal components
- Clear separation between benign and malignant cells
- FDA shows strong discriminative power when applied after PCA
- Visual confirmation of class separability on the discriminant axis

---

## 📁 Repository Content

- `src/` → R scripts for analysis
- `data/` → Dataset files
- `presentation/` → Original academic presentation (PDF)
- `results/` → Figures and outputs

---

## 👩‍🎓 Authors

- **Manal Cherkaoui**
- **Mariam Roussafi**
- **Anas Bellouali**

Master’s Program – Applied Statistics and Numerical Methods  
Université Hassan II – Faculty of Sciences Ain Chock  
June 2022

---

## 📚 References

1. G. Saporta, _Probabilités, analyse de données et statistique_, TECHNIP, 2006
2. G. Kamungu, _Analyse factorielle discriminante_, Université de Kinshasa, 2016
3. Techno-Science – Analyse discriminante
4. J.Y. Baudot – Analyse discriminante linéaire

---

## ⚠️ Disclaimer

This project is intended for **educational and academic purposes only** and should not be used for real medical diagnosis.
