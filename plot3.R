source("preliminaries.R")
library(ggplot2)

plot3draw <- function() {
        qplot(NEI$year[baltimore],NEI$Emission[baltimore])                
}
plot3draw()

plot3 <- function() {
        png(filename="plot3.png")
        plot3draw()
        dev.off()
}
plot3()
