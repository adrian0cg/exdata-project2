source("preliminaries.R")

plot2draw <- function() {
        with( NEI, {
                baltimore <- fips == 24510
                # calc
                yearlyBaltimoreEmissions <<- tapply(Emissions[baltimore],year[baltimore], sum)
                # plot
                plot(
                        names(yearlyBaltimoreEmissions),
                        yearlyBaltimoreEmissions,
                        main="Yearly PM25-Emssions from Baltimore (fips 24510)",
                        xlab="Year", ylab="Sum of PM25-Emissions/[tons]",
                        col="blue", pch=19
                )
                baltimoreEmissionModel <<- lm(yearlyBaltimoreEmissions ~ as.integer(names(yearlyBaltimoreEmissions)))
                abline(baltimoreEmissionModel, lwd=2, col="red")        
        })
}
plot2draw()

plot2 <- function() {
        png(filename="plot2.png")
        plot2draw()
        dev.off()
}
plot2()
