source("J:/Analytics Projects/Home Parenteral Nutrition QI/Code/Code from Al Ozonoff/bmi_z.r")
source("J:/Analytics Projects/Home Parenteral Nutrition QI/Code/Code from Al Ozonoff/helperfunctions.r")

test_g <- growth.df
test_d <- demogs.df
# rm(test)


# data2[,c(2,3,6)] #this was targeting 2:mrn, 3: dob, 6: gender_male
# test_d[,c(1,2,5)]
#

test_g$bmi <- (test_g$growth_wt_kg)/((test_g$growth_ht_cm/100)^2)
test_g <- merge(test_g,test_d[,c("mrn","dob","gender_male")],all.x=T,all.y=F,by.x="mrn",by.y="mrn")

#test_g$datein <- as.integer(split.date(test_g$growth_date,char="-",ymd=T))
# split.date(test_g$dob.y,char="-",ymd=T)
# as.integer(split.date(test_g$dob.y,char="-",ymd=T))
#test_g$datein <- as.date(test_g$datein)
#test_g$ageyrs <- (test_g$datein-test_g$dob) #to do ageyrs in MSTR

test_g$ageyrs <- round(as.numeric(test_g$growth_date - test_g$dob + 1)/365,1)
#test_g$bmi_z <- bmiz(test_g$bmi,test_g$ageyrs,1-test_g$gender_male)

if (length(test_g$bmi)!=0)
{
  for (i in 1:length(test_g$bmi)) test_g$bmiz[i] <- bmiz(test_g$bmi[i],test_g$ageyrs[i],1-test_g$gender_male[i])
  test_g$bmiperc <- 100*round(pnorm(test_g$bmiz),3)
}




# write.csv(growth.df,"growth.csv")