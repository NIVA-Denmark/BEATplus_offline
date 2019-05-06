# -------- BEAT+ Tool for offline calculations without shiny -----------------------------
# 
# Instructions
# 
# Select the file containing input data for the assessment.
# The file must be in text format and column headers must be included.
# 
# The required columns are:
#       Group
#       Indicator
#       Threshold
#       Status
#       Reference
#       Bad
#
# The following columns are optional:
#       SpeciesGroup
#       Species
#       SpatialAssessmentUnit
# 
# The assesssment is made per Spatial Assessment Unit. If no Spatial Assessment Unit is specified, all indicators are combined in a single assessment.
# Within a spatial assessment unit, indicators are aggregated within Group (e.g. Birds, Fish, etc.)
# If SpeciesGroup is specified (e.g. Wading Birds), then they will be aggregated at this level before Group (eg. Birds)
# If Species is specified, then indicators will be aggregated at this level before SpeciesGroup
# 

# Specify input data file and column separation character (e.g. ";")


file_Input <- "test.txt"
sepChar <- ";"
  
# specify names for output result files  
  file_Results_Assessment_Units <- "Results_Assessment_Units.csv"
  file_Results_Groups <- "Results_Groups.csv"
  file_Results_Indicators <- "Results_Indicators.csv"

# --------------- Code -----------------------------------------------------------------

library(shiny)
library(readr)
library(ggplot2)
source('assessment.R')

# read input data file
df <-  read.table(paste0("input/",file_Input), sep=sepChar, header=T, stringsAsFactors=F)

# call calculation routines
res <- Assessment(df)

# get separate results
IndicatorsDownload <- res[[2]] 
Species <- res[[4]] 
SpeciesGroups <- res[[5]] 
Groups <- res[[6]]  
AssessmentUnits <- res[[3]] 

# save results to "results" folder
write.table(AssessmentUnits,file=paste0("results/",file_Results_Assessment_Units), sep=sepChar,row.names=F,na="")
write.table(Groups,file=paste0("results/",file_Results_Groups), sep=sepChar,row.names=F,na="")
write.table(IndicatorsDownload,file=paste0("results/",file_Results_Indicators), sep=sepChar,row.names=F,na="")


