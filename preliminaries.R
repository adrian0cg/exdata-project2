obtainData <- function() {
        # obtain
        remoteFileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        localFileName <- "NEI_data.zip"
        if (!file.exists(localFileName)) {
                download.file(remoteFileUrl,localFileName, method="curl")
        }
        # unpack
        unzip(localFileName, exdir = "data", overwrite=FALSE, junkpaths = TRUE)
}
obtainData()

