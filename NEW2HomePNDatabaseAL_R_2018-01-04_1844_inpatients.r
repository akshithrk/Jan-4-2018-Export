#Clear existing data and graphics
# rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
library(dplyr)
#Read Data
# data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-04_1844_inpatients.csv')
# data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-11_1031_inpatients.csv')
data=read.csv('NEW2HomePNDatabaseAL_DATA_2018-01-15_1419_inpatient_encounters.csv')

#Setting Labels

label(data$mrn)="BCH Medical Record Number"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$hosp_name)="What was the name of the hospital?"
label(data$hosp_name_oth)="Specify other hospital name"
label(data$hosp_status)="Was this a planned acute admission?"
label(data$hosp_dx_icdcd)="Admitting diagnosis code"
label(data$hosp_dx_icddesc)="Admitting diagnosis description"
label(data$hosp_dx)="What was the admitting diagnosis?"
label(data$hosp_dx_other)="Specify other admitting diagnosis"
label(data$hosp_admitdt)="Admission date"
label(data$hosp_discharge)="Has the patient been discharged from the hospital?"
label(data$hosp_dischargedt)="Discharge date"
label(data$inpatient_encounters_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("active_on_service","central_line","inpatient_encounters","bloodstream_infections","nutrition_intake","growth_data","liver_disease","outpatient_encounters","interventions"))
data$hosp_name.factor = factor(data$hosp_name,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","999"))
data$hosp_status.factor = factor(data$hosp_status,levels=c("1","0","-3","-8"))
data$hosp_dx.factor = factor(data$hosp_dx,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","999"))
data$hosp_discharge.factor = factor(data$hosp_discharge,levels=c("1","0"))
data$inpatient_encounters_complete.factor = factor(data$inpatient_encounters_complete,levels=c("0","1","2"))

levels(data$redcap_repeat_instrument.factor)=c("Active On Service","Central Line","Inpatient Encounters","Bloodstream Infections","Nutrition Intake","Growth Data","Liver Disease","Outpatient Encounters","Interventions")
levels(data$hosp_name.factor)=c("Boston Childrens Hospital (Boston, Massachusetts)","Advocate Childrens Hospital - Oak Lawn (Oak Lawn, Illinois)",
                                      "Advocate Childrens Hospital - Park Ridge (Park Ridge, Illinois)","Akron Childrens Hospital (Akron, Ohio)",
                                      "Alexian Brothers Childrens Hospital (Hoffman Estates, Illinois)",
                                      "Alfred I. duPont Hospital for Children (Wilmington, Delaware)",
                                      "All Childrens Hospital Johns Hopkins Medicine (St. Petersburg, Florida)",
                                      "American Family Childrens Hospital (Madison, Wisconsin)",
                                      "Ann & Robert H. Lurie Childrens Hospital of Chicago (Chicago, Illinois)",
                                      "Arizona Childrens Center Maricopa Medical Center (Phoenix, Arizona)",
                                      "Arkansas Childrens Hospital (Little Rock, Arkansas)",
                                      "Arnold Palmer Hospital for Children (Orlando, Florida)","Baptist Childrens Hospital (Miami, Florida)",
                                      "Baystate Childrens Hospital (Springfield, Massachusetts)","Beaumont Childrens Hospital (Royal Oak, Michigan)",
                                      "Blank Childrens Hospital (Des Moines, Iowa)","Blythedale Childrens Hospital (Valhalla, New York)",
                                      "Bon Secours St. Marys Hospital Childrens Services (Richmond, Virginia)",
                                      "Brenner Childrens Hospital, Wake Forest Baptist Health (Winston-Salem, North Carolina)",
                                      "Bronson Methodist Hospital (Kalamazoo, Michigan)","California Pacific Medical Center (San Francisco, California)",
                                      "Cardon Childrens Medical Center (Mesa, Arizona)","Carilion Clinic Childrens Hospital (Roanoke, Virginia)",
                                      "Carrie Tingley Hospital (Albuquerque, New Mexico)","Childrens Healthcare of Atlanta (Atlanta, Georgia)",
                                      "Childrens Hospital (New Orleans, Louisiana)",
                                      "Childrens Hospital - Greenville Health System (Greenville, South Carolina)",
                                      "Childrens Hospital & Medical Center (Omaha, Nebraska)",
                                      "Childrens Hospital at Dartmouth Hitchcock Medical Center (Lebanon, New Hampshire)",
                                      "Childrens Hospital at Lehigh Valley Hospital (Allentown, Pennsylvania)",
                                      "Childrens Hospital at Memorial University Medical Center (Savannah, Georgia)",
                                      "Childrens Hospital at University Health (Shreveport, Louisiana)",
                                      "Childrens Hospital Central California (Madera, California)","Childrens Hospital Colorado (Aurora, Colorado)",
                                      "Childrens Hospital Colorado at Memorial Hospital Central (Colorado Springs, Colorado)",
                                      "Childrens Hospital Los Angeles (Los Angeles, California)","Childrens Hospital of Eastern Ontario (Ottawa, Ontario)",
                                      "Childrens Hospital of Georgia, Georgia Regents (Augusta, Georgia)",
                                      "Childrens Hospital of Illinois at OSF Saint Francis Medical Center (Peoria, Illinois)",
                                      "Childrens Hospital of Michigan (Detroit, Michigan)",
                                      "Childrens Hospital of Nevada at University Medical Center (Las Vegas, Nevada)",
                                      "Childrens Hospital of Pittsburgh of UPMC (Pittsburgh, Pennsylvania)",
                                      "Childrens Hospital of Richmond at VCU (Richmond, Virginia)",
                                      "Childrens Hospital of Richmond at VCU - Brook Road Campus (Richmond, Virginia)",
                                      "Childrens Hospital of San Antonio (San Antonio, Texas)",
                                      "Childrens Hospital of The Kings Daughters, Inc. (Norfolk, Virginia)",
                                      "Childrens Hospital of the University of Illinois (Chicago, Illinois)",
                                      "Childrens Hospital of Wisconsin (Milwaukee, Wisconsin)",
                                      "Childrens Hospitals and Clinics of Minnesota (Minneapolis, Minnesota)",
                                      "Childrens Medical Center at Winthrop University Hospital (Mineola, New York)",
                                      "Childrens Medical Center Dallas (Dallas, Texas)","Childrens Memorial Hermann Hospital (Houston, Texas)",
                                      "Childrens Mercy Hospitals and Clinics (Kansas City, Missouri)",
                                      "Childrens National Medical Center (Washington, District of Columbia)","Childrens of Alabama (Birmingham, Alabama)",
                                      "Childrens of Mississippi (Jackson, Mississippi)","Childrens Specialized Hospital (Mountainside, New Jersey)",
                                      "CHOC Childrens Hospital of Orange County (Orange, California)",
                                      "Chris Evert Childrens Hospital Broward Health Medical Center (Fort Lauderdale, Florida)",
                                      "Cincinnati Childrens Hospital Medical Center (Cincinnati, Ohio)","Cleveland Clinic Childrens (Cleveland, Ohio)",
                                      "Cleveland Clinic Childrens Hospital for Rehabilitation (Cleveland, Ohio)",
                                      "Connecticut Childrens Medical Center (Hartford, Connecticut)","Cook Childrens Medical Center (Fort Worth, Texas)",
                                      "Cottage Childrens Hospital (Santa Barbara, California)","Covenant Childrens Hospital (Lubbock, Texas)",
                                      "CoxHealth (Springfield, Missouri)","Dayton Childrens Hospital (Dayton, Ohio)",
                                      "Dell Childrens Medical Center of Central Texas (Austin, Texas)",
                                      "Diamond Childrens Medical Center (Tucson, Arizona)",
                                      "Doernbecher Childrens Hospital at Oregon Health & Science University (Portland, Oregon)",
                                      "Driscoll Childrens Hospital (Corpus Christi, Texas)","East Tennessee Childrens Hospital (Knoxville, Tennessee)",
                                      "El Paso Childrens Hospital (El Paso, Texas)",
                                      "Floating Hospital for Children at Tufts Medical Center (Boston, Massachusetts)",
                                      "Florida Hospital for Children (Orlando, Florida)","Franciscan Hospital for Children (Brighton, Massachusetts)",
                                      "Gillette Childrens Specialty Healthcare (St. Paul, Minnesota)",
                                      "Golisano Childrens Hospital of Southwest Florida (Fort Myers, Florida)",
                                      "Golisano Childrens Hospital at The University of Rochester Medical Center (Rochester, New York)",
                                      "Hasbro Childrens Hospital at Rhode Island Hospital (Providence, Rhode Island)",
                                      "Helen DeVos Childrens Hospital (Grand Rapids, Michigan)",
                                      "Hennepin County Medical Center (Minneapolis, Minnesota)",
                                      "Holtz Childrens Hospital Jackson Memorial Hospital (Miami, Florida)",
                                      "Hoops Family Childrens Hospital (Huntington, West Virginia)","Hurley Childrens Hospital (Flint, Michigan)",
                                      "Inova Childrens Hospital (Falls Church, Virginia)",
                                      "James and Connie Maynard Childrens Hospital at Vidant Medical Center (Greenville, North Carolina)",
                                      "Janet Weis Childrens Hospital at Geisinger Medical Center (Danville, Pennsylvania)",
                                      "Joe DiMaggio Childrens Hospital at Memorial Regional Hospital (Hollywood, Florida)",
                                      "Johns Hopkins Childrens Center (Baltimore, Maryland)",
                                      "K. Hovnanian Childrens Hospital at Jersey Shore University Medical Center (Neptune, New Jersey)",
                                      "Kaiser Permanente - Oakland Medical Center (Oakland, California)",
                                      "Kapiolani Medical Center for Women and Children (Honolulu, Hawaii)",
                                      "Kennedy Krieger Institute (Baltimore, Maryland)","Kentucky Childrens Hospital (Lexington, Kentucky)",
                                      "Kosair Childrens Hospital (Louisville, Kentucky)","La Rabida Childrens Hospital (Chicago, Illinois)",
                                      "Le Bonheur Childrens Hospital (Memphis, Tennessee)","Levine Childrens Hospital (Charlotte, North Carolina)",
                                      "Loma Linda University Childrens Hospital (Loma Linda, California)",
                                      "Lucile Packard Childrens Hospital Stanford (Palo Alto, California)",
                                      "Maimonides Infants and Childrens Hospital of Brooklyn (Brooklyn, New York)",
                                      "Maria Fareri Childrens Hospital at Westchester Medical Center (Valhalla, New York)",
                                      "MassGeneral Hospital for Children (Boston, Massachusetts)",
                                      "Mattel Childrens Hospital UCLA (Los Angeles, California)",
                                      "Mayo Clinic Childrens Center (Rochester, Minnesota)","McLane Childrens Scott & White (Temple, Texas)",
                                      "Medical City Childrens Hospital (Dallas, Texas)","Memorial Childrens Hospital (South Bend, Indiana)",
                                      "Mercy Childrens Hospital - St. Louis (St. Louis, Missouri)",
                                      "Mercy Childrens Hospital - Springfield (Springfield, Missouri)",
                                      "Methodist Childrens Hospital of South Texas (San Antonio, Texas)","Miami Childrens Hospital (Miami, Florida)",
                                      "Miller Childrens & Womens Hospital Long Beach (Long Beach, California)",
                                      "Mission Childrens Hospital at Mission Hospitals (Asheville, North Carolina)",
                                      "Monroe Carell Jr. Childrens Hospital at Vanderbilt (Nashville, Tennessee)",
                                      "Mt. Washington Pediatric Hospital, Inc. (Baltimore, Maryland)",
                                      "MultiCare Mary Bridge Childrens Hospital & Health Center (Tacoma, Washington)",
                                      "Nationwide Childrens Hospital (Columbus, Ohio)","Nemours Childrens Hospital (Orlando, Florida)",
                                      "Newton-Wellesley Hospital (Newton, Massachusetts)",
                                      "NewYork-Presbyterian-Komansky Center for Childrens Health (New York, New York)",
                                      "NewYork-Presbyterian-Morgan Stanley Childrens Hospital (New York, New York)",
                                      "Niswonger Childrens Hospital (Johnson City, Tennessee)",
                                      "North Carolina Childrens Hospital University of North Carolina Hospitals (Chapel Hill, North Carolina)",
                                      "Novant Health Hemby Childrens Hospital (Charlotte, North Carolina)",
                                      "NSMC North Shore Childrens Hospital (Salem, Massachusetts)",
                                      "Ochsner Hospital for Children (New Orleans, Louisiana)",
                                      "Our Childrens House at Baylor (Dallas, Texas)","Our Lady of the Lake Childrens Hospital (Baton Rouge, Louisiana)",
                                      "Palm Beach Childrens Hospital at St. Marys Medical Center (West Palm Beach, Florida)",
                                      "Palmetto Health Childrens Hospital (Columbia, South Carolina)",
                                      "Penn State Childrens Hospital at The Milton S. Hershey Medical Center (Hershey, Pennsylvania)",
                                      "Phoenix Childrens Hospital (Phoenix, Arizona)","Primary Childrens Hospital (Salt Lake City, Utah)",
                                      "ProMedica Toledo Childrens Hospital (Toledo, Ohio)","Providence Childrens Hospital (El Paso, Texas)",
                                      "Providence St. Vincent Medical Center (Portland, Oregon)",
                                      "Rady Childrens Hospital - San Diego (San Diego, California)",
                                      "Randall Childrens Hospital at Legacy Emanuel (Portland, Oregon)",
                                      "Ranken Jordan Pediatric Bridge Hospital (Maryland Heights, Missouri)",
                                      "Renown Childrens Hospital Renown Regional Medical Center (Reno, Nevada)",
                                      "Riley Hospital for Children at Indiana University Health (Indianapolis, Indiana)",
                                      "Ronald McDonald Childrens Hospital (Maywood, Illinois)","Rush Childrens Hospital (Chicago, Illinois)",
                                      "Sacred Heart Childrens Hospital (Spokane, Washington)","Saint Barnabas Medical Center (Livingston, New Jersey)",
                                      "Saint Josephs Childrens Hospital of Marshfield (Marshfield, Wisconsin)",
                                      "San Jorge Childrens Hospital (San Juan, Puerto Rico)","Sanford Childrens Hospital (Sioux Falls, South Dakota)",
                                      "Sanford Childrens Hospital - Fargo (Fargo, North Dakota)","Seattle Childrens (Seattle, Washington)",
                                      "Shriners Hospitals for Children (Tampa, Florida)",
                                      "Shriners Hospitals for Children - Boston (Boston, Massachusetts)",
                                      "Shriners Hospitals for Children - Chicago (Chicago, Illinois)",
                                      "Shriners Hospitals for Children - Cinncinati (Cincinnati, Ohio)",
                                      "Shriners Hospitals for Children - Erie (Erie, Pennsylvania)",
                                      "Shriners Hospitals for Children - Galveston (Galveston, Texas)",
                                      "Shriners Hospitals for Children - Greenville (Greenville, South Carolina)",
                                      "Shriners Hospitals for Children - Honolulu (Honolulu, Hawaii)",
                                      "Shriners Hospitals for Children - Houston (Houston, Texas)",
                                      "Shriners Hospitals for Children - Intermountain (Salt Lake City, Utah)",
                                      "Shriners Hospitals for Children - Lexington (Lexington, Kentucky)",
                                      "Shriners Hospitals for Children - Los Angeles (Los Angeles, California)",
                                      "Shriners Hospitals for Children - Montreal (Montreal, Quebec)",
                                      "Shriners Hospitals for Children - Philadelphia (Philadelphia, Pennsylvania)",
                                      "Shriners Hospitals for Children - Portland (Portland, Oregon)",
                                      "Shriners Hospitals for Children - Sacramento (Sacramento, California)",
                                      "Shriners Hospitals for Children - Shreveport (Shreveport, Louisiana)",
                                      "Shriners Hospitals for Children - Spokane (Spokane, Washington)",
                                      "Shriners Hospitals for Children - Springfield (Springfield, Massachusetts)",
                                      "Shriners Hospitals for Children - St. Louis (St. Louis, Missouri)",
                                      "Shriners Hospitals for Children - Tampa (Tampa, Florida)",
                                      "Shriners Hospitals for Children - Twin Cities (Minneapolis, Minnesota)",
                                      "SSM Cardinal Glennon Childrens Medical Center (St. Louis, Missouri)",
                                      "St. Christophers Hospital for Children (Philadelphia, Pennsylvania)",
                                      "St. Cloud Women and Childrens Center (St. Cloud, Minnesota)",
                                      "St. John Providence Childrens Hospital (Detroit, Michigan)",
                                      "St. Johns Childrens Hospital (Springfield, Illinois)","St. Josephs Childrens Hospital (Paterson, New Jersey)",
                                      "St. Josephs Childrens Hospital of Tampa (Tampa, Florida)",
                                      "St. Jude Childrens Research Hospital (Memphis, Tennessee)","St. Louis Childrens Hospital (St. Louis, Missouri)",
                                      "St. Lukes Childrens Hospital St. Lukes Regional Medical Center (Boise, Idaho)",
                                      "St. Marys Childrens Hospital (Duluth, Minnesota)","St. Marys Healthcare System for Children (Bayside, New York)",
                                      "Steven and Alexandra Cohen Childrens Medical Center of New York (New Hyde Park, New York)",
                                      "Stony Brook Long Island Childrens Hospital (Stony Brook, New York)",
                                      "Sutter Childrens Center, Sacramento (Sacramento, California)",
                                      "T.C. Thompson Childrens Hospital (Chattanooga, Tennessee)",
                                      "Tampa General Hospital Childrens Medical Center (Tampa, Florida)","Texas Childrens Hospital (Houston, Texas)",
                                      "Texas Scottish Rite Hospital for Children (Dallas, Texas)",
                                      "The Barbara Bush Childrens Hospital at Maine Medical Center (Portland, Maine)",
                                      "The Bristol-Myers Squibb Childrens Hospital at Robert Wood Johnson Univ. Hosp. (New Brunswick, New Jersey)",
                                      "The Childrens Hospital at Monmouth Medical Center (Long Branch, New Jersey)",
                                      "The Childrens Hospital at Montefiore (Bronx, New York)",
                                      "The Childrens Hospital at OU MEDICAL CENTER (Oklahoma City, Oklahoma)",
                                      "The Childrens Hospital at Providence Providence Alaska Medical Center (Anchorage, Alaska)",
                                      "The Childrens Hospital at Sacred Heart (Pensacola, Florida)",
                                      "The Childrens Hospital at Saint Francis (Tulsa, Oklahoma)",
                                      "The Childrens Hospital at Saint Peters University Hospital (New Brunswick, New Jersey)",
                                      "The Childrens Hospital at the Medical Center of Central Georgia (Macon, Georgia)",
                                      "The Childrens Hospital of Philadelphia (Philadelphia, Pennsylvania)",
                                      "The Childrens Hospital of South Carolina at MUSC (Charleston, South Carolina)",
                                      "The Childrens Institute of Pittsburgh (Pittsburgh, Pennsylvania)",
                                      "The Childrens Regional Hospital at Cooper (Camden, New Jersey)",
                                      "The Goryeb Childrens Hospital (Morristown, New Jersey)","The Hospital for Sick Children (Toronto, Ontario)",
                                      "The HSC Pediatric Center (Washington, District of Columbia)",
                                      "The Joseph M. Sanzari Childrens Hospital Hackensack University Medical Center (Hackensack, New Jersey)",
                                      "The Mount Sinai Kravis Childrens Hospital (New York, New York)","TMC for Children (Tucson, Arizona)",
                                      "UCSF Benioff Childrens Hospital (San Francisco, California)",
                                      "UCSF Benioff Childrens Hospital Oakland (Oakland, California)",
                                      "UF Health Shands Childrens Hospital (Gainesville, Florida)",
                                      "UH Rainbow Babies and Childrens Hospital (Cleveland, Ohio)",
                                      "UMass Memorial Childrens Medical Center (Worcester, Massachusetts)",
                                      "University of California Davis Childrens Hospital (Sacramento, California)",
                                      "University of Iowa Childrens Hospital (Iowa City, Iowa)",
                                      "University of Michigan C.S. Mott Childrens and Von Voigtlander Womens Hospital (Ann Arbor, Michigan)",
                                      "University of Minnesota Childrens Hospital (Minneapolis, Minnesota)",
                                      "University of New Mexico Childrens Hospital (Albuquerque, New Mexico)",
                                      "University of South Alabama Childrens and Womens Hospital (Mobile, Alabama)",
                                      "University of Virginia Childrens Hospital (Charlottesville, Virginia)",
                                      "Upstate Golisano Childrens Hospital (Syracuse, New York)",
                                      "Vermont Childrens Hospital at Fletcher Allen Health Care (Burlington, Vermont)",
                                      "Voorhees Pediatric Facility (Voorhees, New Jersey)",
                                      "WakeMed Childrens Hospital, WakeMed Health & Hospitals (Raleigh, North Carolina)",
                                      "Wesley Medical Center (Wichita, Kansas)",
                                      "West Virginia University Childrens Hospital (Morgantown, West Virginia)",
                                      "Wolfson Childrens Hospital (Jacksonville, Florida)","Women & Childrens Hospital of Buffalo (Buffalo, New York)",
                                      "Women & Infants Hospital of Rhode Island (Providence, Rhode Island)",
                                      "Womens and Childrens Hospital, University of Missouri Healthcare (Columbia, Missouri)",
                                      "Yale-New Haven Childrens Hospital (New Haven, Connecticut)","Other")
levels(data$hosp_status.factor)=c("Yes","No","Not applicable - admitted for ongoing rehabilitation","Unknown")
levels(data$hosp_dx.factor)=c("Abdominal pain","Bowel obstruction","Catheter event (breakage, dislodgment)","Cellulitis at the line exit site","Chemotherapy","Diarrhea","Fluid/Electrolyte disorder (including dehydration)","Endoscopy/motility studies","Fever","GI bleeding","Infection related to immunocompromised state","Irritability","Liver dysfunction","Positive blood culture","Respiratory distress","Sepsis","Surgery","Urinary tract infection","Vomiting","Other")
levels(data$hosp_discharge.factor)=c("Yes","No")
levels(data$inpatient_encounters_complete.factor)=c("Incomplete","Unverified","Complete")

# Omit rows without real data
data <- filter(data, redcap_repeat_instrument!="")

# Set date variables to class Date
data$hosp_admitdt <- as.Date(data$hosp_admitdt, format = "%m/%d/%Y" )
data[data$hosp_dischargedt=="", "hosp_dischargedt"] <- NA #Make empty strings NA so as.Date() isn't confused
data$hosp_dischargedt <- as.Date(data$hosp_dischargedt, format = "%m/%d/%Y" )

inpatients.df <- data
rm(data)
write.csv(inpatients.df,"inpatients_Jan 18.csv")
