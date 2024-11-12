## Necessary Packages
library(jsonlite)
library(tidyverse)

## Data Processing Function
# Larger function to concatenate individual processed files
process_csv_files <- function(file_paths, output_file) {
  
  # Nested function to process a single file
  process_file <- function(file_path) {
    
    # Reads file
    testdata <- read_csv(file_path)
    
    # Shortens file to specified columns
    tdcols <- subset(testdata, select = -c(rt, stimulus, trial_type, plugin_version, question_order))
    
    # Shortens file to specified rows
    tdrows <- tdcols[-c(1:13, 16:17), , drop = FALSE]
    
    # Rearranges elements of cleaned data into one cohesive row
    tdarrange <- data.frame(
      check1 = tdrows$response[1],
      check2 = tdrows$response[2],
      cause = tdrows$causeDonation[3],
      overhead = tdrows$expenseDonation[3],
      total = tdrows$totalDonation[3],
      condition = tdrows$questionOrder[3],
      satis_usual = tdrows$response[4],
      age = tdrows$age[5],
      nationality = tdrows$nationality[5],
      gender = tdrows$response[6],
      comment = tdrows$response[7]
    )
    
    # Parses the satisfaction responses, unnests JSON formatting
    tdparsed <- tdarrange %>%
      mutate(satis_usual = lapply(satis_usual, function(x) {
        tryCatch(fromJSON(x), error = function(e) NA)
        }))
    
    # Unnests the satisfaction/frequency column into two separate columns
    tdsep <- tdparsed %>%
      unnest_wider(col = satis_usual, names_sep = "_")
    
    # Renames columns
    tdclean <- tdsep %>% 
      rename(satisfaction = satis_usual_Q0,
             frequency = satis_usual_Q1)
    
    # Returns cleaned data
    return(tdclean)
  }
  
  # Apply nested function to each file
  processed_files <- lapply(file_paths, process_file)
  
  # Combines files, adds identifying number
  all_data <- bind_rows(processed_files, .id = "file_id")
  
  # Saves the combined data
  write_csv(all_data, output_file)
  
  # Returns combined data
  return(all_data)
}

# Vector of filepaths for data pipe outputs to be strung together
file_paths <- c(
                "/Users/willdemelo/Downloads/drddd9wdeu.csv",
                "/Users/willdemelo/Downloads/omw1tq4sk4.csv",
                "/Users/willdemelo/Downloads/1tqhku354y.csv",
                "/Users/willdemelo/Downloads/n0movtwg0g.csv",
                "/Users/willdemelo/Downloads/kavyxrb1h0.csv",
                "/Users/willdemelo/Downloads/tjke9lp2wu.csv",
                "/Users/willdemelo/Downloads/ptfz66925c.csv",
                "/Users/willdemelo/Downloads/pk96bckqw4.csv",
                "/Users/willdemelo/Downloads/qn8pktwz1y.csv",
                "/Users/willdemelo/Downloads/b5ky52o8p9.csv",
                "/Users/willdemelo/Downloads/szsyve8hnj.csv",
                "/Users/willdemelo/Downloads/l1p5o83rfb.csv",
                "/Users/willdemelo/Downloads/2q4qg4qfad.csv",
                "/Users/willdemelo/Downloads/zz3p6jlrtz.csv",
                "/Users/willdemelo/Downloads/c9w0edjgaj.csv",
                "/Users/willdemelo/Downloads/jbz60hjwlz.csv"
                )

# Defines filepath for .csv file
output_file <- "/Users/willdemelo/Desktop/donation_testdata/testpilotdata.csv"

# Runs function and produces .csv file
result <- process_csv_files(file_paths, output_file)

## Cleans JSON formatting
# Function removes all of the special charcters from the data
remove_special_characters <- function(entry) {
  gsub("[^a-zA-Z0-9\\s]", "", entry)
}

# Applies function to all relevant columns
cleanresult <- result %>%
  mutate(check1 = sapply(check1, remove_special_characters)) %>% 
  mutate(check2 = sapply(check2, remove_special_characters)) %>% 
  mutate(condition = sapply(condition, remove_special_characters)) %>% 
  mutate(gender = sapply(gender, remove_special_characters)) %>% 
  mutate(comment = sapply(comment, remove_special_characters))

# Edits data for legibility
cleanresult <- cleanresult %>%
  mutate(
    condition = recode(
      condition,
      ForthecauseForcoveringcharitableorganizationsoperatingexpense = 'causefirst',
      ForcoveringcharitableorganizationsoperatingexpenseForthecause = 'overfirst'
    ),
    check1 = gsub("chanceresponse", "", check1),
    check2 = gsub("donationuseresponse", "", check2),
    gender = gsub("gender", "", gender),
    comment = gsub("Q0", "", comment)
  )

# Produces .csv file 
write.csv(cleanresult,"/Users/willdemelo/Desktop/donation_testdata/cleantestdata.csv", row.names = FALSE)

## Analyses
# First regression analysis (total donations ~ other variables)
output <- lm('total ~ condition + satisfaction + frequency + age + nationality + gender', data = cleanresult)
summary(output)

outputmean <- cleanresult %>% group_by(condition) %>%  summarize(mean = mean(total))
outputsd <- cleanresult %>% summarize(sd = sd(total))
CohensD <- (outputmean$mean[1] - outputmean$mean[2])/outputsd$sd[1]
