# Assignment: ASSIGNMENT 3.2
# Name: Mukherjee, Chitramoy
# Date: 2022-12-16

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/chitro/Desktop/dsc520-fork-chitro")

## Load the `data/r4ds/heights.csv` to
american_cs <- read.csv("data/acs-14-1yr-s0201.csv")

#Id : Datatype - varchar(contains text and number) Intent: unique identifier for each row
#Id2 : Dadatype : Integer (contains last 4 byte of Id) Intent : unique identifier for each 
#Geography: Varchar(contains text) Intent : County and State information
#PopGroupID : Integer(contains number) : Intent : Numeric 1 value for all rows
#POPGROUP.display.label : varchar, Intent : Total population for all rows
#RacesReported : Integer(contains numbers) Intent : total population count 
#HSDegree : Numeric(contains number with one decimal point) Intent : marks obtained in HS Degree
#BachDegree : Numeric(contains number with one decimal point) Intent : marks obtained in Bachelore Degree

#Display structure of american_cs
str(american_cs)
#Display no. of rows in american_cs
nrow(american_cs)
#Display no. of columns in american_cs
ncol(american_cs)


#Create a Histogram of the HSDegree variable using the ggplot2 package
ggplot(american_cs, aes(x=HSDegree)) + geom_histogram(bins=34)
ggplot(american_cs, aes(x=HSDegree)) + geom_histogram(bins=34) + ggtitle("HSDegree vs. count") + xlab("HSDegree") + ylab("count")


sapply(american_cs[,7:8], sd)
# As the distribution is has 2 peak, it's bimodal distribution.
# the histogram is not approximately symmetrical as we cant draw a vertical line at some point in the histogram such that
# the shape to the left and the right of the vertical line are mirror images of each other.
# It is not approximately bell-shaped as 68% of the data is not within 1 standard deviation of the mean.
# It is Not approximately normal as the data is skewed towards the left side of the plotting.
# It is skewed towards the left side as per the histogram.
# Include a normal curve to the Histogram that you plotted :
ggplot(american_cs, aes(x=HSDegree)) + geom_histogram(bins=34) + ggtitle("HSDegree vs. count") + xlab("HSDegree") + ylab("count") + geom_density(aes(y=1.1*..count..))

# Normal distribution can be used as a model for this data as it replicates the pattern shown in histogram.

qqnorm(american_cs$HSDegree)
qqline(american_cs$HSDegree, col = "red")
# Distribution is not approximately normal distribution has more values in the tails compared to a normal distribution.
# Distribution is left skewed as per the plotting.


library (pastecs)
stat.desc (american_cs)

library(moments)
skewness(american_cs$HSDegree)
# Since the skewness is negative, this indicates that the distribution is left-skewed. This confirms what we saw in the histogram. 
kurtosis(american_cs$HSDegree)
# Since the kurtosis is greater than 3, this indicates that the distribution has more values in the tails compared to a normal distribution.
a<- (american_cs$HSDegree)
head(a)
mean(a)
sd(a)
a.z <- (a -mean(a)) / sd(a)
a.z
# Z-score is the distance of raw score value from the mean in terms of standard deviation.Raw scores above the mean have a positive Z-score value, while a raw score below the mean has a negative z-score value.