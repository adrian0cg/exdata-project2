source("preliminaries.R")

question1 <- function () {
        with( NEI, {
                # calc
                yearlyEmissionSums <<- tapply(Emissions,year, sum)
                # plot
                barplot(
                        yearlyEmissionSums,
                        main="Yearly Total PM25-Emssions",
                        xlab="Year", ylab="Sum of PM25-Emissions/[tons]"
                )
        })
}
question1()