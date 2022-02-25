getwd()

library(RSQLite)

#Load the 'AirPassengers' as an R dataframe put row names as a column, and print the header.

data('AirPassengers')

AirPassengers$year <- rownames(AirPassengers)

rownames(AirPassengers) <- c()

head(AirPassengers)


#Create a connection to our new database . PassengersDB.db

setwd('D:/Al-Nafi-Tracks/DataScience/Data Collection and Data Wrangling/Database_SQL')
getwd()


#Create or connect database

conn <- dbConnect(RSQLite::SQLite(), 'PassengersDB.db')


#Write the AirPassengers dataset into a table names AirPassengers_data

dbWriteTable(conn, "year_data", AirPassengers)


dbListTables(conn)

dbReadTable(conn, 'year_data')
