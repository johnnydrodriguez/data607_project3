library(tidyverse)

glassdoor <- read.csv("https://raw.githubusercontent.com/johnnydrodriguez/data607_project3/main/glassdoor_2021.csv", header = TRUE, sep = ',', na.strings="", fill = TRUE)

skills <- glassdoor %>% 
  select(index, Job.Description)




skills <- skills %>%
  mutate(DA = str_match(Job.Description, '.*(Data Analytic).*')[,2],
          Viz = str_match(Job.Description, '.*(Visualization).*')[,2],
          ML = str_match(Job.Description, '.*(Machine Learning | ML).*')[,2],
          LR = str_match(Job.Description, '.*(Logistic Regression).*')[,2],
          ETL = str_match(Job.Description, '.*(ETL).*')[,2],
          FC = str_match(Job.Description, '.*(Forecast).*')[,2],
          PD = str_match(Job.Description, '.*(Predictive).*')[,2],
          ST = str_match(Job.Description, '.*(Stat).*')[,2],
         EC = str_match(Job.Description, '.*(Economics).*')[,2],
         ST = str_match(Job.Description, '.*(Math).*')[,2],
         PS = str_match(Job.Description, '.*(problem-solving).*')[,2],
         CM = str_match(Job.Description, '.*(communication).*')[,2],
         DM = str_match(Job.Description, '.*(decision-making).*')[,2],
         CR = str_match(Job.Description, '.*(creativity).*')[,2],
         CT = str_match(Job.Description, '.*(critical thinking).*')[,2]
         )
          

      
