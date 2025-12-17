



Collectons dabord toutes les 30 variables numériques dans une
matrice wdbc et créons un vecteur de diagnostic où M = 1 et B = 0

## importation de données


```{r}

wdbc <- read.csv("data.csv")

#creer un matrice avec les valeur quantitative 
wdbc.data <- as.matrix(wdbc[,c(3:32)])

# Définir les noms de ligne de wdbc.data
row.names(wdbc.data) <- wdbc$id

# Create diagnosis vector
diagnosis <- as.numeric(wdbc$diagnosis == "M")
diagnosis
```

## L'analyse exploratoire

### Répondons à quelques questions de base :
```{r}
table(wdbc$diagnosis)

### Les Moyennes :
round(colMeans(wdbc.data),2)

### les écartes type :
roundSD <- function(x){
  round(sd(x), 2)
}
apply(wdbc.data, 2, roundSD)
```

### Corrélation

Comment les variables sont-elles liées les unes aux autres ?
  
  ```{r}
library(corrplot)
corMatrix <- wdbc[,c(3:32)]
#Renommer les colnames
cNames <- c("rad_m","txt_m","per_m",
            "are_m","smt_m","cmp_m","con_m",
            "ccp_m","sym_m","frd_m",
            "rad_se","txt_se","per_se","are_se","smt_se",
            "cmp_se","con_se","ccp_se","sym_se",
            "frd_se","rad_w","txt_w","per_w",
            "are_w","smt_w","cmp_w","con_w",
            "ccp_w","sym_w","frd_w")
colnames(corMatrix) <- cNames
# Créer la matrice de corrélation
M <- round(cor(corMatrix), 2)
# Créer un graph du  corrélations
corrplot(M, diag = FALSE, method="color", order="FPC", tl.srt = 90)

```

# ACP

En utilisant l'ACP l'aide de prcomp() , nous pouvons combiner nos
nombreuses variables en différentes combinaisons linéaires qui
expliquent chacune une partie de la variance du modèle.


```{r}
wdbc.pr <- prcomp(wdbc.data, scale = TRUE, center = TRUE)
summary(wdbc.pr)


# Calculer la variabilité de chaque composant
pr.var <- wdbc.pr$sdev ^ 2

# Variance expliquée par chaque composante principale : pve
pve <- pr.var/sum(pr.var)

#Valeurs propres
round(pr.var, 2)

# Pourcentage d'information expliqué
round(pve, 2)

# Pourcentage cumulé expliqué
round(cumsum(pve), 2)

# graph  des informations expliquées par les composantes
plot(pve, xlab = "Principal Component", 
     ylab = "Proportion of Variance Explained", 
     ylim = c(0, 1), type = "b")

```


```{r}
# Scatter plot des observations sur les composantes 1 et 2
plot(wdbc.pr$x[, c(1, 2)], col = (diagnosis + 1), 
     xlab = "PC1", ylab = "PC2")
legend(x="topleft", pch=1, col = c("red", "black"), legend = c("B", "M"))
```

Daprès les diagrammes de dispersion de la composante principale,
il est évident quil existe un certain regroupement de points bénins
et malins. Ceci suggère que nous pourrions construire un axe 
discriminant linéaire en utilisant ces composantes principales.


## AFD

Maintenant que nous avons nos composantes principales choisies,
nous pouvons effectuer lanalyse discriminante linéaire.

la première étape consiste à projeter vos données sur les
composants principaux, puis nous effectuons LDA sur le diagnostics

```{r}

#projection des données 
wdbc.pcs <- wdbc.pr$x[,1:6]
head(wdbc.pcs, 20)
#ajouter le vecteur diagnostics 
wdbc.pcst <- wdbc.pcs
wdbc.pcst <- cbind(wdbc.pcs, diagnosis)
head(wdbc.pcst)
```
# Effectuer LDA sur diagnostic à l'aide du lda() du package MASS 

```{r}
library(MASS)
# convertir une matrice en dataframe
wdbc.pcst.df <- as.data.frame(wdbc.pcst)
# Effectuer LDA sur diagnostic
wdbc.lda <- lda(diagnosis ~ PC1 + PC2 + PC3 + PC4 + PC5 + PC6, data = wdbc.pcst.df)
wdbc.lda
```

# visualizer les données 
```{r}
#projection sur l'axe
dt <- wdbc.pcst.df[-7]
Axe_Discriminnant <- sapply(1:nrow(dt) , function(i)  { sum( dt[i,]*wdbc.lda$scaling) }  )
df <-  data.frame(Axe_Discriminnant, diagnosis = as.factor(diagnosis))

#trace du figure
library(ggplot2)
ggplot(data =df)+
  geom_density(aes(Axe_Discriminnant, fill = diagnosis), alpha = 0.5)
```