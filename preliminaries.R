obtainNeiData <- function() {
        # obtain
        remoteFileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        localFileName <- "NEI_data.zip"
        if (!file.exists(localFileName)) {
                message("downloading NEI")
                download.file(remoteFileUrl,localFileName, method="curl")
        }
        # unpack
        unzip(localFileName, exdir = "data", overwrite=FALSE, junkpaths = TRUE)
}
obtainNeiData()

loadNeiData <- function() {
        if (!exists("NEI") || is.null(NEI) || any(dim(NEI) != c(6497651,6))) {
                message("loading NEI")
                NEI <<- readRDS("data/summarySCC_PM25.rds")
                NEI$type = as.factor(NEI$type)
        }
        if (!exists("SCC") || is.null(SCC) || any(dim(SCC) != c(11717,15))) {
                message("loading SCC")
                SCC <<- readRDS("data/Source_Classification_Code.rds")
        }
}
loadNeiData()

baltimore <- NEI$fips == "24510"
