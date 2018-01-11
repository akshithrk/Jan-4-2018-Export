#Clear existing data and graphics
# rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
# data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-04_1421_demog.csv')
data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-11_1008_demog.csv')

colnames(data)[1] <- "mrn" #Corrects glitch in data read

#Setting Labels

label(data$mrn)="BCH Medical Record Number"
label(data$dob)="Date of birth"
label(data$lname)="Last name"
label(data$fname)="First name"
label(data$gender_male)="Gender"
label(data$prog___none)="Followed by another multi-disciplinary program?(Check all that apply) (choice=None)"
label(data$prog___cair)="Followed by another multi-disciplinary program?(Check all that apply) (choice=CAIR)"
label(data$prog___ibd)="Followed by another multi-disciplinary program?(Check all that apply) (choice=IBD Center)"
label(data$prog___liver)="Followed by another multi-disciplinary program?(Check all that apply) (choice=Liver-intestine transplant)"
label(data$prog___gi)="Followed by another multi-disciplinary program?(Check all that apply) (choice=Motility-functional GI disorders)"
label(data$prog___inh)="Followed by another multi-disciplinary program?(Check all that apply) (choice=Inherited enteropathy)"
label(data$prog___df)="Followed by another multi-disciplinary program?(Check all that apply) (choice=Dana Farber)"
label(data$prog___pact)="Followed by another multi-disciplinary program?(Check all that apply) (choice=PACT)"
label(data$prog___oth)="Followed by another multi-disciplinary program?(Check all that apply) (choice=Other)"
label(data$prog_oth)="Specify other multi-disciplinary program"
label(data$diag_sbs)="Does the patient carry diagnosis of short bowel syndrome?"
label(data$cext)=""
label(data$explant)=""
label(data$gastro)=""
label(data$hirsch)=""
label(data$ibd)=""
label(data$intest)=""
label(data$mecileus)=""
label(data$meccyst)=""
label(data$mvt)=""
label(data$volv)=""
label(data$nec)=""
label(data$omphal)=""
label(data$onc)=""
label(data$radent)=""
label(data$trauma)=""
label(data$vascmalf)=""
label(data$sbs_type_oth)="What other diagnosis led to short bowel syndrome?"
label(data$diag_enterop)="Does the patient carry diagnosis of an inherited or acquired enteropathy disorder?"
label(data$autoenter)=""
label(data$tuftenter)=""
label(data$immuno)=""
label(data$mvillus)=""
label(data$enteropathy_type_oth)="What other type of enteropathy?"
label(data$diag_motility)="Does the patient carry the diagnosis of a motility or functional GI disorder?"
label(data$antral)=""
label(data$cipo)=""
label(data$mito)=""
label(data$visc)=""
label(data$motility_type_oth)="Specify other type of motility disorder"
label(data$diag_pn)="Is PN indicated for temporary support while awaiting definitive medical/surgical therapy?"
label(data$crohns)=""
label(data$cysticfib)=""
label(data$fistula)=""
label(data$gigraftvshost)=""
label(data$intabcess)=""
label(data$panc)=""
label(data$colitis)=""
label(data$diag_pn_reas_oth)="Specify other underlying problem"
label(data$palliative)="Is PN indicated for comfort in treating a terminal disease?"
label(data$palliative_type)="What is the underlying disease leading to terminal status?"
label(data$primary_dx)="Primary Diagnosis"
label(data$demographics_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$gender_male.factor = factor(data$gender_male,levels=c("1","0","-8"))
data$prog___none.factor = factor(data$prog___none,levels=c("0","1"))
data$prog___cair.factor = factor(data$prog___cair,levels=c("0","1"))
data$prog___ibd.factor = factor(data$prog___ibd,levels=c("0","1"))
data$prog___liver.factor = factor(data$prog___liver,levels=c("0","1"))
data$prog___gi.factor = factor(data$prog___gi,levels=c("0","1"))
data$prog___inh.factor = factor(data$prog___inh,levels=c("0","1"))
data$prog___df.factor = factor(data$prog___df,levels=c("0","1"))
data$prog___pact.factor = factor(data$prog___pact,levels=c("0","1"))
data$prog___oth.factor = factor(data$prog___oth,levels=c("0","1"))
data$diag_sbs.factor = factor(data$diag_sbs,levels=c("1","0"))
data$cext.factor = factor(data$cext,levels=c("1"))
data$explant.factor = factor(data$explant,levels=c("1"))
data$gastro.factor = factor(data$gastro,levels=c("1"))
data$hirsch.factor = factor(data$hirsch,levels=c("1"))
data$ibd.factor = factor(data$ibd,levels=c("1"))
data$intest.factor = factor(data$intest,levels=c("1"))
data$mecileus.factor = factor(data$mecileus,levels=c("1"))
data$meccyst.factor = factor(data$meccyst,levels=c("1"))
data$mvt.factor = factor(data$mvt,levels=c("1"))
data$volv.factor = factor(data$volv,levels=c("1"))
data$nec.factor = factor(data$nec,levels=c("1"))
data$omphal.factor = factor(data$omphal,levels=c("1"))
data$onc.factor = factor(data$onc,levels=c("1"))
data$radent.factor = factor(data$radent,levels=c("1"))
data$trauma.factor = factor(data$trauma,levels=c("1"))
data$vascmalf.factor = factor(data$vascmalf,levels=c("1"))
data$diag_enterop.factor = factor(data$diag_enterop,levels=c("1","0"))
data$autoenter.factor = factor(data$autoenter,levels=c("1"))
data$tuftenter.factor = factor(data$tuftenter,levels=c("1"))
data$immuno.factor = factor(data$immuno,levels=c("1"))
data$mvillus.factor = factor(data$mvillus,levels=c("1"))
data$diag_motility.factor = factor(data$diag_motility,levels=c("1","0"))
data$antral.factor = factor(data$antral,levels=c("1"))
data$cipo.factor = factor(data$cipo,levels=c("1"))
data$mito.factor = factor(data$mito,levels=c("1"))
data$visc.factor = factor(data$visc,levels=c("1"))
data$diag_pn.factor = factor(data$diag_pn,levels=c("1","0"))
data$crohns.factor = factor(data$crohns,levels=c("1"))
data$cysticfib.factor = factor(data$cysticfib,levels=c("1"))
data$fistula.factor = factor(data$fistula,levels=c("1"))
data$gigraftvshost.factor = factor(data$gigraftvshost,levels=c("1"))
data$intabcess.factor = factor(data$intabcess,levels=c("1"))
data$panc.factor = factor(data$panc,levels=c("1"))
data$colitis.factor = factor(data$colitis,levels=c("1"))
data$palliative.factor = factor(data$palliative,levels=c("1","0"))
data$primary_dx.factor = factor(data$primary_dx,levels=c("1","2","3","4"))
data$demographics_complete.factor = factor(data$demographics_complete,levels=c("0","1","2"))

levels(data$gender_male.factor)=c("Male","Female","Unknown")
levels(data$prog___none.factor)=c("Unchecked","Checked")
levels(data$prog___cair.factor)=c("Unchecked","Checked")
levels(data$prog___ibd.factor)=c("Unchecked","Checked")
levels(data$prog___liver.factor)=c("Unchecked","Checked")
levels(data$prog___gi.factor)=c("Unchecked","Checked")
levels(data$prog___inh.factor)=c("Unchecked","Checked")
levels(data$prog___df.factor)=c("Unchecked","Checked")
levels(data$prog___pact.factor)=c("Unchecked","Checked")
levels(data$prog___oth.factor)=c("Unchecked","Checked")
levels(data$diag_sbs.factor)=c("Yes","No")
levels(data$cext.factor)=c("Cloacal extrophy")
levels(data$explant.factor)=c("Explant status-post intestinal transplant")
levels(data$gastro.factor)=c("Gastroschisis")
levels(data$hirsch.factor)=c("Hirschsprungs or total colonic agangionosis")
levels(data$ibd.factor)=c("Inflammatory bowel disease with intestinal resections")
levels(data$intest.factor)=c("Intestinal atresia (duodenal, ileal, jejunal)")
levels(data$mecileus.factor)=c("Meconium ileus with intestinal resections")
levels(data$meccyst.factor)=c("Meconium pseudo-cyst")
levels(data$mvt.factor)=c("Mesenteric vein thrombosis")
levels(data$volv.factor)=c("Midgut volvulus")
levels(data$nec.factor)=c("Necrotizing enterocolitis")
levels(data$omphal.factor)=c("Omphalocele")
levels(data$onc.factor)=c("Oncology with intestinal resections")
levels(data$radent.factor)=c("Radiation enteritis")
levels(data$trauma.factor)=c("Trauma")
levels(data$vascmalf.factor)=c("Vascular malformations")
levels(data$diag_enterop.factor)=c("Yes","No")
levels(data$autoenter.factor)=c("Autoimmune enteropathy")
levels(data$tuftenter.factor)=c("Congenital tufting enteropathy")
levels(data$immuno.factor)=c("Immunodeficiency disorder")
levels(data$mvillus.factor)=c("Microvillus")
levels(data$diag_motility.factor)=c("Yes","No")
levels(data$antral.factor)=c("Antral hypomotility")
levels(data$cipo.factor)=c("Chronic intestinal pseudo-obstruction")
levels(data$mito.factor)=c("Mitochondrial disorder")
levels(data$visc.factor)=c("Visceral hypersensitivity")
levels(data$diag_pn.factor)=c("Yes","No")
levels(data$crohns.factor)=c("Crohns disease")
levels(data$cysticfib.factor)=c("Cystic fibrosis")
levels(data$fistula.factor)=c("Enterocutaneous fistula")
levels(data$gigraftvshost.factor)=c("Gastrointestinal graft-versus-host disease")
levels(data$intabcess.factor)=c("Intra-abdominal abscess")
levels(data$panc.factor)=c("Pancreatitis")
levels(data$colitis.factor)=c("Ulcerative colitis")
levels(data$palliative.factor)=c("Yes","No")
levels(data$primary_dx.factor)=c("Short bowel syndrome","Enteropathy disorder","Primary and functional motility GI disorder","Miscellaneous (temporary support)")
levels(data$demographics_complete.factor)=c("Incomplete","Unverified","Complete")

#Identifying dates

data$dob <- as.Date(data$dob)

demog.df <- data
rm(data)
