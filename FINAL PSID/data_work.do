*************************************************
* Econ980B Project: Fake It Till You Make It
* Author: Rhea Acharya
* Created: May 2025
*************************************************

*************************************************
* General Set-up
*************************************************

	clear all
	set more off
	pause on
	
	global dir "/Users/rheaacharya/Desktop/Spring 2024/Econ 980b/FINAL PSID"
	
	use "$dir/data/psid_dataset.dta"
	
	reg TA170462 ER32000
	
	
*************************************************
* Get Basic Info
*************************************************

	
*************************************************
* Clean Data
*************************************************

/* Rename variables  */


	rename Q23J1 race
	rename ER32000 sex
	rename TA170787 reading_sat
	rename TA170788 math_sat
	rename TA170789 act_total
	rename TA170814 college_gpa
	rename TA170462 wages
	rename Q24APPR app_prob_rank
	
/* Take out NA values */
	replace race = . if race == 0 | race > 6
	replace sex = 0 if sex == 1
	replace sex = 1 if sex == 2
	replace college_gpa = . if college_gpa > 12 | college_gpa == 0
	replace app_prob_rank = . if app_prob_rank == 999
	replace math_sat = . if math_sat < 200 | math_sat > 800
	replace how_good_at_math = . if how_good_at_math < 1 | how_good_at_math > 7
	replace math_compared = . if math_compared < 1 | math_compared > 7
	replace app_prob_rank = . if app_prob_rank < 0 | app_prob_rank > 99
	
	
/* Make new variables */
	gen log_wages = log(wages)
	
/* Fun little histograms */
	histogram race
	histogram college_gpa
	histogram app_prob_rank
	
/* Cute little summaries */
	summarize race, detail
	tabulate race
	tabulate sex
	tabulate app_prob_rank
	
	
/* Basic regressions to check if everything is working */	
	regress math_sat app_prob_rank
	regress math_sat app_prob_rank sex race
	regress wages app_prob_rank
	regress wages sat_math
	regress log_wages sex
	regress wages sex
	regress math_sat sex
	
	histogram math_sat
	

	/*rename Q3C1 how_good_at_math 
	rename ER32000 sex
	rename TA170788 sat_math
	rename TA130715 sat_reading
	rename Q3APPR app_prob_rank
	rename Q3C2 math_compared
	rename TA130503 earn_13
	rename 
	rename 
	TA150512 */
	
/* Reassign values 
	replace sex = 0 if sex == 1
	replace sex = 1 if sex == 2 */

/* Restrict sample */

	* Must have valid scores

	
*************************************************
* Calculate Confidence Gaps
*************************************************	
/* New variables */
	summarize math_compared
	histogram math_compared
	drop std_mathcompared
	gen std_mathcompared = (math_compared - r(mean)) / r(sd)
	summarize std_mathcompared
	drop pct_math_compared
	xtile pct_math_compared = math_compared, nquantiles(100)
	pctile pct_math_compared = pctile(math_compared), nq(100)
	egen pct_math_compared = pctile(math_compared)
	
	pctile(math_compared)
	
egen satmath = rowmax(sat_math TA130716 TA150728)
summarize satmath
histogram satmath
replace satmath = . if satmath == 0 | satmath > 800

	
/* New Confidence Gap */
gen gap1 = pct_math_compared - app_prob_rank 
gen log_income = log(TA170462)
gen log_earn_13 = log(earn_13)
replace log_earn_13 = . if log_earn_13 > 13
replace sat_math = . if sat_math == 0
summarize gap1
histogram gap1
summarize app_prob_rank
summarize pct_math_compared
histogram pct_math_compared

*************************************************
* Regressions
*************************************************	
reg log_income sex
reg log_income gap1
summarize sex
drop new_i
drop new_i2
gen new_i = gap1 * sex
gen new_i2 = sex * app_prob_rank
reg log_income sex gap1 app_prob_rank new_i new_i2

summarize log_earn_13
histogram log_earn_13
reg log_earn_13 sex 

summarize sat_math
reg satmath sex
histogram sat_math
/* Quickly observe data by year */

	* ds year month hwtfinl, not
	* collapse `r(varlist)', by(year)
	
	* export excel "$dir/Data/cps_data_yearly.xlsx", firstrow(varlabels) replace

/* Restrict sample 

	* Must have data on specific state
	rename statefip state
	drop if state > 56
	
	* Between ages 25-64
	keep if age >= 25 & age <= 64
	
	* Employed
	keep if empstat == 10 | empstat == 12
	
	* Exclude class of worker if "Self-employed, unincorporated" or "Unpaid family worker"
	drop if classwkr == 13
	drop if classwkr == 29
	
/* Generate variables for analysis */

	* Recode education years
	rename educ educCPS
	
	drop if educCPS == 001 | educ == 999 // drop if education level is missing
	
	gen educ = 0 if inlist(educCPS, 000, 002) // none or preschool
	replace educ = 1 if educCPS == 011 // grade 1
	replace educ = 2 if educCPS == 012
	replace educ = 3 if educCPS == 013
	replace educ = 4 if educCPS == 014
	replace educ = 5 if educCPS == 021
	replace educ = 6 if educCPS == 022
	replace educ = 7 if educCPS == 031
	replace educ = 8 if educCPS == 032
	replace educ = 9 if educCPS == 040
	replace educ = 10 if educCPS == 050
	replace educ = 11 if educCPS == 060
	replace educ = 12 if inlist(educCPS, 070, 071, 072, 073) // 12th grade, regardlesss of diploma
	replace educ = 13 if educCPS == 080 // 1 year of college
	replace educ = 14 if educCPS == 090
	replace educ = 15 if educCPS == 100
	replace educ = 16 if educCPS == 110
	replace educ = 17 if educCPS > 111
	
	label var educ "Education"
	
	* Generate educational attainment variables
	gen educHS = 0 // high school diploma
	replace educHS = 1 if educCPS == 073
	
	gen educCollege = 0 // some college
	replace educCollege = 1 if educCPS > 73 & educCPS < 123 & educCPS != 11 & educCPS != 091 & educCPS != 092
	
	gen educAssoc = 0 // associate's degree
	replace educAssoc = 1 if educCPS == 091 | educCPS == 092
	
	gen educBach = 0 // bachelor's degree
	replace educBach = 1 if educCPS == 111
	
	gen educHigher = 0 // master's, professional, or doctorate degree
	replace educHigher = 1 if educCPS > 122
	
	drop educCPS
	
	* Recode health insurance variables to be binary
	replace covergh = covergh - 1
	replace coverpi = coverpi - 1
	
	* Recode sex variable to be binary
	replace sex = sex - 1
	label var sex "Female"
	
	* Generate dummy versions of marital status, citizenship, race, urban
	gen married = 0 if inrange(marst, 3, 7)
	replace married = 1 if marst <= 2
	label var married "Married"
	
	rename citizen citizenship
	gen citizen = 0 if citizenship == 5
	replace citizen = 1 if inlist(citizenship, 1, 3, 4)
	drop if citizenship == 2
	label var citizen "Citizen"
	
	gen nonwhite = 0 if race == 100
	replace nonwhite = 1 if race > 100
	label var nonwhite "Non-white"
	
	gen metro_area = 0 if metro == 1
	replace metro_area = 1 if inlist(metro, 2, 3)
	label var metro_area "Metro"
	
	* Recode union variable
	rename union unionCPS
	gen union = .
	replace union = 0 if unionCPS == 1 | unionCPS == 3
	replace union = 1 if unionCPS == 2
	
	label var union "Union"
	
	* Generate union coverage variable
	gen unioncov = .
	replace unioncov = 0 if unionCPS == 1
	replace unioncov = 1 if unionCPS == 2 | unionCPS == 3
	
	* Industry indicators 
	gen ind_util = 1 if inrange(ind, 0570, 0690)
	replace ind_util = 0 if !inrange(ind, 0570, 0690)
	label var ind_util "Industry - Utilities"
	
	gen ind_transp = 1 if inrange(ind, 6070, 6390)
	replace ind_transp = 0 if !inrange(ind, 6070, 6390)
	label var ind_transp "Industry - Transportation"
	
	gen ind_constr = 1 if ind == 0770
	replace ind_constr = 0 if ind != 0770
	label var ind_constr "Industry - Construction"
	
	gen ind_manuf = 1 if inrange(ind, 1070, 3990)
	replace ind_manuf = 0 if !inrange(ind, 1070, 3990)
	label var ind_manuf "Industry - Manufacturing"
	
	* Industry indicators for ind1990 
	gen ind1990_util = 1 if inrange(ind1990, 450, 472)
	replace ind1990_util = 0 if !inrange(ind1990, 450, 472)
	label var ind1990_util "Industry - Utilities"
	
	gen ind1990_transp = 1 if inrange(ind1990, 400, 432)
	replace ind1990_transp = 0 if !inrange(ind1990, 400, 432)
	label var ind1990_transp "Industry - Transportation"
	
	gen ind1990_constr = 1 if ind1990 == 060
	replace ind1990_constr = 0 if ind1990 != 060
	label var ind1990_constr "Industry - Construction"
	
	gen ind1990_manuf = 1 if inrange(ind1990, 100, 392)
	replace ind1990_manuf = 0 if !inrange(ind1990, 100, 392)
	label var ind1990_manuf "Industry - Manufacturing"
	
	* Relabel outcome variables
	label var covergh "Covered by EPHI"
	label var emcontrb "Employer Contribution"
	label var incwage "Annual Income"
	
	* Dummy for whether or not RTW had been passed for that observation
	gen rtw = 0
	
	replace rtw = 1 if state == 11 // Florida
	replace rtw = 1 if state == 04 // Arizona
	replace rtw = 1 if state == 31 // Nebraska
	replace rtw = 1 if state == 46 // South Dakota
	replace rtw = 1 if state == 05 // Arkansas
	replace rtw = 1 if state == 13 // Georgia
	replace rtw = 1 if state == 19 // Iowa
	replace rtw = 1 if state == 37 // North Carolina
	replace rtw = 1 if state == 38 // North Dakota
	replace rtw = 1 if state == 47 // Tennessee
	replace rtw = 1 if state == 48 // Texas
	replace rtw = 1 if state == 51 // Virginia
	replace rtw = 1 if state == 32 // Nevada
	replace rtw = 1 if state == 01 // Alabama
	replace rtw = 1 if state == 28 // Mississippi
	replace rtw = 1 if state == 45 // South Carolina
	replace rtw = 1 if state == 49 // Utah
	replace rtw = 1 if state == 20 // Kansas
	replace rtw = 1 if state == 56 // Wyoming
	replace rtw = 1 if state == 22 // Louisiana
	replace rtw = 1 if state == 16 // Idaho
	replace rtw = 1 if state == 21 & year >= 2017 // Kentucky
	replace rtw = 1 if state == 54 & year >= 2016 // West Virginia
	replace rtw = 1 if state == 55 & year >= 2015 // Wisconsin
	replace rtw = 1 if state == 26 & year >= 2012 // Michigan
	replace rtw = 1 if state == 18 & year >= 2012 // Indiana
	replace rtw = 1 if state == 40 & year >= 2001 // Oklahoma
	
	* Dummy for ACA Medicaid expansion
	gen st_medicaid = 0
	
	replace st_medicaid = 1 if state == 02 & year >= 2015 // Alabama
	replace st_medicaid = 1 if state == 04 & year >= 2014 // Arizona
	replace st_medicaid = 1 if state == 05 & year >= 2014 // Arkansas
	replace st_medicaid = 1 if state == 06 & year >= 2014 // California
	replace st_medicaid = 1 if state == 08 & year >= 2014 // Colorado
	replace st_medicaid = 1 if state == 09 & year >= 2014 // Connecticut
	replace st_medicaid = 1 if state == 10 & year >= 2014 // Delaware
	replace st_medicaid = 1 if state == 15 & year >= 2014 // Hawaii
	replace st_medicaid = 1 if state == 16 & year >= 2020 // Idaho
	replace st_medicaid = 1 if state == 17 & year >= 2015 // Indiana
	replace st_medicaid = 1 if state == 19 & year >= 2014 // Iowa
	replace st_medicaid = 1 if state == 21 & year >= 2014 // Kentucky
	replace st_medicaid = 1 if state == 22 & year >= 2016 // Louisiana
	replace st_medicaid = 1 if state == 23 & year >= 2019 // Maine
	replace st_medicaid = 1 if state == 24 & year >= 2014 // Maryland
	replace st_medicaid = 1 if state == 25 & year >= 2014 // Massachusetts
	replace st_medicaid = 1 if state == 26 & year >= 2014 // Michigan
	replace st_medicaid = 1 if state == 27 & year >= 2014 // Minnesota
	replace st_medicaid = 1 if state == 30 & year >= 2016 // Montana
	replace st_medicaid = 1 if state == 32 & year >= 2014 // Nevada
	replace st_medicaid = 1 if state == 33 & year >= 2014 // New Hampshire
	replace st_medicaid = 1 if state == 34 & year >= 2014 // New Jersey
	replace st_medicaid = 1 if state == 36 & year >= 2014 // New York
	replace st_medicaid = 1 if state == 32 & year >= 2014 // Nevada
	replace st_medicaid = 1 if state == 33 & year >= 2014 // New Hampshire
	replace st_medicaid = 1 if state == 36 & year >= 2014 // New York
	replace st_medicaid = 1 if state == 38 & year >= 2014 // North Dakota
	replace st_medicaid = 1 if state == 39 & year >= 2014 // Ohio
	replace st_medicaid = 1 if state == 41 & year >= 2014 // Oregon
	replace st_medicaid = 1 if state == 42 & year >= 2014 // Pennsylvania
	replace st_medicaid = 1 if state == 44 & year >= 2014 // Rhode Island
	replace st_medicaid = 1 if state == 49 & year >= 2020 // Utah
	replace st_medicaid = 1 if state == 50 & year >= 2014 // Vermont
	replace st_medicaid = 1 if state == 51 & year >= 2019 // Virginia
	replace st_medicaid = 1 if state == 53 & year >= 2014 // Vermont
	replace st_medicaid = 1 if state == 54 & year >= 2014 // Virginia
	
	* Dummy for individual mandate
	gen st_indiv = 0
	
	replace st_indiv = 1 if year >= 2014 & year <= 2019
	replace st_indiv = 1 if state == 25 & year >= 2007 // Massachusetts
	
	* Dummy for employer mandate
	gen st_employ = 0
	
	replace st_employ = 1 if year >= 2015
	replace st_employ = 1 if state == 15 // Hawaii
	replace st_employ = 1 if state == 25 & year >= 2006 // Massachusetts
	
	* Dummy for state reinsurance programs
	gen st_reins = 0
	
	replace st_reins = 1 if state == 02 & year >= 2017 // Alaska
	replace st_reins = 1 if state == 23 & year >= 2018 // Maine
	replace st_reins = 1 if state == 24 & year >= 2018 // Maryland
	replace st_reins = 1 if state == 27 & year >= 2017 // Minnesota
	replace st_reins = 1 if state == 34 & year >= 2018 // New Jersey
	replace st_reins = 1 if state == 41 & year >= 2017 // Oregon
	replace st_reins = 1 if state == 55 & year >= 2018 // Wisconsin
	
/* Variables for inspection */

	* Generate variable for union density by industry
	egen uniondens = mean(union), by(ind)

	
	
*************************************************
* Regressions
*************************************************

/* Main IV regression */

	* Run regression
	eststo clear
	
	foreach var in covergh emcontrb { 
		
		eststo: xi: ivregress 2sls `var' (union = rtw) i.state i.year /*i.state##i.year*/ incwage educ* age sex ///
			i.race i.marst nchild i.citizenship metro_area i.ind i.occ st_medicaid st_indiv st_reins st_employ, robust cluster(state)
	
		sum `var' if union == 0 & !mi(state) & !mi(year) & !mi(incwage) & !mi(educ) & !mi(age) & !mi(sex) & !mi(race) ///
			& !mi(marst) & !mi(nchild) & !mi(citizenship) & !mi(metro_area) & !mi(ind) & !mi(occ)
		estadd scalar Cmean = r(mean)
		estadd scalar Csd = r(sd)
	
	}
	
	* Export table
	#d;
	esttab using "$dir/Tables/iv_results.tex", replace booktabs
		wrap compress nogap nonotes
		se label r2
		mtitles("Health Insurance Coverage" "Employer Contribution" "Out of Pocket Payments")
		indicate("State FE = _Istate*" "Year FE = _Iyear*" "Ind \& Occ FE = _Iind* _Iocc*" 
		"Controls = incwage educ* age sex _Irace* _Imarst* nchild _Icitizensh* metro_area st_*")
		stats(Cmean Csd N, labels("Base Mean" "Base SD" "N"))
		star(* 0.10 ** 0.05 *** 0.01)
	;#d cr
	
/* First stage regression */

	* Run regression
	eststo clear 
	
	eststo: xi: reg union rtw i.state i.year /*i.state##i.year*/ incwage educ* age sex ///
		i.race i.marst nchild i.citizenship metro_area i.ind i.occ st_medicaid st_indiv st_reins st_employ, robust cluster(state)
		
	sum union if rtw == 0 & !mi(state) & !mi(year) & !mi(incwage) & !mi(educ) & !mi(age) & !mi(sex) & !mi(race) ///
		& !mi(marst) & !mi(nchild) & !mi(citizenship) & !mi(metro_area) & !mi(ind) & !mi(occ)
	estadd scalar Cmean = r(mean)
	estadd scalar Csd = r(sd)	
	
	* Export table
	#d;
	esttab using "$dir/Tables/first_stage.tex", replace booktabs
		wrap compress nogap nonotes
		se label r2
		indicate("State FE = _Istate*" "Year FE = _Iyear*" "Ind \& Occ FE = _Iind* _Iocc*" 
		"Controls = incwage educ* age sex _Irace* _Imarst* nchild _Icitizensh* metro_area st_*")
		stats(Cmean Csd N, labels("Base Mean" "Base SD" "N"))
		star(* 0.10 ** 0.05 *** 0.01)
	;#d cr
	
/* Reduced form regression */

	* Run regression
	eststo clear 
	
	foreach var in covergh emcontrb { 
		
		eststo: xi: reg `var' rtw i.state i.year /*i.state##i.year*/ incwage educ* age sex ///
			i.race i.marst nchild i.citizenship metro_area i.ind i.occ st_medicaid st_indiv st_reins st_employ, robust cluster(state)
	
		sum `var' if rtw == 0 & !mi(state) & !mi(year) & !mi(incwage) & !mi(educ) & !mi(age) & !mi(sex) & !mi(race) ///
			& !mi(marst) & !mi(nchild) & !mi(citizenship) & !mi(metro_area) & !mi(ind) & !mi(occ)
		estadd scalar Cmean = r(mean)
		estadd scalar Csd = r(sd)
	
	}
	
	* Export table
	#d;
	esttab using "$dir/Tables/reduced_form.tex", replace booktabs
		wrap compress nogap nonotes
		se label r2
		indicate("State FE = _Istate*" "Year FE = _Iyear*" "Ind \& Occ FE = _Iind* _Iocc*" 
		"Controls = incwage educ* age sex _Irace* _Imarst* nchild _Icitizensh* metro_area st_*")
		stats(Cmean Csd N, labels("Base Mean" "Base SD" "N"))
		star(* 0.10 ** 0.05 *** 0.01)
	;#d cr
	
/* OLS regression */

	* Run regression
	eststo clear
	
	foreach var in covergh emcontrb { 
		
		eststo: xi: ivregress 2sls `var' union i.state i.year /*i.state##i.year*/ incwage educ* age sex ///
			i.race i.marst nchild i.citizenship metro_area i.ind i.occ st_medicaid st_indiv st_reins st_employ, robust cluster(state)
	
		sum `var' if union == 0 & !mi(state) & !mi(year) & !mi(incwage) & !mi(educ) & !mi(age) & !mi(sex) & !mi(race) ///
			& !mi(marst) & !mi(nchild) & !mi(citizenship) & !mi(metro_area) & !mi(ind) & !mi(occ)
		estadd scalar Cmean = r(mean)
		estadd scalar Csd = r(sd)
	
	}
	
	* Export table
	#d;
	esttab using "$dir/Tables/ols.tex", replace booktabs
		wrap compress nogap nonotes
		se label r2
		mtitles("Health Insurance Coverage" "Employer Contribution" "Out of Pocket Payments")
		indicate("State FE = _Istate*" "Year FE = _Iyear*" "Ind \& Occ FE = _Iind* _Iocc*" 
		"Controls = incwage educ* age sex _Irace* _Imarst* nchild _Icitizensh* metro_area st_*")
		stats(Cmean Csd N, labels("Base Mean" "Base SD" "N"))
		star(* 0.10 ** 0.05 *** 0.01)
	;#d cr
	
*************************************************
* Summary Statistics
*************************************************
	
	* Summary stats table 1 - in-depth stats on each variable
	eststo clear
	
	eststo: estpost summ union covergh emcontrb incwage educ age sex nonwhite married nchild citizen metro_area ind1990_util ind1990_transp ind1990_constr ind1990_manuf if year == 1994
	
	#d;
	esttab using "$dir/Tables/summ_stats.tex", replace booktabs 
		cells("mean(fmt(%9.2f)) sd(fmt(%9.2f)) min(fmt(%9.0f)) max(fmt(%9.0f)) count(fmt(%9.0f))") 
		nonumbers noobs label compress b(%9.2f)
	;#d cr
	
	
	* Summary stats table 2 - ummarize total, then states that didn't pass RTW law in 1988+, then states that did
	eststo clear
	
	eststo: estpost summ union covergh emcontrb incwage educ age sex nonwhite married citizen metro_area ind1990_util ind1990_transp ind1990_constr ind1990_manuf if year == 1994
	eststo: estpost summ union covergh emcontrb incwage educ age sex nonwhite married citizen metro_area ind1990_util ind1990_transp ind1990_constr ind1990_manuf if year == 1994 & !inlist(state, 21, 54, 55, 26, 18, 40)
	eststo: estpost summ union covergh emcontrb incwage educ age sex nonwhite married citizen metro_area ind1990_util ind1990_transp ind1990_constr ind1990_manuf if year == 1994 & inlist(state, 21, 54, 55, 26, 18, 40)

	#d;
	esttab using "$dir/Tables/summ_stats2.tex", replace booktabs 
		main(mean %12.2fc) aux(sd %12.2fc)
		mtitles("All Workers" "Non-RTW" "RTW")
		nonotes label compress 
	;#d cr
	
	
*************************************************
* Graphs
*************************************************

/* Summary statistics */

	local i = 1
	
	foreach var in covergh emcontrb {
	
		local title1 = "Employer-Provided Insurance Coverage"
		local title2 = "Average Employer Contribution"
		
		local ytitle1 = "Fraction Covered by Employer-Provided Insurance"
		local ytitle2 = "Employer Contributions ($)"
		
		local xlow1 = 0.6
		local xlow2 = 1000
		
		local xmid1 = 0.05
		local xmid2 = 200
		
		local xhigh1 = 1
		local xhigh2 = 3000
		
		local width1 = 0.05
		local width2 = 200
		
		local ymid1 = 4
		local ymid2 = 2
		
		local yhigh1 = 24
		local yhigh2 = 12
		
		preserve
	
		collapse `var', by(state year)
		
		drop if year != 1995
		
		#d;
		twoway (hist `var', fcolor(navy*0.8) lcolor(navy) start(`xlow`i'') width(`width`i'') frequency),
			graphregion(color(white))
			xlabel(`xlow`i''(`xmid`i'')`xhigh`i'') ylabel(0(`ymid`i'')`yhigh`i'', labsize(small))
			title("`title`i'' by State (1995)")
			xtitle("`ytitle`i''") ytitle("Number of States")
		;#d cr
		
		graph export "$dir/Figures/`var'_hist.jpg", replace
		
		restore
		
		local i = `i' + 1
	
	}
	

/* Outcome variables */

	* Unweighted mean calculation
	local i = 1
	
	foreach var in covergh emcontrb {
	
		local yr_st1 = 1988
		local yr_st2 = 1988
		local yr_st3 = 1988
		
		local yr_end1 = 2018
		local yr_end2 = 2017
		local yr_end3 = 2018
		
		egen `var'_other = mean(`var') if !inlist(state, 21, 54, 55, 26, 18, 40) & inrange(year, `yr_st`i'', `yr_end`i''), by(year)

		egen `var'_KY = mean(`var') if state == 21 & inrange(year, `yr_st`i'', `yr_end`i''), by(year)
		egen `var'_WV = mean(`var') if state == 54 & inrange(year, `yr_st`i'', `yr_end`i''), by(year)
		egen `var'_WI = mean(`var') if state == 55 & inrange(year, `yr_st`i'', `yr_end`i''), by(year)
		egen `var'_MI = mean(`var') if state == 26 & inrange(year, `yr_st`i'', `yr_end`i''), by(year)
		egen `var'_IN = mean(`var') if state == 18 & inrange(year, `yr_st`i'', `yr_end`i''), by(year)
		egen `var'_OK = mean(`var') if state == 40 & inrange(year, `yr_st`i'', `yr_end`i''), by(year)
	
		local i = `i' + 1
		
	}
	
	* line graphs (note that emcontrb data is only available til 2017, and RTW law in Kentucky was just passed in 2017)
	local i = 1
	
	foreach var in covergh emcontrb {
	
		local title1 = "Employer-Provided Insurance Coverage"
		local title2 = "Employer Contributions"
		
		local ytitle1 = "Fraction Covered by Employer-Provided Insurance"
		local ytitle2 = "Employer Contributions ($)"
		
		local yrst1 = 1985
		local yrst2 = 1985
		local yrst3 = 2010

		local ylow1 = 0.6
		local ylow2 = 1000
		local ylow3 = 0
		
		local ymid1 = 0.1
		local ymid2 = 1000
		local ymid3 = 2000
		
		local yhigh1 = 1
		local yhigh2 = 5000
		local yhigh3 = 10000
		
		forvalues j = 1(1)5 {
	
			local st1 = "WV"
			local st2 = "WI"
			local st3 = "MI"
			local st4 = "IN"
			local st5 = "OK"
			
			local state1 = "West Virginia"
			local state2 = "Wisconsin"
			local state3 = "Michigan"
			local state4 = "Indiana"
			local state5 = "Oklahoma"
			
			local rtw1 = 2016
			local rtw2 = 2015
			local rtw3 = 2012
			local rtw4 = 2012
			local rtw5 = 2001
		
			#d;
			graph twoway 
				(line `var'_`st`j'' year, lcolor(red) lpattern(shortdash) sort)
				(line `var'_other year, lcolor(blue) lpattern(shortdash) sort),
				graphregion(fcolor(white))
				xlabel(`yrst`i''(5)2020, labsize(small)) ylabel(`ylow`i''(`ymid`i'')`yhigh`i'', labsize(small))
				title("`title`i'' by Year", size(medlarge))
				xtitle("Year") ytitle("`ytitle`i''")
				legend(order(1 "`state`j''" 2 "Other"))
				xline(`rtw`j'')
			;#d cr
			
			graph export "$dir/Figures/`var'_`st`j''.jpg", replace
		
		}
		
		local i = `i' + 1
		
	}
	
