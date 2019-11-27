## ----echo=FALSE----------------------------
library(tufte)
knitr::opts_chunk$set(results = "show", echo = TRUE)

## ----overplotting, cache=TRUE, tidy=FALSE, echo=1:4----
## If your computer is slow when plotting reduce the value of n
library("jrGgplot2")
library("ggplot2")
df = overplot_data(n = 20000)
h = ggplot(df) + geom_point(aes(x, y))

## ----echo=FALSE, fig.margin = TRUE, fig.cap="A scatter plot that suffers from over plotting.", fig.height = 4----
h

## ---- echo = TRUE--------------------------
h = ggplot(df) + geom_point(aes(x, y))

## ----cache=TRUE, fig.keep='none', tidy=FALSE, echo = TRUE----
h +  stat_density2d(aes(x, y, fill = ..density..),
                contour = FALSE, geom = "tile")

## ---- echo = TRUE--------------------------
data(outbreaks, package = "jrGgplot2Bio")

## ----tidy=FALSE, echo = TRUE---------------
outbreaks$log_illness = log(outbreaks$illnesses)

## ----fig.keep='none', message=FALSE, echo = TRUE----
ggplot(data = outbreaks) +
  geom_histogram(aes(x = log_illness))

## ----echo=FALSE, message=FALSE, fig.margin = TRUE, fig.cap = "Histogram of log illnesses caused by three pathogens in the USA", fig.height = 4----
ggplot(data = outbreaks) +
  geom_histogram(aes(x = log_illness))

## ----F1, echo=FALSE, message=FALSE, fig.keep='none',results='hide'----
library(dplyr)
data(yeast, package = "jrGgplot2Bio")
yeast = yeast %>% filter(class == "CYT" | class == "EXC")

## ----results='hide', echo = TRUE-----------
library(dplyr)
data(yeast, package = "jrGgplot2Bio")
yeast = yeast %>% filter(class == "CYT" | class == "EXC")

## ----dev='png', out.width='\\textwidth', echo=FALSE, message=FALSE, fig.margin = TRUE, fig.cap = "Two measure of signal sequence recognition and two groups of proteins", fig.height = 4----
ggplot(yeast, aes(x = gvh, y = mcg)) +
  geom_point(aes(col = class)) +
  geom_density2d(aes(col = class), alpha = 0.5) +
  xlab("von Heijne's method") +
  ylab("McGeoch's method")

## ----fig.keep='none', tidy=FALSE, echo = TRUE----
ggplot(yeast, aes(x = gvh, y = mcg)) +
  geom_point() +
  xlab("von Heijne's method")

## ---- fig.keep='none'----------------------
ggplot(yeast, aes(x = gvh, y = mcg)) +
  geom_point() +
  geom_density2d() +
  xlab("von Heijne's method") +
  ylab("McGeoch's method") 

## ---- fig.keep='none'----------------------
ggplot(yeast, aes(x = gvh, y = mcg)) +
  geom_point(aes(col = class)) +
  geom_density2d(aes(col = class), alpha = 0.5) +
  xlab("von Heijne's method") +
  ylab("McGeoch's method")

## ----eval=FALSE, echo=TRUE-----------------
#  library(jrGgplot2)
#  vignette("solutions2", package = "jrGgplot2")

