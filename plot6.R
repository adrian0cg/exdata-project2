source("preliminaries.R")

#prepare data
motorVehicles <- SCC[grepl("veh",SCC$Short.Name,ignore.case=TRUE),"SCC"]
losAngeles <- NEI$fips == "06037"

plot6draw <- function() {
        NEIbaLaMV <- NEI[(baltimore | losAngeles) & NEI$SCC %in% motorVehicles,]
        qplot(
                year, Emissions,
                data = NEIbaLaMV,
                facets = fips~.,
                geom=c("point","smooth"),method=lm
        ) + ggtitle("Emissions of Motor Vehicles in Baltimore vs. Los Angeles")
}
print(plot6draw())

plot6 <- function() {
        png("plot6.png")
        print(plot6draw())
        dev.off()
}
