## Deliverable 1

# Load dplyr package 
library(dplyr)

# read csv file 

mech_car <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)
head(mech_car)

# Perform multiple linear regression

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = mech_car) 

# summary function to get the p-value and r-squared values

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = mech_car))


## Deliverable 2

# read csv file 
sus_coil = read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F) 
head(sus_coil)

# Create a summary function to get the mean, median, variance, and standard deviation of the suspension coil's PSI column 

total_summary_df <- sus_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')
total_summary_df

# Create a lot summary to group each manufacturing lot by the mean, median, variance, and standard deviation 
lot_summary <- sus_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')
lot_summary

# Deliverable 3 

# T-Test on Suspension Coil. To test all lots against population mean of PSI

t.test(sus_coil$PSI, mu=1500)

## t.test to compare each lot against population mean of PSI

t.test(subset(sus_coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(sus_coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(sus_coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)
