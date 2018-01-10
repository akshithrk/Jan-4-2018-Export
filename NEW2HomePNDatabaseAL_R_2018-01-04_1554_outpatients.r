#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-04_1554_outpatients.csv')
#Setting Labels

label(data$mrn)="BCH Medical Record Number"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$outpt_date)="Date of encounter"
label(data$outpt_time)="Time of encounter"
label(data$clinic_id)="In what clinic was patient seen?"
label(data$clinic_id_oth)="What is the name of the other clinic?"
label(data$dx_code)="Primary billing diagnosis code"
label(data$dx_desc)="Diagnosis description"
label(data$provider)="Billing provider"
label(data$outpatient_encounters_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("active_on_service","central_line","inpatient_encounters","bloodstream_infections","nutrition_intake","growth_data","liver_disease","outpatient_encounters","interventions"))
data$clinic_id.factor = factor(data$clinic_id,levels=c("1","2","999"))
data$outpatient_encounters_complete.factor = factor(data$outpatient_encounters_complete,levels=c("0","1","2"))

levels(data$redcap_repeat_instrument.factor)=c("Active On Service","Central Line","Inpatient Encounters","Bloodstream Infections","Nutrition Intake","Growth Data","Liver Disease","Outpatient Encounters","Interventions")
levels(data$clinic_id.factor)=c("Home PN program","CAIR","Other")
levels(data$outpatient_encounters_complete.factor)=c("Incomplete","Unverified","Complete")

data <- filter(data, data$redcap_repeat_instrument!="")
data$outpt_date <- as.Date(data$outpt_date)
outpatients.df <- data

rm(data)
