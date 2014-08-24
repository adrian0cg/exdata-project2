source("preliminaries.R")

#prepare data
motorVehicles <- SCC[grepl("veh",SCC$Short.Name,ignore.case=TRUE),"SCC"]

plot5draw <- function() {
        NEIbaltMV <- NEI[baltimore & NEI$SCC %in% motorVehicles,]
        qplot(
                year, Emissions,
                data = NEIbaltMV,
                geom=c("point","smooth"),method=lm
        ) + ggtitle("Emissions of Motor Vehicles in Baltimore")
}
print(plot5draw())

plot5 <- function() {
        png("plot5.png")
        print(plot5draw())
        dev.off()
}
plot5()
