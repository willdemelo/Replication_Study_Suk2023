# Replication of Suk and Mudita's 2023 Experiment on Donation Collection Methods

This is the documentation of a replication effort of Dr. Kwanho Suk and Dr. Triza Mudita's study, **Effects of donation collection methods on donation amount: Nudging donation for the cause and overhead.** I and three others attempt to replicate the second experiment described in this article, which found that participants donate more money to a hypothetical charity when asked to donate to a charity's overhead expenses first and advertised cause second, as opposed to the other way around. However, our results failed to replicate, indicating a more complicated relatioinship.

## Project Overview

This repository documenting the entirety of the replication effort consists of a few major components, listed below.

### Data

This is the data that we collected. All of it is fully anonymized with no risk of Personalliy Identifiable Information (PII) leaking. I include data that was used during our first and second pilot studies iin PilotDataA.csv and PilotDataB.csv. Our raw sample data that was used for our calculations is included in sampledata.csv, and our cleaned sample data that was edited to be remove JSON formatting, in order to be more legible, and filtered based on comprehension checks, so that only serious responses are used, is included in filteredsampledata.csv.

### Original Paper

The original 2023 paper by Dr. Suk and Dr. Mudita is included for reference. We specifically replicated *Study 2* from the original paper.

### Website

We utilized a custom website to host the survey that was used to collect our data. This website was hosted on the popular crowdworking website, Prolific, where we worked with online participants to get our results. To review our methodology, you can view the .html code, or take the survey yourself [here](https://ucsd-psych201a.github.io/suk2023/website/). Notable features of this website include the usage of jsPysch plugins to create our questions and general infrastructure, restrictions we placed on participants' answering (for instance, that they must answer to move forward, and cannot put in the wrong kind of answer) as well as the datapipe that takes raw data from the survey and sends it to our public repository at the [Open Science Framework](https://osf.io/jzx7e/).

### Writeup

This is my full writeup of our entire replication effort. It is a comprehensive look at our methods, results, and intepretation thereof. For a more convinient look at the writeup, please visit the rendered version published [online](https://rpubs.com/willdemelo/1253815).

## Contribution Overview

I contributed to this project in the following ways, as documented by my CRediT statement, visible at the end of the writeup file.

*Software*
I made significant contributions to the production of our website's .html code. Specifically, I wrote the code used in the prompts and questions for the actual experiment, and set up the data pipeline between our website and our OSF repository.

Additionally, I wrote nearly all of the R code in the writeup, especially the functions for cleaning the raw data, performing the statistical tests, and creating the visualizations.

*Investigation*
I hosted our survey on the crowdworking website, Prolific. This means that I was in charge of establising parameters describing exactly how our data collection should progress, supervising the collection of responses as they were coming in, and paying our participants fairly at the end of data collection.

*Data curation*
I checked our data for PII, so that none of participants' identities would be accidentally compromised.

*Formal analysis*




*Validation*
*Writing - original draft*
*Writing - review & editing*


