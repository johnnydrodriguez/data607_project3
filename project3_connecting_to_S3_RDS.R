library(tidyverse)
library(RMySQL)


#Connect to S3------------------------------------------------------------------
library("aws.s3")

AWS_ACCESS_KEY_ID <- .rs.askForPassword("AWS Access Key ID:")
AWS_SECRET_ACCESS_KEY <- .rs.askForPassword("AWS Secret Access Key:")

#Use IAM login credentials/Set to "read-only"
Sys.setenv("AWS_ACCESS_KEY_ID" = "AKIA4QMABP5OYQY2NUG6",
           "AWS_SECRET_ACCESS_KEY" = "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")

#Check bucket
get_bucket("data-skills-p3")

#Load csv file from s3 into a df
jobs_df <- aws.s3::s3read_using(read.csv, object = "s3://data-skills-p3/glassdoor_2021.csv")

View(jobs_df)


#Connect to RDS-----------------------------------------------------------------
#Input password:
password <- .rs.askForPassword("Database Password:")
endpoint <- "database-1.c4xyb2t3srpc.us-east-1.rds.amazonaws.com"
port <- 3306
username <- "admin"
dbname <- "database-1"
region <- "us-east-1a"

# Connect to the database using an IAM authentication token.
con <- DBI::dbConnect(
  RMySQL::MySQL(),
  host = "database-1.c4xyb2t3srpc.us-east-1.rds.amazonaws.com",
  port = 3306,
  db = "database1",
  user = "admin",
  password = password
)

## TEST DATABASE CONNECTION
class(con)

#List database tables
tables <- dbListTables(con) # load tables in rds to variable
str(tables) # Display structure of tables

#To create a table into the MySQL rds database
#dbWriteTable(conn = con, name = 'Test', value = as.data.frame(Thurstone))

#To drop a table from rds database
#dbRemoveTable(con,"iris") #Replace 2nd variable


