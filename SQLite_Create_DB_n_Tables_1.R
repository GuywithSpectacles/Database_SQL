#Reading from SQLite

'''
dbConnect() - To connect with database
take the following arguments:

 drv: Adatabase driver
 path: The path to SQLite database

dbDisconnect() - To Disconnect from
database

'''

#Load the RSQLite Library

library(RSQLite)


#Load the mtcars as an R data frame put row names as a column, and print the header.

data("mtcars")

mtcars$car_names <- rownames(mtcars)

rownames(mtcars) <- c()

head(mtcars)


#Create a connection to our new database . CarsDB.db

setwd("D:/Al-Nafi-Tracks/DataScience/Data Collection and Data Wrangling/Database_SQL")
getwd()


#Create or connect to database
conn <- dbConnect(RSQLite::SQLite(), "CarsDB.db")

#Write the mtcars dataset into a table names mtcars_data
dbWriteTable(conn, "cars_data", mtcars)

#List all the tables available in the database
dbListTables(conn)

#Quick access Functions
dbListFields(conn, "cars_data")
dbReadTable(conn, 'cars_data')

rdd <- dbReadTable(conn, 'cars_data')

dconn <- dbDisconnect(conn)

library(usethis)

