# BEATplus_offline
BEAT+ Tool for offline calculations without shiny

## Instructions

Select the file containing input data for the assessment.
The file must be in text format and column headers must be included.

The required columns are:
<li>Group
<li>Indicator
<li>Threshold
<li>Status
<li>Reference
<li>Bad

The following columns are optional:
<li>SpeciesGroup
<li>Species
<li>SpatialAssessmentUnit

The assesssment is made per Spatial Assessment Unit. If no Spatial Assessment Unit is specified, all indicators are combined in a single assessment.

Within a spatial assessment unit, indicators are aggregated within Group (e.g. Birds, Fish, etc.)

If SpeciesGroup is specified (e.g. Wading Birds), then they will be aggregated at this level before Group (eg. Birds)

If Species is specified, then indicators will be aggregated at this level before SpeciesGroup
