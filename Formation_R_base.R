# script de formation ? R 02/03/2023
###############################################################################

x <- 3
x <- 3+3+NA
(x <- 3+3+NA)
x <- "lapin"

x = 3

calc <- function(x, y, z){
  res = x + y + z
  return(res)
}
xx <- calc(x = 1, y = 2, z = 3)

# ceci est un commentaire



# ne pas mettre de numériques en tête de variable
x_1 <- 
item_1<- "toto" 


##  LES VECTEURS ---------------
# numeric vector
x <- c(1,2,3)
class(x)
# character vector
x <- c("lapin","chien", "poule")
class(x)

# character vector
x <- c(1, "patate",54)
class(x)
x
? vector
# vecteur logique
x <- c(TRUE,TRUE, FALSE)
class(x)
# celui qui pue : factor

# les deux sont possibles 'poule' "lapin" 

x <- c("lapin","chien", "poule", "poule")
y <- as.factor(x)
as.numeric(y)

# pour repasser d'un facteur à un numérique
z<- as.character(y)
z

##  Les data frame ---------------

df <- data.frame("x"=c("lapin","chien", "poule", "poule"),
                 "y"=c(TRUE,TRUE,TRUE, FALSE),
                 "z"=c(1,2,3,4))

# on peut créer un data frame soit en ayant les mêmes longueurs de vecteurs,
# soit en ayant un vecteur de longueur 1 

df <- data.frame("x"=c("lapin","chien", "poule", "poule"),
                 "y"=c(TRUE,TRUE,TRUE, FALSE),
                 "z"=1)
x <- c("lapin","chien", "poule", "poule")
y <- c(TRUE,TRUE,TRUE, FALSE)
z <- c(1,2,3,4)
df <- data.frame("x"=x,
                 "y"=y,
                 "z"=z)
df$x
#df[lignes,colonnes]
df[,"x"]
rownames(df) 
df["1","x"]
rownames(df) <- c("titi","toto", "tutu", "tata")
df
df["titi","x"]
df[1,"x"]
df[1,1]


df[c(1,2),c(1,2)]
df[c("titi","toto"),c("x","y")]
# La réindexation ----------------------
# à la place d'un vecteur de noms, on peut passer un vecteur logique pour récupérer,
# les éléments d'un table, c'est un peu l'équivalent de la clause where
# vue précédemment.


df[c(TRUE,TRUE,FALSE,FALSE), ]
df[, c(TRUE,TRUE,FALSE,FALSE)]

# l'équivalent de ci dessus (première ligne, première colonne) serait :
df[ c(TRUE,FALSE,FALSE,FALSE), c(TRUE,FALSE,FALSE,FALSE)]


var <- df$x == "lapin"
df[var , ]
df[df$x == "lapin" , ]

df2 <- df[df$x == "poule" , ]

#opération sur les data frame :

# rajouter une colonne

(df$nouvelle <- as.factor(df$x))
str(df)
(df$nouvelle <- 2*df$z)
str(df)

#entre la deuxième et la première ligne on "écrase" la valeur qui se trouve
# dans nouvelle (on remplace le contenu de df)

# les listes --------------------------

ll <- list("a" = c(1,2,3),
           "b"= NA,
           "c" = df)

ll1 <- list("a" = c(1,2,3),
           "b"= NA,
           "c" = df,
           "d" = ll)
ll$a
ll[["a"]]
ll[[1]]


# ré-ordonner un facteur -------------------------

df$nouvelle <- as.factor(df$x)
str(df$nouvelle)
levels(df$nouvelle)[c(3,2,1)]

df$nouvelle <- factor(df$nouvelle,levels(df$nouvelle)[c(3,2,1)])

# faire sauter un niveau de facteur
df2 <- df[c(1,2),]
str(df2)
levels(df2$nouvelle)
df2$nouvelle <- droplevels(df2$nouvelle)


# Les matrices  
mat <- matrix(nrow=5, ncol=5)
str(mat)
mat <- as.numeric(mat)
mat <- as.matrix(data.frame("x"=c(1,2,3),"y"=1:3,"z"=seq(1,3,by =1)))
mat %*% mat 

# ------------ evaluation des objets dans R -------------
str(z)
str(y)
length(z)
str(df)
dimnames(df)
rownames(df)
colnames(df)

# conversion des objets

as.numeric()
as.character()
as.integer()
as.logical()
as.factor()

# Les fonctions --------------------------------------

#qu'est ce que j'ai dans mon environnement principal (Global Environment) ?
ls()
rm(xx)

# pour retourner des élements à l'environnement principal 
# on utilise return ou <<-
calc <- function(x, y, z = 1){
  #browser()
  res <- x + y + z
  toto <- (x + y)^2
  toto <<- toto
  return(res)
}

calc <- function(x, y, z = 1){
  #browser()
  if (z==1){
    res <- "lapin"
    return(res)
  } else {
    res <- x + y + z
    toto <- (x + y)^2
    return(toto)
  }
  
}

calc <- function(x, y, z = 1){
  #browser()
  res <- x + y + z
  toto <- (x + y)^2
  stop("On arrête avec les lapins")
  return(list("res"=res, "toto"=toto, "lapin"="lapin"))
}


res <- calc(x = 1, y = 2, z = 3)
res <- calc(x = 1, y = 2)

#un exemple de fonction avec argument par défaut
? sd 
sd(c(1,2,3))
sd(c(1,2,3,NA))
sd(c(1,2,3,NA), na.rm=TRUE)

res <- calc(x = 1, y = 2)


x <- 10
y <- 10
x
y


# pour débugger

rlang::last_trace() 
traceback() 
browser()


# packages

 

install.packages("stringr")
df %>% dplyr::select(x,y)

