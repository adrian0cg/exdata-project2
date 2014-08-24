source("preliminaries.R")

# prepare data
coalSources <- SCC[grepl("Comb.*Coal",SCC$Short.Name,ignore.case=TRUE),"SCC"]
NEIcoal <- NEI[NEI$SCC %in% coalSource,]

plot4draw <- function() {
        # plot
        with( NEIcoal, {
                # calc
                yearlyCoalEmissionSums <- tapply(Emissions,year, sum)
                # plot
                plot(
                        names(yearlyCoalEmissionSums),
                        yearlyCoalEmissionSums,
                        main="Yearly Total PM25-Emssions form Coal Combustion Sources",
                        xlab="Year", ylab="Sum of PM25-Emissions/[tons]",
                        pch=19, col="blue"
                )
                # trend
                coalCombModel <- lm(yearlyCoalEmissionSums~ as.integer(names(yearlyCoalEmissionSums)))
                abline(coalCombModel,lwd=2,col="red")
        })
        
}
plot4draw()

plot4 <- function() {
        png("plot4.png")
        plot4draw()
        dev.off()
}
plot4()
