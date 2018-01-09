#Clear existing data and graphics
# rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
library(dplyr)
#Read Data
data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-04_1545_liver.csv')
#Setting Labels

label(data$mrn)="BCH Medical Record Number"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$liver_date)="Date of measurement"
label(data$liver_time)="Time of measurement"
label(data$inr_rge)="Exact INR value known?"
label(data$inr_val)="INR (value)"
label(data$ggtp_rge)="GGTP (range)"
label(data$ggtp_unitl)="GGTP (value)"
label(data$ast_rge)="AST (range)"
label(data$ast_unitl)="AST (value)"
label(data$alt_rge)="ALT (range)"
label(data$alt_unitl)="ALT (value)"
label(data$dbili_rge)="Direct Bilirubin (range)"
label(data$dbili_mgdl)="Direct Bilirubin (value)"
label(data$tbili_rge)="Total Bilirubin (range)"
label(data$tbili_gdl)="Total Bilirubin (value)"
label(data$trigf_mgdl)="Triglycerides - fasting (value)"
label(data$trig_mgdl)="Triglycerides - non-fasting (value)"
label(data$cholf_mgdl)="Cholesterol - fasting (value)"
label(data$chol_mgdl)="Cholesterol - non-fasting (value)"
label(data$hdlf_mgdl)="HDL - fasting (value)"
label(data$hdl_mgdl)="HDL - non-fasting (value)"
label(data$ldlf_mgdl)="LDL - fasting (value)"
label(data$ldl_mgdl)="LDL - non-fasting (value)"
label(data$vldl_mgdl)="VLDL - fasting (value)"
label(data$crp_rge)="CRP (range)"
label(data$crp_mgdl)="CRP (value)"
label(data$mead_nmolml)="Mead Acid Level"
label(data$ttratio)="T/T Ratio"
label(data$platelet)="Platelets"
label(data$alkphos)="Alkaline phosphatase"
label(data$epa)="EPA,C20:5w3"
label(data$dha)="DHA,C22:6w3"
label(data$arachacid)="Arachidonic Acid,C20:4w6"
label(data$alinoacid)="a-Linolenic Acid,C18:3w3"
label(data$linoacid)="Linoleic Acid,C18:2w6"
label(data$liver_disease_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("active_on_service","central_line","inpatient_encounters","bloodstream_infections","nutrition_intake","growth_data","liver_disease","outpatient_encounters","interventions"))
data$inr_rge.factor = factor(data$inr_rge,levels=c("1","2","3","-8"))
data$ggtp_rge.factor = factor(data$ggtp_rge,levels=c("1","2","-8"))
data$ast_rge.factor = factor(data$ast_rge,levels=c("1","2","-8"))
data$alt_rge.factor = factor(data$alt_rge,levels=c("1","2","-8"))
data$dbili_rge.factor = factor(data$dbili_rge,levels=c("1","2","-8"))
data$tbili_rge.factor = factor(data$tbili_rge,levels=c("1","2","-8"))
data$crp_rge.factor = factor(data$crp_rge,levels=c("1","2","-8"))
data$liver_disease_complete.factor = factor(data$liver_disease_complete,levels=c("0","1","2"))

levels(data$redcap_repeat_instrument.factor)=c("Active On Service","Central Line","Inpatient Encounters","Bloodstream Infections","Nutrition Intake","Growth Data","Liver Disease","Outpatient Encounters","Interventions")
levels(data$inr_rge.factor)=c("Yes","<  1.00",">10.00","N/A")
levels(data$ggtp_rge.factor)=c("<  3","≥ 3","N/A")
levels(data$ast_rge.factor)=c("<  5","≥ 5","N/A")
levels(data$alt_rge.factor)=c("<  5","≥ 5","N/A")
levels(data$dbili_rge.factor)=c("<  0.1","≥ 0.1","N/A")
levels(data$tbili_rge.factor)=c("< 0.1","≥ 0.1","N/A")
levels(data$crp_rge.factor)=c("< 0.03","≥ 0.03","N/A")
levels(data$liver_disease_complete.factor)=c("Incomplete","Unverified","Complete")

# growth.df <- filter(data, data$redcap_repeat_instrument!="")
# was originally saved as growth.df but replacing to liver.df
liver.df <- filter(data, data$redcap_repeat_instrument!="")
rm(data)

