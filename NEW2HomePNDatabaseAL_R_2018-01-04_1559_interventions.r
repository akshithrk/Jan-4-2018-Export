#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-04_1559_interventions.csv')
#Setting Labels

label(data$mrn)="BCH Medical Record Number"
label(data$intervention_id)="Intervention ID"
label(data$intervention)="Name of Intervention"
label(data$subgroup_yn)="Does this intervention have subgroups?"
label(data$interv_subgroup)="Subgroup"
label(data$interv_startdt)="Date subject started intervention:"
label(data$interv_active)="Is the subject currently receiving the intervention?"
label(data$interv_enddt)="Date subject ended intervention"
label(data$smof_prevlipid)="Previous IV lipid source"
label(data$smof_prevlipidoth)="Specify other IV lipid"
label(data$smof_gir_t0)="T0 (Pre-Infusion)"
label(data$smof_gir_t1)="T1 (2-3 month)"
label(data$smof_gir_t2)="T2 (4-6 month)"
label(data$smof_gir_t3)="T3 (7-9 month)"
label(data$smof_gir_t4)="T4 (10-12 month)"
label(data$updated)="Date intervention record last updated:"
label(data$interventions_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$subgroup_yn.factor = factor(data$subgroup_yn,levels=c("1","0"))
data$interv_active.factor = factor(data$interv_active,levels=c("1","0"))
data$smof_prevlipid.factor = factor(data$smof_prevlipid,levels=c("0","1","2","3","99"))
data$interventions_complete.factor = factor(data$interventions_complete,levels=c("0","1","2"))

levels(data$subgroup_yn.factor)=c("Yes","No")
levels(data$interv_active.factor)=c("Yes","No")
levels(data$smof_prevlipid.factor)=c("None","Intralipid","Omegaven","SMOF lipid","Other")
levels(data$interventions_complete.factor)=c("Incomplete","Unverified","Complete")

interventions.df <- data
rm(data)
