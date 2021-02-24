library(readr)
wine=read.csv(file.choose())
wine1<-wine[,2:14]

attach(wine1)

?princomp
pc=princomp(wine1,cor=TRUE,scores=TRUE,covmat=NULL)

summary(pc)
str(pc)
loadings(pc)
plot(pc)
biplot(pc)
plot(cumsum(pc$sdev * pc$sdev) * 100 / (sum(pc$sdev * pc$sdev)), type = "b")

pc$scores[,1:3]

final <- cbind(wine[, 1], pc$scores[, 1:13])
View(final)
aggregate(wine1[, 2:13], by = list(pc$scores))

final <- cbind(wine[, 1], pc$scores[, 1:3])
attach(final)
final=data.frame(final)
plot(final$Comp.1,final$Comp.2)
