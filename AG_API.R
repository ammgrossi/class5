## second part API

library(tidyverse)
library(httr)
library(jsonlite)

# make the URL

url <-
  "https://api.census.gov/data/2014/pep/natstprc?get=STNAME,POP&DATE_=7&for=state:*"

# use the URL to make a request from the API
pop_json <- GET(url = url)

http_status(pop_json)

# get the contents of the response as a text string
pop_json <- content(pop_json, as = "text")

# create a character matrix from the JSON
pop_matrix <- fromJSON(pop_json)
View(pop_matrix)

# turn the body of the character matrix into a tibble
pop_data <- as_tibble(pop_matrix[2:nrow(pop_matrix), ],
                      .name_repair = "minimal")

# add variable names to the tibble
names(pop_data) <- pop_matrix[1, ]
pop_data




