## ----echo=FALSE----------------------------
library(tufte)
knitr::opts_chunk$set(results = "show", echo = TRUE)

## ----echo=FALSE----------------------------
library("ggplot2")
data(aphids, package = "jrGgplot2")

## ---- echo=FALSE, cache=TRUE, pos.width="\\textwidth", fig.width=6,
## fig.pos = "t", fig.cap = "Final figure from section 1.",
## fig.height = 5----
aphids$Block = factor(aphids$Block)
aphids$Water = factor(aphids$Water,
                      levels = c("Low", "Medium", "High"))
ga = ggplot(data = aphids) +
  geom_point(aes(Time, Aphids, colour = Block)) +
  facet_grid(Nitrogen ~ Water) +
  geom_line(aes(Time, Aphids, colour = Block)) +
  theme_bw()

print(ga)

## ----cache=TRUE, results='hide', echo = TRUE----
data(aphids, package = "jrGgplot2")

## ----eval=FALSE, tidy=FALSE, echo = TRUE----
#   + xlab("Time")

## ----fig.keep='none', tidy=FALSE-----------
##Code for figure 1
aphids$Block = factor(aphids$Block)
aphids$Water = factor(aphids$Water,
                      levels = c("Low", "Medium", "High"))
ga = ggplot(data = aphids) +
  geom_point(aes(Time, Aphids, colour = Block)) +
  facet_grid(Nitrogen ~ Water) +
  geom_line(aes(Time, Aphids, colour = Block)) +
  theme_bw()

## ---- echo = TRUE--------------------------
data(yeast, package = "jrGgplot2Bio")

## ----fig.keep='none', echo = TRUE----------
g = ggplot(data = yeast)
g1 = g + geom_point(aes(x = gvh, y = mcg, col = class))

## ----echo=FALSE, pos.width="\\textwidth", fig.margin = TRUE,
## fig.cap = "Signal sequence recognition for proteins of different
## subcellular localisations", label = "F2", fig.height = 4----
g1

## ----fig.keep='none', echo = TRUE----------
g + 
  geom_point(aes(x = gvh, y = mcg, col = class)) +
  facet_grid(~ class)

## ---- fig.keep='none'----------------------
g + 
  geom_point(aes(x = gvh, y = mcg, col = class)) +
  facet_grid(~ class, margins = TRUE)

## ----fig.keep='none'-----------------------
g + 
  geom_point(aes(x = gvh, y = mcg, col = class)) +
  facet_grid(~ class, scales = "free")

## ----fig.keep='none'-----------------------
g + 
  geom_point(aes(x = gvh, y = mcg, col = class)) +
  facet_grid(class ~ .)

## ----F3,echo=FALSE-------------------------
data("outbreaks", package = "jrGgplot2Bio")
g = ggplot(outbreaks, aes(x = year, y = illnesses)) +
  geom_point() +
  geom_smooth() +
  scale_y_log10() +
  facet_grid(state ~ species)

## ---- echo = TRUE--------------------------
data("outbreaks", package = "jrGgplot2Bio")

## ----echo=FALSE, pos.width="\\textwidth", fig.margin = TRUE,
## fig.cap = "The Outbreaks data set.", fig.height = 4----
g

## ----tidy=FALSE----------------------------
g = ggplot(outbreaks, aes(x = year, y = illnesses)) +
  geom_point() +
  geom_smooth() +
  scale_y_log10() +
  facet_grid(state ~ species)

## ---- echo = TRUE, message=FALSE-----------
library(dplyr)
library(GGally)
data(yeast, package = "jrGgplot2Bio")
yeast = select(yeast, -seq, -erl, -pox)

## ---- fig.keep='none', message=FALSE-------
ggpairs(yeast)

## ----eval=FALSE, echo = TRUE---------------
# library("jrGgplot2")
# vignette("solutions3", package = "jrGgplot2")
