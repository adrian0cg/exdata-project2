source("preliminaries.R")

plot1draw <- function() {
        with( NEI, {
                # calc
                yearlyEmissionSums <- tapply(Emissions,year, sum)
                # plot
                barplot(
                        yearlyEmissionSums,
                        main="Yearly Total PM25-Emssions",
                        xlab="Year", ylab="Sum of PM25-Emissions/[tons]"
                )
        })
}
plot1draw()

plot1 <- function() {
        png(filename="plot1.png")
        plot1draw()
        dev.off()
}
plot1()
