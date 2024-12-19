# Replication of Suk and Mudita's 2023 Experiment on Donation Collection Methods

This is the documentation of a replication effort of Dr. Kwanho Suk and Dr. Triza Mudita's study, *Effects of donation collection methods on donation amount: Nudging donation for the cause and overhead.* I and three others attempt to replicate the second experiment described in this article, which found that participants donate more money to a hypothetical charity when asked to donate to a charity's overhead expenses first and advertised cause second, as opposed to the other way around. However, our results failed to replicate, indicating a more complicated relationship.

## Project Overview

This repository documenting the entirety of the replication effort consists of a few major components, listed below.

### Data

This is the data that we collected. All of it is fully anonymized with no risk of Personalliy Identifiable Information (PII) leaking. I include data that was used during our first and second pilot studies in [PilotDataA.csv](https://github.com/willdemelo/Replication_Study_Suk2023/blob/main/data/PilotDataA.csv) and [PilotDataB.csv](https://github.com/willdemelo/Replication_Study_Suk2023/blob/main/data/PilotDataB.csv). Our raw sample data that was used for our calculations is included in [sampledata.csv](https://github.com/willdemelo/Replication_Study_Suk2023/blob/main/data/sampledata.csv), and our cleaned sample data that was edited to be remove JSON formatting, in order to be more legible, and filtered based on comprehension checks, so that only serious responses are used, is included in [filteredsampledata.csv](https://github.com/willdemelo/Replication_Study_Suk2023/blob/main/data/filteredsampledata.csv).

### Original Paper

The [original 2023 paper](https://github.com/willdemelo/Replication_Study_Suk2023/blob/main/original_paper/effects_of_donation_collection_methods) by Dr. Suk and Dr. Mudita is included for reference. You can also find it on [Wiley online library](https://onlinelibrary.wiley.com/doi/abs/10.1002/mar.21781). We specifically replicated **Study 2** from the original paper.

### Website

We utilized a custom website to host the survey that was used to collect our data. This website was hosted on the popular crowdworking website, Prolific, where we worked with online participants to get our results. To review our methodology, you can view the [.html code](https://github.com/willdemelo/Replication_Study_Suk2023/blob/main/website/index.html), or take the survey yourself [here](https://willdemelo.github.io/Replication_Study_Suk2023/website/). Notable features of this website include the usage of jsPysch plugins to create our questions and general infrastructure, restrictions we placed on participants' answering (for instance, that they must answer to move forward, and cannot put in the wrong kind of answer) as well as the datapipe that takes raw data from the survey and sends it to our public repository at the [Open Science Framework](https://osf.io/jzx7e/).

### Writeup

This is my full writeup of our entire replication effort. You can find it [here](https://github.com/willdemelo/Replication_Study_Suk2023/blob/main/writeup/writeup). It is a comprehensive look at our methods, results, and intepretation thereof. You can also find a fully rendered version of the writeup published [online](https://rpubs.com/willdemelo/1253815).

## Contribution Overview

I contributed to this project in the following ways, as documented by my CRediT statement at the end of the writeup file:

*Software*:

I made significant contributions to the production of our website's .html code. Specifically, I wrote the code used in the prompts and questions for the experiment, and set up the data pipeline between our website and our OSF repository. Additionally, I wrote nearly all of the R code in the writeup, especially the functions for cleaning the raw data and performing the statistical tests. I also created visualizations in the discussion section for ease of interpretation.

*Investigation*:

I hosted our survey on the crowdworking website, Prolific. Essentially, I was in charge of establising parameters describing exactly how our data collection should progress, supervising the collection of responses as they were coming in, and paying our participants for their time at the end of data collection.

*Data curation*:

I checked our data for PII, so that none of participants' identities would be accidentally compromised. Additionally, I formatted the raw data from individual .csv files for each response into a single .csv file that could be analyzed in R. I then cleaned that .csv file further to remove JSON formatting and prepare it for analysis.

*Formal analysis*:

I conducted all of the calculations in the writeup, including the series of regression analyses, Cohen's D calculations, and Z and Chi-squared hypothsis tests.

*Validation*:

I was responsible for the discussion section of the writeup, where I describe in detail how our results fail to replicate and possible reasons for why. For instance, I show that the differences between our results and the original study's are likely due to the difference among our samples; the original study used a UK sample, and we used a US sample. The cultural differences between two populations may have exerted a confounding effect on our results, leading to a lack of variation between our two conditions and causing our confirmatory analyses to fail ro replicate.

*Writing - original draft and Writing - review & editing*:

I wrote the original draft of the writeup used for our [OSF pre-registration](https://osf.io/52sfp) and further reviewed and edited that draft for the final product published online.

## Resources
- **Editor Used:** RStudio
- **R Version:** R 4.4.1

### Quarto
  This writeup was produced as a Quarto Markdown (.qmd) file, which allows for greater ease of rendering and publishing documents produced in RStudio.

### tidyverse
  tidyverse has essential libraries that form the backbone of this project's infrastructure, especially concerning loading the data (readr), data organization (dplyr, tidyr, stringr, tibble) and visualization (ggplot2).

### jsonlite
  jsonlite helps with removing the JSON formatting from our raw data. Because this data was transferred from our custom survey website to our OSF repository, and then loaded into R, the raw data is in JSON format, which must be removed for the analysis to progress.

## Bibliography
  Suk, K., & Mudita, T. (2023). Effects of donation collection methods on donation amount: Nudging donation for the cause and overhead. Psychology & Marketing, 40, 690–706. [https://doi.org/10.1002/mar.21781](https://doi.org/10.1002/mar.21781)
