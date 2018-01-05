#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-04_1541_growth.csv')
#Setting Labels

label(data$mrn)="BCH Medical Record Number"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$growth_date)="Date of measurement"
label(data$growth_time)="Time of measurement"
label(data$growth_inpt_outpt)="Type of visit"
label(data$growth_ht_cm)="Height (cm)"
label(data$growth_wt_kg)="Weight (kg)"
label(data$growth_data_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("active_on_service","central_line","inpatient_encounters","bloodstream_infections","nutrition_intake","growth_data","liver_disease","outpatient_encounters","interventions"))
data$growth_inpt_outpt.factor = factor(data$growth_inpt_outpt,levels=c("1","2"))
data$growth_data_complete.factor = factor(data$growth_data_complete,levels=c("0","1","2"))

levels(data$redcap_repeat_instrument.factor)=c("Active On Service","Central Line","Inpatient Encounters","Bloodstream Infections","Nutrition Intake","Growth Data","Liver Disease","Outpatient Encounters","Interventions")
levels(data$growth_inpt_outpt.factor)=c("Inpatient","Outpatient")
levels(data$growth_data_complete.factor)=c("Incomplete","Unverified","Complete")

growth.df <- filter(data, redcap_repeat_instrument!="")
rm(data)
