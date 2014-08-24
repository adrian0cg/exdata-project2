source("preliminaries.R")
library(ggplot2)

plot3draw <- function() {
        NEIbaltimore <- NEI[baltimore,]
        qplot(
                year, Emissions,
                data = NEIbaltimore,
                facets= type~.,
                geom=c("point","smooth"),method=lm
        ) + ggtitle("Emissions of various source types in Baltimore")
}
print(plot3draw())

plot3 <- function() {
        png(filename="plot3.png",height=960,width=480)
        print(plot3draw())
        dev.off()
}
plot3()
