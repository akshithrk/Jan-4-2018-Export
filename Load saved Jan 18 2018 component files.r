active.df <- read.csv("active_Jan 18.csv")
blood_infections.df <- read.csv("blood_infections_Jan 18.csv")
central_line.df <- read.csv("central_line_Jan 18.csv")
demogs.df <- read.csv("demogs_Jan 18.csv")
growth.df <- read.csv("growth_Jan 18.csv")
inpatients.df <- read.csv("inpatients_Jan 18.csv")
liver.df <- read.csv("liver2_Jan 18.csv")
outpatients.df <<- read.csv("outpatients_Jan 18.csv")

active.df$svc_start <- as.Date(active.df$svc_start)
active.df$svc_stop <- as.Date(active.df$svc_stop)
blood_infections.df$bcx_date <- as.Date(blood_infections.df$bcx_date)
central_line.df$insert_date <- as.Date(central_line.df$insert_date)
central_line.df[is.na(central_line.df$remove), "remove"] <- 0
central_line.df$remove_date <- as.Date(central_line.df$remove_date,"%m/%d/%Y")
demogs.df$dob <- as.Date(demogs.df$dob)
growth.df$growth_date <- as.Date(growth.df$growth_date)
inpatients.df$hosp_admitdt <- as.Date(inpatients.df$hosp_admitdt)
inpatients.df$hosp_dischargedt <- as.Date(inpatients.df$hosp_dischargedt,"%Y-%m-%d")
liver.df$liver_date <- as.Date(liver.df$liver_date)
outpatients.df$outpt_date <- as.Date(outpatients.df$outpt_date)


