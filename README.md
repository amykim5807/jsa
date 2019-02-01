# jsa

## Tableau Worksheets (External)
All worksheets can be accessed at https://public.tableau.com/profile/amy.kim7433#!/

### JSA_Old
Old workbook, using 102 MSA data before reranking — does not include pair/triangle data
- Version 0: Map of 102 MSAs, size by ranking, tooltips include raw data (unformatted)
- Version 1: Version 0 with parameter controls
- Top 10: List of Top 10 MSAs given current parameter values
- Dashboard 1: Combination of Version 1 and Top 10 -- mockup of potential website interface

### JSA_All_MSAs
Contains data on all 382 MSAs
- Map: Map of all 382 MSAs, with ranking determined internally using formulas (currently ranking includes all 382 -- no restrictions based on population, housing prices, etc.). Also includes parameter controls for all 8 factors, and tooltips with all data
- Sheet 2: List of all MSAs, in order of overall rank
- Dashboard: Combination of Map and Sheet 2

### JSA_V1_Reranked
Current workbook, uses reranked data for top 102 MSAs 
- unweighted_website: unweighted dots (uniform size), overlayed on US Metro Boundaries
- dashboard_complex: map of msa weighted dots (by rank), parameter controls for all 8 factors, live ranking of all msas based on current weights (uses Top Ten and V1_reranked_complex)
- dashboard_simple_v1: map of msa weighted dots (by rank), parameter controls for only three main categories, live ranking of all msas based on current weights (uses v1_reranked_simple and Top Ten)
  - DOES NOT use spacers to cover irrelevant parameters
  - uses weights sheet to display actual current weights -- recalculated automatically based on drop-down
- dashboard_simple: map of msa weighted dots (by rank), parameter controls for only three main categories, live ranking of all msas based on current weights (uses v1_reranked_simple and Top Ten)
  - DOES USE pop_spacer, edu_spacer, life_spacer to cover parameter controls until selected using drop-down
  - uses weights sheet to display actual current weights -- recalculated automatically based on drop-down
 
### book_state_abbr
Workbook for map in book front inside cover
- bookmap: sheet with unweighted dots, greyscale, state abbreviations
  - state abbreviations done by adding coordinate locations for state labels to the data source, then duplicating longitude to create two identical maps, changing the filters and formatting on each so one shows MSA dots and the other shows state abbreviations, then selecting dual axis to merge onto one map
  - some state name coordinates adjusted to be off land, then annotation created with empty annotation box to connect to the state area
  - also blocks out Bahamas by creating empty annotation box
  - line drawn to imitate possible centerfold 
- bookmap_full: uses bookmap (used to have legend)


## Data
Contains various data sources used for and produced by scripts

## Scripts
### R
Contains various R scripts used to clean data for use in Tableau, or for analysis/appendix

### Web
Contains code used to locally test integration of Tableau with website
