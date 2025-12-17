# Analyse Factorielle Discriminante (AFD) et ACP pour la Classification du Cancer du Sein

## 📌 Présentation du projet

Ce dépôt contient un **projet académique réalisé dans le cadre d’un Master en Statistiques et Analyse des Données** à l’**Université Hassan II – Faculté des Sciences Ain Chock**.

L’objectif principal est d’appliquer deux méthodes statistiques majeures :

- **l’Analyse en Composantes Principales (ACP)** pour la réduction de dimension,
- **l’Analyse Factorielle Discriminante (AFD)** pour la classification supervisée,

afin de **classer des cellules cancéreuses du sein** en deux catégories :
**bénignes** ou **malignes**.

Le projet combine des **fondements théoriques**, une **interprétation géométrique** des méthodes et une **implémentation pratique en R**.

---

## 🧠 Méthodes utilisées

### 🔹 Analyse en Composantes Principales (ACP)

- Réduction de la dimension des données
- Gestion de la forte corrélation entre les variables
- Sélection des composantes principales selon la variance expliquée

### 🔹 Analyse Factorielle Discriminante (AFD)

- Méthode de classification supervisée
- Maximisation de la variance inter-classe par rapport à la variance intra-classe
- Projection des observations sur des axes discriminants
- Séparation des groupes bénins et malins

---

## 📊 Jeu de données

- **Nom :** Breast Cancer Wisconsin Dataset
- **Source :** UCI Machine Learning Repository
- **Nombre d’observations :** 569
- **Nombre de variables :** 32
  - 1 variable d’identification
  - 1 variable de diagnostic (B = bénin, M = malin)
  - 30 variables numériques décrivant la taille et la forme des noyaux cellulaires

---

## 🧪 Démarche suivie

1. Importation et préparation des données
2. Analyse exploratoire (moyennes, écarts-types, corrélations)
3. Application de l’ACP avec `prcomp()`
4. Sélection des composantes principales pertinentes
5. Application de l’AFD sur les composantes retenues
6. Visualisation des projections et de l’axe discriminant
7. Interprétation des résultats de classification

---

## 🛠 Outils et technologies

- **Langage :** R
- **Bibliothèques principales :**
  - `stats`
  - `MASS`
  - `ggplot2`
  - `factoextra`
  - `caret`

---

## 📈 Résultats

- Environ **89 % de l’information totale** expliquée par les 6 premières composantes principales
- Séparation nette entre cellules bénignes et malignes
- Fort pouvoir discriminant de l’AFD après réduction de dimension par ACP
- Visualisation claire de la classification sur l’axe discriminant

---

## 📁 Contenu du dépôt

- `src/` : scripts R (analyse exploratoire, ACP, AFD)
- `data/` : jeu de données
- `presentation/` : présentation académique du projet (PDF)
- `results/` : figures et résultats générés

---

## 👩‍🎓 Auteurs

- **Manal Cherkaoui**
- **Mariam Roussafi**
- **Anas Bellouali**

Master – Statistiques et Méthodes Numériques Appliquées  
Université Hassan II – Faculté des Sciences Ain Chock  
Juin 2022

---

## 📚 Références

1. G. Saporta, _Probabilités, analyse de données et statistique_, TECHNIP, 2006
2. G. Kamungu, _Analyse factorielle discriminante_, Université de Kinshasa, 2016
3. Techno-Science – Analyse discriminante
4. J.Y. Baudot – Analyse discriminante linéaire

---

## ⚠️ Avertissement

Ce projet est destiné **exclusivement à des fins pédagogiques et académiques**.  
Il ne doit en aucun cas être utilisé comme outil de diagnostic médical réel.
