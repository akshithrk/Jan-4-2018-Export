#Clear existing data and graphics
# rm(list=ls())
graphics.off()
#Load Hmisc and dplyr libraries
library(Hmisc)
library(dplyr)
#Read Data
# data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-04_1522_blood_infections.csv')
# data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-11_1031_blood_infections.csv')
data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-15_1419_bloodstream_infections.csv')
#Setting Labels

label(data$mrn)="BCH Medical Record Number"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$bcx_date)="Date of blood culture"
label(data$bcx___abio)="What organisms were identified on blood culture?(Check all that apply) (choice=Abiotrophia species)"
label(data$bcx___acineto)="What organisms were identified on blood culture?(Check all that apply) (choice=Acinetobacter species)"
label(data$bcx___bacil_cer)="What organisms were identified on blood culture?(Check all that apply) (choice=Bacillus cereus)"
label(data$bcx___bifido)="What organisms were identified on blood culture?(Check all that apply) (choice=Bifidobacterium species)"
label(data$bcx___cand_alb)="What organisms were identified on blood culture?(Check all that apply) (choice=Candida albicans)"
label(data$bcx___cand_kru)="What organisms were identified on blood culture?(Check all that apply) (choice=Candida krusei)"
label(data$bcx___cand_para)="What organisms were identified on blood culture?(Check all that apply) (choice=Candida parapsilosis)"
label(data$bcx___cand_lus)="What organisms were identified on blood culture?(Check all that apply) (choice=Candida lusitaniae)"
label(data$bcx___cand_trop)="What organisms were identified on blood culture?(Check all that apply) (choice=Candida tropicalis)"
label(data$bcx___citro)="What organisms were identified on blood culture?(Check all that apply) (choice=Citrobacter freundii)"
label(data$bcx___ent_clo)="What organisms were identified on blood culture?(Check all that apply) (choice=Enterobacter cloacae)"
label(data$bcx___ent_fae)="What organisms were identified on blood culture?(Check all that apply) (choice=Enterococcus faecalis)"
label(data$bcx___ecoli)="What organisms were identified on blood culture?(Check all that apply) (choice=Escherichia coli)"
label(data$bcx___kleb_oxy)="What organisms were identified on blood culture?(Check all that apply) (choice=Klebsiella oxytoca)"
label(data$bcx___kleb_pneu)="What organisms were identified on blood culture?(Check all that apply) (choice=Klebsiella pneumoniae)"
label(data$bcx___lacto)="What organisms were identified on blood culture?(Check all that apply) (choice=Lactobacillus species)"
label(data$bcx___micrococcus)="What organisms were identified on blood culture?(Check all that apply) (choice=Micrococcus species)"
label(data$bcx___morgan)="What organisms were identified on blood culture?(Check all that apply) (choice=Morganella morganii)"
label(data$bcx___pantoea)="What organisms were identified on blood culture?(Check all that apply) (choice=Pantoea species)"
label(data$bcx___proteus_vul)="What organisms were identified on blood culture?(Check all that apply) (choice=Proteus vulgaris)"
label(data$bcx___proteus_mir)="What organisms were identified on blood culture?(Check all that apply) (choice=Proteus mirabilis)"
label(data$bcx___pseudomon)="What organisms were identified on blood culture?(Check all that apply) (choice=Pseudomonas aeruginosa)"
label(data$bcx___rhizo)="What organisms were identified on blood culture?(Check all that apply) (choice=Rhizobium radiobacter)"
label(data$bcx___serr_mars)="What organisms were identified on blood culture?(Check all that apply) (choice=Serratia marcescens)"
label(data$bcx___serr_liq)="What organisms were identified on blood culture?(Check all that apply) (choice=Serratia liquefaciens)"
label(data$bcx___staph_aur)="What organisms were identified on blood culture?(Check all that apply) (choice=Staphylococcus aureus)"
label(data$bcx___staph_oth)="What organisms were identified on blood culture?(Check all that apply) (choice=Staphylococcus species, not aureus)"
label(data$bcx___stenotroph)="What organisms were identified on blood culture?(Check all that apply) (choice=Stenotrophomonas maltophilia)"
label(data$bcx___strept_vir)="What organisms were identified on blood culture?(Check all that apply) (choice=Streptococcus viridans (non-heme))"
label(data$bcx___strept_pneu)="What organisms were identified on blood culture?(Check all that apply) (choice=Streptococcus pneumoniae)"
label(data$bcx___oth)="What organisms were identified on blood culture?(Check all that apply) (choice=Other)"
label(data$bcx_other)="What other organisms were identified on blood culture?"
label(data$bcx_site)="What site led to the positive blood culture?"
label(data$clabsi_commun)="Was central line associated bloodstream infection (CLABSI) acquired in the community?"
label(data$bcx_site_oth)="Specify other"
label(data$bloodstream_infections_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("active_on_service","central_line","inpatient_encounters","bloodstream_infections","nutrition_intake","growth_data","liver_disease","outpatient_encounters","interventions"))
data$bcx___abio.factor = factor(data$bcx___abio,levels=c("0","1"))
data$bcx___acineto.factor = factor(data$bcx___acineto,levels=c("0","1"))
data$bcx___bacil_cer.factor = factor(data$bcx___bacil_cer,levels=c("0","1"))
data$bcx___bifido.factor = factor(data$bcx___bifido,levels=c("0","1"))
data$bcx___cand_alb.factor = factor(data$bcx___cand_alb,levels=c("0","1"))
data$bcx___cand_kru.factor = factor(data$bcx___cand_kru,levels=c("0","1"))
data$bcx___cand_para.factor = factor(data$bcx___cand_para,levels=c("0","1"))
data$bcx___cand_lus.factor = factor(data$bcx___cand_lus,levels=c("0","1"))
data$bcx___cand_trop.factor = factor(data$bcx___cand_trop,levels=c("0","1"))
data$bcx___citro.factor = factor(data$bcx___citro,levels=c("0","1"))
data$bcx___ent_clo.factor = factor(data$bcx___ent_clo,levels=c("0","1"))
data$bcx___ent_fae.factor = factor(data$bcx___ent_fae,levels=c("0","1"))
data$bcx___ecoli.factor = factor(data$bcx___ecoli,levels=c("0","1"))
data$bcx___kleb_oxy.factor = factor(data$bcx___kleb_oxy,levels=c("0","1"))
data$bcx___kleb_pneu.factor = factor(data$bcx___kleb_pneu,levels=c("0","1"))
data$bcx___lacto.factor = factor(data$bcx___lacto,levels=c("0","1"))
data$bcx___micrococcus.factor = factor(data$bcx___micrococcus,levels=c("0","1"))
data$bcx___morgan.factor = factor(data$bcx___morgan,levels=c("0","1"))
data$bcx___pantoea.factor = factor(data$bcx___pantoea,levels=c("0","1"))
data$bcx___proteus_vul.factor = factor(data$bcx___proteus_vul,levels=c("0","1"))
data$bcx___proteus_mir.factor = factor(data$bcx___proteus_mir,levels=c("0","1"))
data$bcx___pseudomon.factor = factor(data$bcx___pseudomon,levels=c("0","1"))
data$bcx___rhizo.factor = factor(data$bcx___rhizo,levels=c("0","1"))
data$bcx___serr_mars.factor = factor(data$bcx___serr_mars,levels=c("0","1"))
data$bcx___serr_liq.factor = factor(data$bcx___serr_liq,levels=c("0","1"))
data$bcx___staph_aur.factor = factor(data$bcx___staph_aur,levels=c("0","1"))
data$bcx___staph_oth.factor = factor(data$bcx___staph_oth,levels=c("0","1"))
data$bcx___stenotroph.factor = factor(data$bcx___stenotroph,levels=c("0","1"))
data$bcx___strept_vir.factor = factor(data$bcx___strept_vir,levels=c("0","1"))
data$bcx___strept_pneu.factor = factor(data$bcx___strept_pneu,levels=c("0","1"))
data$bcx___oth.factor = factor(data$bcx___oth,levels=c("0","1"))
data$bcx_site.factor = factor(data$bcx_site,levels=c("1","2","999","-3"))
data$clabsi_commun.factor = factor(data$clabsi_commun,levels=c("1","0"))
data$bloodstream_infections_complete.factor = factor(data$bloodstream_infections_complete,levels=c("0","1","2"))

levels(data$redcap_repeat_instrument.factor)=c("Active On Service","Central Line","Inpatient Encounters","Bloodstream Infections","Nutrition Intake","Growth Data","Liver Disease","Outpatient Encounters","Interventions")
levels(data$bcx___abio.factor)=c("Unchecked","Checked")
levels(data$bcx___acineto.factor)=c("Unchecked","Checked")
levels(data$bcx___bacil_cer.factor)=c("Unchecked","Checked")
levels(data$bcx___bifido.factor)=c("Unchecked","Checked")
levels(data$bcx___cand_alb.factor)=c("Unchecked","Checked")
levels(data$bcx___cand_kru.factor)=c("Unchecked","Checked")
levels(data$bcx___cand_para.factor)=c("Unchecked","Checked")
levels(data$bcx___cand_lus.factor)=c("Unchecked","Checked")
levels(data$bcx___cand_trop.factor)=c("Unchecked","Checked")
levels(data$bcx___citro.factor)=c("Unchecked","Checked")
levels(data$bcx___ent_clo.factor)=c("Unchecked","Checked")
levels(data$bcx___ent_fae.factor)=c("Unchecked","Checked")
levels(data$bcx___ecoli.factor)=c("Unchecked","Checked")
levels(data$bcx___kleb_oxy.factor)=c("Unchecked","Checked")
levels(data$bcx___kleb_pneu.factor)=c("Unchecked","Checked")
levels(data$bcx___lacto.factor)=c("Unchecked","Checked")
levels(data$bcx___micrococcus.factor)=c("Unchecked","Checked")
levels(data$bcx___morgan.factor)=c("Unchecked","Checked")
levels(data$bcx___pantoea.factor)=c("Unchecked","Checked")
levels(data$bcx___proteus_vul.factor)=c("Unchecked","Checked")
levels(data$bcx___proteus_mir.factor)=c("Unchecked","Checked")
levels(data$bcx___pseudomon.factor)=c("Unchecked","Checked")
levels(data$bcx___rhizo.factor)=c("Unchecked","Checked")
levels(data$bcx___serr_mars.factor)=c("Unchecked","Checked")
levels(data$bcx___serr_liq.factor)=c("Unchecked","Checked")
levels(data$bcx___staph_aur.factor)=c("Unchecked","Checked")
levels(data$bcx___staph_oth.factor)=c("Unchecked","Checked")
levels(data$bcx___stenotroph.factor)=c("Unchecked","Checked")
levels(data$bcx___strept_vir.factor)=c("Unchecked","Checked")
levels(data$bcx___strept_pneu.factor)=c("Unchecked","Checked")
levels(data$bcx___oth.factor)=c("Unchecked","Checked")
levels(data$bcx_site.factor)=c("Central line associated bloodstream infection (CLABSI)","Single positive blood culture","Other","Not applicable")
levels(data$clabsi_commun.factor)=c("Yes","No")
levels(data$bloodstream_infections_complete.factor)=c("Incomplete","Unverified","Complete")

# Omit rows without real data
data <- filter(data, redcap_repeat_instrument!="")

# Set date variable to class Date
data$bcx_date <- as.Date(data$bcx_date, format = "%m/%d/%Y" )


blood_infections.df <- data
rm(data)
# write.csv(blood_infections.df,"blood_infections_Jan 18.csv")
