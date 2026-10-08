# file link https://opendata.chmi.cz/air_quality/historical/precipitation/

?scan
?readLines


url <- "https://opendata.chmi.cz/air_quality/historical/precipitation/"

url2 <- scan(url, what = "list")  
readLines(url) #podobnej princip


line <- grep(pattern = "zip", x = url2)

file <- strsplit(x = url2[line], split = '\\"')[[1]][2]

urlf <- paste0(url, file)

download.file(urlf,
              destfile = paste0("./", file))

unzip(zipfile = "./Data_precipitation_1976_2025.zip",
      exdir = "./dta")

fls <- list.files(path = "./dta/",
                  recursive = TRUE,
                  full.names = TRUE)

fls[grep(pattern = ".zip",
         x = fls,
         ignore.case = TRUE)]

#chci neco kde nebudu mit .zip at vyrobim directory

fol <- gsub(pattern = ".zip",
            replacement = "",
            x = fls)

mapply(unzip, zipfile = fls, exdir = fol)

fls2 <- list.files(path = "./dta/",
                   recursive = TRUE,
                   full.names = TRUE, pattern = ".csv")


