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
	
	global dir "/Users/rheaacharya/Desktop/Spring 2024/Econ 980b/econ980b/CURRENT PSID"
	
	use "$dir/psid_data.dta"
	
	* ssc install svyhist
	
	* reg TA170462 ER32000
	
	
*************************************************
* Get Basic Info
*************************************************

	
*************************************************
* Clean Data
*************************************************

/* Rename variables  */

	* svyset CH02PRWT

	
	rename Q23J1 race
	rename ER32000 sex
	rename TA170787 reading_sat
	rename TA170788 math_sat
	rename TA170789 act_total
	rename TA170814 college_gpa
	rename TA170462 wages
	rename Q24APPR app_prob_rank
	rename Q24BRPR reading_rank
	rename Q21B16 gifted
	rename Q23E2 math_compared
	rename Q23E12 reading_compared
	rename Q23E1 how_good_at_math
	rename ER33604 age
	rename Q34APPR app_prob_rank_07
	rename Q34BRPR reading_rank_07
	rename Q23E11 how_good_at_reading
	rename TA170905 emotional_prob
	rename TA170802 college_major
	
	
	gen total_sat = reading_sat + math_sat
	
	/* NEW ANALYSIS */
	
	replace gifted = . if gifted == 9 | gifted == 0
	replace race = . if race == 0 | race > 6
	replace reading_rank = . if reading_rank == 999
	replace college_gpa = . if college_gpa > 12 | college_gpa == 0
	replace app_prob_rank = . if app_prob_rank == 999
	replace math_sat = . if math_sat < 200 | math_sat > 800
	replace reading_sat = . if reading_sat < 200 | reading_sat > 800
	replace how_good_at_math = . if how_good_at_math < 1 | how_good_at_math > 7
	replace math_compared = . if math_compared < 1 | math_compared > 7
	replace reading_compared = . if reading_compared < 1 | reading_compared > 7
	replace app_prob_rank = . if app_prob_rank < 0 | app_prob_rank > 99
	replace wages = . if wages > 9999997
	replace wages = . if wages == 0
	replace emotional_prob = . if emotional_prob == 8 | emotional_prob == 9
	
	drop if age <= 7
	
	replace sex = 0 if sex == 1
	replace sex = 1 if sex == 2
	
	/* basic regression */
	regress wages sex
	
	histogram TA170907
	replace TA170907 = . if TA170907 == 0
	
	replace TA170910 = . if TA170910 == 0
	/* summarize */
	
	summarize math_compared
	summarize math_compared if sex == 0
	summarize math_compared if sex == 1
	
	summarize reading_compared
	summarize reading_compared if sex == 0
	summarize reading_compared if sex == 1
	
	summarize how_good_at_math
	summarize how_good_at_math if sex == 0
	summarize how_good_at_math if sex == 1
	
	summarize how_good_at_reading
	summarize how_good_at_reading if sex == 0
	summarize how_good_at_reading if sex == 1
	
	summarize app_prob_rank
	summarize app_prob_rank if sex == 0
	summarize app_prob_rank if sex == 1
	
	summarize reading_rank
	summarize reading_rank if sex == 0
	summarize reading_rank if sex == 1
	
	
	/* Creating math confidence gaps */
	
	gen adjusted_selfreport_math = missing()
	replace adjusted_selfreport_math = .90 if how_good_at_math == 1
	replace adjusted_selfreport_math = 2.94 if how_good_at_math == 2
	replace adjusted_selfreport_math = 8.48 if how_good_at_math == 3
	replace adjusted_selfreport_math = 29.40 if how_good_at_math == 4
	replace adjusted_selfreport_math = 58.21 if how_good_at_math == 5
	replace adjusted_selfreport_math = 80.60 if how_good_at_math == 6
	replace adjusted_selfreport_math = 95.36 if how_good_at_math == 7
	
	drop math_gap_cont
	gen math_gap_cont = adjusted_selfreport_math - app_prob_rank
	* replace math_gap_cont = . if abs(math_gap_cont) >= 75
	
	histogram math_gap_cont
	
	histogram math_gap_cont if sex == 0 
	histogram math_gap_cont if sex == 1 
	
	summarize math_gap_cont
	summarize math_gap_cont if sex == 0 
	summarize math_gap_cont if sex == 1 
	
	regress math_gap_cont sex [pweight = ER34651]
	drop indicator_mathgap_sex
	gen indicator_mathgap_sex = math_gap_cont * sex
	
	regress app_prob_rank math_gap_cont sex indicator_mathgap_sex [pweight = ER34651]
	regress app_prob_rank_07 app_prob_rank math_gap_cont sex indicator_mathgap_sex [pweight = ER34651]
	
	regress app_prob_rank_07 sex [pweight = ER34651]
	
	regress app_prob_rank math_gap_cont if sex == 0
	regress app_prob_rank math_gap_cont if sex == 1
	
	regress math_sat math_gap_cont app_prob_rank sex indicator_mathgap_sex [pweight = ER34651]
	
	regress math_sat math_gap_cont app_prob_rank if sex == 0
	regress math_sat math_gap_cont app_prob_rank if sex == 1
	
	regress app_prob_rank_07 app_prob_rank math_gap_cont if sex == 0
	regress app_prob_rank_07 app_prob_rank math_gap_cont if sex == 1
	
	regress app_prob_rank_07 app_prob_rank math_gap_cont 
	
	
	/* Creating reading confidence gaps */
	drop adjusted_selfreport_reading
	gen adjusted_selfreport_reading = missing()
	replace adjusted_selfreport_reading = 0.36 if how_good_at_reading == 1
	replace adjusted_selfreport_reading = 1.58 if how_good_at_reading == 2
	replace adjusted_selfreport_reading = 5.61 if how_good_at_reading == 3
	replace adjusted_selfreport_reading = 23.67 if how_good_at_reading == 4
	replace adjusted_selfreport_reading = 51.32 if how_good_at_reading == 5
	replace adjusted_selfreport_reading = 75.86 if how_good_at_reading == 6
	replace adjusted_selfreport_reading = 93.83 if how_good_at_reading == 7
	
	gen reading_gap_cont = adjusted_selfreport_reading - reading_rank
	* replace reading_gap_cont = . if abs(math_gap_cont) >= 75

	regress reading_gap_cont sex [pweight = ER34651]
	
	summarize reading_gap_cont
	summarize reading_gap_cont if sex == 0 
	summarize reading_gap_cont if sex == 1 
	
	
	gen indicator_readinggap_sex = reading_gap_cont * sex
	
	regress reading_rank reading_gap_cont sex indicator_readinggap_sex [pweight = ER34651]
	regress reading_rank_07 reading_rank reading_gap_cont sex indicator_readinggap_sex [pweight = ER34651]
	
	
	regress reading_sat reading_gap_cont reading_rank sex indicator_readinggap_sex [pweight = ER34651]
	
	regress reading_sat reading_gap_cont reading_rank if sex == 0
	regress reading_sat reading_gap_cont reading_rank if sex == 1
	
	regress reading_rank_07 reading_rank reading_gap_cont if sex == 0
	regress reading_rank_07 reading_rank reading_gap_cont if sex == 1
	
	regress reading_rank_07 reading_rank reading_gap_cont 
	
	drop rrgap_under
	drop i_ru
	gen rrgap_under = 0
	replace rrgap_under = abs(reading_gap_cont) if reading_gap_cont < 0
	gen i_ru = sex * rrgap_under
	
	
	gen rrgap_over = 0
	replace rrgap_over = reading_gap_cont if reading_gap_cont > 0
	gen i_rover = sex * rrgap_over
	
	drop rrgap_under
	drop i_mu
	drop i_mover
	drop i_rover
	
	drop mathgap_under
	gen mathgap_under = 0
	replace mathgap_under = abs(math_gap_cont) if math_gap_cont < 0
	gen i_mu = sex * mathgap_under
	
	drop mathgap_over
	gen mathgap_over = 0
	replace mathgap_over = math_gap_cont if math_gap_cont > 0
	gen i_mover = sex * mathgap_over
	
	
	/* EMOTIONAL PROB */
	histogram emotional_prob
	replace emotional_prob = 1 if emotional_prob == 5
	regress emotional_prob reading_rank rrgap_under sex i_ru 
	regress emotional_prob reading_rank rrgap_over sex i_rover
	
	regress emotional_prob app_prob_rank mathgap_under sex i_mu 
	regress emotional_prob app_prob_rank mathgap_over sex i_mover
	
	regress TA170907 reading_rank rrgap_under sex i_ru family_income race school_type gifted
	regress TA170907 reading_rank rrgap_over sex i_rover family_income race school_type gifted
	
	regress TA170907 app_prob_rank mathgap_under sex i_mu family_income race school_type gifted
	regress TA170907 app_prob_rank mathgap_over sex i_mover family_income race school_type gifted
	
	histogram TA170910
	
	regress TA170910 reading_rank rrgap_under sex i_ru 
	regress TA170910 reading_rank rrgap_over sex i_rover
	
	regress TA170910 app_prob_rank mathgap_under sex i_mu 
	regress TA170910 app_prob_rank mathgap_over sex i_mover
	
	TA170910
	TA170907
	
	
	rename TA170790 college_degree
	replace college_degree = 0.5 if college_degree == 3 | college_degree == 5 | college_degree == 8 | college_degree == 9
	replace college_degree = 1.5 if college_degree == 1
	histogram college_degree
	summarize college_degree if college_degree == 0.5 | college_degree == 1.5
	
	regress college_degree reading_rank rrgap_under sex i_ru total_sat [pweight = ER34651]
	regress college_degree reading_rank rrgap_over sex i_rover total_sat [pweight = ER34651]
	
	regress college_degree app_prob_rank mathgap_under sex i_mu total_sat [pweight = ER34651]
	regress college_degree app_prob_rank mathgap_over sex i_mover total_sat [pweight = ER34651]
	
	histogram total_sat
	
	histogram age
	
	summarize math_sat
	summarize reading_sat
	summarize total_sat
	summarize log_wages

	drop stem_major
	gen stem_major = missing()
	replace stem_major = 1 if college_major > 1 & college_major < 997
	replace stem_major = 2 if college_major >= 21 & college_major <= 57
	replace stem_major = 2 if college_major == 120 | college_major == 122
	
	summarize stem_major if stem_major == 1 | stem_major == 2
	summarize college_major
	tabulate college_major
	
	summarize rrgap_over if rrgap_over > 0
	summarize rrgap_under if rrgap_under > 0
	summarize rrgap_over if rrgap_over > 0 & sex == 0
	summarize rrgap_under if rrgap_under > 0 &  sex == 0
	summarize rrgap_under
	summarize rrgap_over if sex == 0
	summarize rrgap_under if sex == 0
	summarize rrgap_over if sex == 0
	summarize rrgap_over if sex == 1
	summarize mathgap_over if sex == 0
	summarize mathgap_over if sex == 1
	summarize rrgap_under if sex == 0
	summarize rrgap_under if sex == 1
	summarize mathgap_under if sex == 0
	summarize mathgap_under if sex == 1
	
	
	
	
	summarize stem_major if mathgap_under == 0
	summarize stem_major if mathgap_under > 0
	summarize stem_major if mathgap_over == 0
	summarize stem_major if mathgap_over > 0
	
	summarize math_gap_cont if stem_major == 1
	summarize math_gap_cont if stem_major == 0
	summarize math_sat if stem_major == 1
	summarize math_sat if stem_major == 0

	summarize math_gap_cont if stem_major == 1 & sex == 0
	summarize math_gap_cont if stem_major == 1 & sex == 1
	summarize math_gap_cont if stem_major == 0 & sex == 0
	summarize math_gap_cont if stem_major == 0 & sex == 1
	
	summarize math_sat if stem_major == 1 & sex == 0
	summarize math_sat if stem_major == 1 & sex == 1
	summarize math_sat if stem_major == 0 & sex == 0
	summarize math_sat if stem_major == 0 & sex == 1
	
	regress stem_major app_prob_rank mathgap_under sex i_mu total_sat
	regress stem_major app_prob_rank mathgap_over sex i_mover total_sat
	
	
	/* WAGES */
	gen log_wages = log(wages)
	regress wages app_prob_rank math_gap_cont sex indicator_mathgap_sex [pweight = ER34651]
	regress wages reading_rank reading_gap_cont sex indicator_readinggap_sex [pweight = ER34651]
	
	eststo clear

	/* actual ones */
	regress log_wages reading_rank rrgap_under sex i_ru race gifted family_income school_type
	regress log_wages reading_rank rrgap_over sex i_rover race gifted family_income school_type
	
	regress log_wages app_prob_rank mathgap_under sex i_mu race gifted family_income school_type
	regress log_wages app_prob_rank mathgap_over sex i_mover race gifted family_income school_type
	
	
	regress wages app_prob_rank math_gap_cont sex indicator_mathgap_sex 
	estimates store W1
	regress wages reading_rank reading_gap_cont sex indicator_readinggap_sex
	estimates store W2
	
	esttab W1 W2 using "$dir/Tables/wages.tex$", replace booktabs
		* wrap compress nogap nonotes
		* se label r2
		se title("Wages Regression Results") mtitles("Basic Math" "Basic Reading") b(%9.2f) //
		addnotes("Standard errors in parentheses") //
		stats(r2 N, labels("R-squared" "Number of obs")) //
		star(* 0.10 ** 0.05 *** 0.01)
		
	
	regress log_wages app_prob_rank math_gap_cont sex indicator_mathgap_sex 
	regress log_wages reading_rank reading_gap_cont sex indicator_readinggap_sex 
	
	
	
	/* HISTOGRAM */
	histogram math_gap_cont, title("Math Confidence Gaps") ///
		xtitle("Math Confidence Gap, %") ytitle("Density") color(purple) 
		
	histogram reading_gap_cont if sex == 1, title("Reading Confidence Gaps") ///
		xtitle("Reading Confidence Gap, %") ytitle("Density") color(purple)
		
	histogram how_good_at_reading if sex == 1, title("Female Absolute Reading Self-Report") ///
		xtitle("How good are you at reading?") ytitle("Density") color(red)
		
	histogram how_good_at_math if sex == 1, title("Female Absolute Math Self-Report") ///
		xtitle("How good are you at math?") ytitle("Density") color(red)
	
	/* DISCRETE */
	
	 gen over_discrete_conf_math = 0
	 * underconfidence = 0
	 replace over_discrete_conf_math = 0 if (app_prob_rank > 75) & (how_good_at_math >= 1 & how_good_at_math <= 4)
	 replace over_discrete_conf_math = 0 if (app_prob_rank > 50) & (how_good_at_math >= 1 & how_good_at_math <= 3)
	 * overconfidence = 1
	 replace over_discrete_conf_math = 1 if (app_prob_rank < 25) & (how_good_at_math == 6 | how_good_at_math == 7)
	 replace over_discrete_conf_math = 1 if (app_prob_rank < 50) & (how_good_at_math == 7)
	 
	 drop discrete_conf_reading
	 gen over_discrete_conf_reading = 0
	 * underconfidence = 0
	 replace over_discrete_conf_reading = 0 if (reading_rank > 75) & (how_good_at_reading >= 1 & reading_compared <= 4)
	 replace over_discrete_conf_reading = 0 if (reading_rank > 50) & (how_good_at_reading >= 1 & reading_compared <= 3)
	 * overconfidence = 1
	 replace over_discrete_conf_reading = 1 if (reading_rank < 25) & (how_good_at_reading == 6 | how_good_at_reading == 7)
	 replace over_discrete_conf_reading = 1 if (reading_rank < 50) & (how_good_at_reading == 7)
	 
	 
	 gen indicator_discrete_math = over_discrete_conf_math * sex
	 gen indicator_discrete_reading = over_discrete_conf_reading * sex
	 
	 * Regressions
	 regress log_wages over_discrete_conf_math app_prob_rank sex indicator_discrete_math
	 regress log_wages over_discrete_conf_reading reading_rank sex indicator_discrete_reading
	 
	 
	 regress math_sat over_discrete_conf_math app_prob_rank sex indicator_discrete_math [pweight = ER34651]
	
	
	regress math_sat app_prob_rank mathgap_under sex i_mu 
	regress math_sat app_prob_rank mathgap_over sex i_mover
	regress math_sat app_prob_rank mathgap_under sex i_mu family_income race gifted school_type
	regress math_sat app_prob_rank mathgap_over sex i_mover family_income race gifted school_type
	
	regress reading_sat reading_rank rrgap_under sex i_mu 
	regress reading_sat reading_rank rrgap_over sex i_rover
	regress reading_sat reading_rank rrgap_under sex i_mu  family_income race gifted school_type
	regress reading_sat reading_rank rrgap_over i_rover  family_income race gifted school_type
	
	
	
	regress reading_sat reading_rank rrgap_under sex i_ru 
	regress reading_sat reading_rank rrgap_over sex i_rover
	
	regress math_sat app_prob_rank mathgap_under sex i_mu 
	regress math_sat app_prob_rank mathgap_over sex i_mover
	
	regress total_sat reading_sat reading_rank rrgap_under sex 
	regress total_sat 
	
	
	/*
	
	mean sex [pweight = ER34651]
	
	graph twoway line meanscore how_good_at_math, sort ///
		ytitle("Mean Percentile Rank") ///
		xtitle("Absolute Math Self-Report") ///
		title("Mean Math Percentile Rank by Absolute Math Self-Report")
	
	collapse (mean) mean_testscore = app_prob_rank (sd) sd_testscore = app_prob_rank, by(how_good_at_math)
	
	twoway (scatter mean_testscore how_good_at_math, msize(vsmall) mcolor(gs12)) ///
       (rcap mean_testscore+sd_testscore mean_testscore-sd_testscore bucket, clwidth(thin)) ///
       (lfit app_prob_rank how_good_at_math, lcolor(black)),
       legend(order(1 "Mean Percentile Rank" 2 "Error Bars" 3 "Linear Fit")) ///
       ytitle("Mean Percentile Rank") xtitle("Absolute Math Self-Report") ///
       title("Math Percentile Rank by Absolute Math Self-Report")


	
	/*
	histogram app_prob_rank
	
	gen scaled_math_comp = math_compared * 100/7
	gen pure_gap = scaled_math_comp - app_prob_rank
	histogram pure_gap
	histogram scaled_math_comp
	regress app_prob_rank_07 pure_gap app_prob_rank if pure_gap < 0 [pweight = ER34651] 
	regress app_prob_rank_07 app_prob_rank [pweight = ER34651]
	
	
	regress wages sex
	gen log_wages = log(wages)
	regress log_wages sex
	
	
	
	regress log_wages 
	
	
	/*
	
	
	gen underconfidence_math = 0
	* underconfidence = 0
	replace underconfidence_math = 1 if (app_prob_rank > 75) & (math_compared >= 1 & math_compared <= 4)
	replace underconfidence_math = 1 if (app_prob_rank > 50) & (math_compared >= 1 & math_compared <= 3)
	
	gen underconfidence_math_i = underconfidence_math * sex
	
	regress app_prob_rank_07 underconfidence_math app_prob_rank if sex == 1
	regress app_prob_rank_07 underconfidence_math app_prob_rank if sex == 2
	
	regress app_prob_rank_07 pure_gap app_prob_rank if sex == 1 & pure_gap > 20
	
	
	gen scaled_reading_comp = reading_compared * 100/7
	gen pure_gap_reading = scaled_reading_comp - reading_rank
	histogram pure_gap_reading
	histogram scaled_math_comp
	gen reading_rank_sex = pure_gap_reading * sex
	regress reading_rank_07 pure_gap_reading reading_rank sex if sex == 2 [pweight = ER34651]
	regress reading_rank_07 reading_rank [pweight = ER34651]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	
	
	
	histogram age
	drop if age <= 7 
	* | age >= 12
	
	
/* Take out NA values */
	replace gifted = . if gifted == 9 | gifted == 0
	replace race = . if race == 0 | race > 6
	* replace sex = 0 if sex == 1
	* replace sex = 1 if sex == 2
	replace reading_rank = . if reading_rank == 999
	replace college_gpa = . if college_gpa > 12 | college_gpa == 0
	replace app_prob_rank = . if app_prob_rank == 999
	replace math_sat = . if math_sat < 200 | math_sat > 800
	replace reading_sat = . if reading_sat < 200 | reading_sat > 800
	replace how_good_at_math = . if how_good_at_math < 1 | how_good_at_math > 7
	replace math_compared = . if math_compared < 1 | math_compared > 7
	replace reading_compared = . if reading_compared < 1 | reading_compared > 7
	replace app_prob_rank = . if app_prob_rank < 0 | app_prob_rank > 99
		replace wages = . if wages > 9999997
	replace wages = . if wages == 0
	
	
/* Make new variables */
	drop log_wages
	gen log_wages = ln(wages)
	gen total_sat = math_sat + reading_sat
	
/* Fun little histograms */
	histogram race
	histogram sex
	histogram college_gpa
	histogram app_prob_rank
	histogram wages
	histogram log_wages

	
/* Cute little summaries */
	summarize race, detail
	summarize age
	histogram age
	count if age >= 8 & age <= 12
	tabulate race
	tabulate sex
	tabulate app_prob_rank
	tabulate gifted
	tabulate math_compared
	tabulate reading_compared
	
	
/* Basic regressions to check if everything is working */	
	regress reading_sat reading_rank
	regress math_sat app_prob_rank
	regress math_sat app_prob_rank sex race
	regress wages app_prob_rank
	regress wages sat_math
	regress log_wages sex
	regress wages sex
	regress math_sat sex
	
	histogram math_sat
	
	graph box app_prob_rank, over(math_compared) ///
	 title("Box plot of demonstrated versus perceived comparative ability"),
	 xlabel ("How good at math are you compared to your peers")
	 
	 	graph box app_prob_rank, over(how_good_at_math) ///
	 title("Box plot of demonstrated versus self-assessed ability"),
	 xlabel ("How good at math are you compared to your peers")
	
	
	graph hbox app_prob_rank, over(sex) over(math_compared) asyvars
	
		graph hbox app_prob_rank, over(sex) over(how_good_at_math) asyvars
	
	svyset ER31997 [pweight = ER34651], strata(ER31996)
	
	tabulate ER31996
	tabulate ER31997
	
	
	
	
	* Step 1: Create a frequency count variable using egen
	drop freq_count
egen freq_count = count(ER31996)
tabulate freq_count

* Step 2: Display values of stratum_variable where the frequency count is equal to 1
list ER31996 if freq_count == 1

tabulate ER31996 if _N == 1

drop if ER31996 == 63 | ER31996 == 65 | ER31996 == 71 | ER31996 == 72 | ER31996 == 73 | ER31996 == 77 | ER31996 == 84

svyhist app_prob_rank

histogram app_prob_rank [pweight = ER34651]

which svyhist
	
/* Use sample weights */
	svyset [pweight=CH02PRWT]
	summarize app_prob_rank
	svy: mean app_prob_rank 
	svy: histogram race
	
	
	svy: regress log_wages sex
	tabulate CH02PRWT
	
	gen fweight = CH02PRWT
	histogram app_prob_rank [fweight=fweight]
	svy: histogram app_prob_rank
	
	svyhist app_prob_rank [weight=ER34651], ///
    title("Histogram of Math Score") ///
    xtitle("Applied Problem Score") ytitle("Frequency") 
   *  bins(10)
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

/* Discrete metrics

 In particular, we classify any respondent as under-confident in math if she scored above the 75th percentile nationally and ranked her own ability at 1 to 4, corresponding to the bottom 47 percent of the subjective-ability distribution in our sample, or if she scored above the 50th percentile nationally and ranked herself at 1 to 3, corresponding to the bottom 10 percent of the subjective-ability distribution. We define over- confidence among low-achievers using similar thresholds, but we account for the skewed self- assessment distribution by using stricter cut-offs to identify biased beliefs. In particular, we identify any respondent as over-confident in math if she scored below the 25th percentile nationally and rated her own ability at 6 or 7, corresponding to the top 39 percent of the subjective-ability distribution in our sample, or if she scored below the 50th percentile and rated herself at 7, corresponding to the top 22 percent of the subjective-ability distribution. */
 
 summarize gap1
 
 gen discrete_conf_math = .
 * underconfidence = 0
 replace discrete_conf_math = 0 if (app_prob_rank > 75) & (math_compared >= 1 & math_compared <= 4)
 replace discrete_conf_math = 0 if (app_prob_rank > 50) & (math_compared >= 1 & math_compared <= 3)
 * overconfidence = 1
 replace discrete_conf_math = 1 if (app_prob_rank < 25) & (math_compared == 6 | math_compared == 7)
 replace discrete_conf_math = 1 if (app_prob_rank < 50) & (math_compared == 7)
 
 drop discrete_conf_reading
 gen discrete_conf_reading = .
 * underconfidence = 0
 replace discrete_conf_reading = 0 if (reading_rank > 75) & (reading_compared >= 1 & reading_compared <= 4)
 replace discrete_conf_reading = 0 if (reading_rank > 50) & (reading_compared >= 1 & reading_compared <= 3)
 * overconfidence = 1
 replace discrete_conf_reading = 1 if (reading_rank < 25) & (reading_compared == 6 | reading_compared == 7)
 replace discrete_conf_reading = 1 if (reading_rank < 50) & (reading_compared == 7)
 
 summarize discrete_conf_reading
 summarize reading_rank
 
 bysort sex: summarize discrete_conf_reading, detail
 
// Calculate mean and standard deviation of 'discrete_conf_math' by 'sex'
by sex, sort: egen mean_conf_math = mean(discrete_conf_math)
by sex, sort: egen sd_conf_math = sd(discrete_conf_math)

// Display the results
list

summarize sex if app_prob_rank >= 1 & app_prob_rank <= 99

bysort sex: summarize discrete_conf_math, detail


replace TA170790 = . if TA170790 == 8 | TA170790 == 9 
regress TA170790 gap1

/* New variables 
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
histogram pct_math_compared */

*************************************************
* Regressions
*************************************************	

summarize wages

histogram wages
histogram wages [fw = ER34651]
regress wages sex [pweight = ER34651]

histogram app_prob_rank [pweight = ER34651]

regress wages app_prob_rank [pweight = ER34651]
regress math_sat app_prob_rank sex [pweight = ER34651]

regress total_sat app_prob_rank reading_rank sex discrete_conf_math discrete_conf_reading [pweight = ER34651]


regress log_wages sex [pweight = ER34651]

histogram scaled_math_comp
histogram app_prob_rank
drop scaled_math_comp
drop gap1
summarize scaled_math_comp
summarize app_prob_rank
gen scaled_math_comp = math_compared * 100/7
gen gap1 = scaled_math_comp - app_prob_rank
histogram gap1


gen indicator5 = gap1 * sex
regress math_sat indicator5 app_prob_rank gap1 sex if abs(gap1) > 15 & abs(gap1) < 50 [pweight = ER34651]
regress wages indicator5 app_prob_rank gap1 sex if abs(gap1) > 15 & abs(gap1) < 50 [pweight = ER34651]
 
regress math_sat app_prob_rank gap1 if sex == 1  & abs(gap1) > 15 & abs(gap1) < 50 [pweight = ER34651] 
regress math_sat gap1 app_prob_rank if sex == 2  & abs(gap1) > 15 & abs(gap1) < 50 [pweight = ER34651] 
regress wages app_prob_rank gap1 if sex == 1  & abs(gap1) > 15 & abs(gap1) < 50 [pweight = ER34651] 
regress wages gap1 app_prob_rank if sex == 2  & abs(gap1) > 15 & abs(gap1) < 50 [pweight = ER34651]
regress wages app_prob_rank gap1 if sex == 1 & abs(gap1) > 10 & abs(gap1) < 40 [pweight = ER34651] 
regress wages gap1 app_prob_rank if sex == 0 & abs(gap1) > 10 & abs(gap1) < 40 [pweight = ER34651] 
regress wages app_prob_rank gap1  if sex == 1 [pweight = ER34651] 
regress wages gap1 app_prob_rank if sex == 0 [pweight = ER34651] 




gen indicator = gap1 * sex
gen indicator1 = gap1 * app_prob_rank
regress wages gap1 indicator sex app_prob_rank

regress log_wages sex
regress wages sex

replace wages = . if wages >= 9999998


regress log_wages sex discrete_conf_math discrete_conf_reading reading_rank app_prob_rank

regress log_wages discrete_conf_math
regress wages discrete_conf_math i.discrete_conf_math#sex app_prob_rank sex



drop underconfidence_math
 gen underconfidence_math = 0
 * underconfidence = 0
 replace underconfidence_math = 1 if (app_prob_rank > 75) & (math_compared >= 1 & math_compared <= 4)
 replace underconfidence_math = 1 if (app_prob_rank > 50) & (math_compared >= 1 & math_compared <= 3)
 
 * gen indicator3 = unconfidence_math * sex

 regress wages underconfidence_math i.underconfidence_math#sex app_prob_rank sex
 
 regress math_sat underconfidence_math i.underconfidence_math#sex app_prob_rank sex
 
 gen overconfidence_math = 0
 
 replace overconfidence_math = 1 if (app_prob_rank < 25) & (math_compared == 6 | math_compared == 7)
 replace overconfidence_math = 1 if (app_prob_rank < 50) & (math_compared == 7)

 regress log_wages overconfidence_math i.overconfidence_math#sex app_prob_rank sex
 
 
regress math_sat overconfidence_math i.overconfidence_math#sex app_prob_rank sex
 
 
 regress math_sat underconfidence_math if sex == 1
 
 
 
 
 
 summarize sex
 summarize wages
histogram wages
histogram log_wages
reg log_income sex
reg log_income gap1
summarize sex
drop new_i
drop new_i2
gen new_i = gap1 * sex
gen new_i2 = sex * app_prob_rank
reg log_wages sex gap1 app_prob_rank new_i new_i2

summarize log_earn_13
histogram log_earn_13
reg log_earn_13 sex 

summarize sat_math
reg satmath sex
histogram sat_math



/* unaccurate */
drop unaccurate
 gen unaccurate = 0
 * underconfidence = 0
 replace unaccurate = 1 if (app_prob_rank > 75) & (math_compared >= 1 & math_compared <= 4)
 replace unaccurate = 1 if (app_prob_rank > 50) & (math_compared >= 1 & math_compared <= 3)
 * overconfidence = 1
 replace unaccurate = 1 if (app_prob_rank < 25) & (math_compared == 6 | math_compared == 7)
 replace unaccurate = 1 if (app_prob_rank < 50) & (math_compared == 7)
 
 drop unaccurate
 gen unaccurate = 0
 replace unaccurate = 1 if abs(gap1) > 15 & abs(gap1) < 50
 
 regress wages unaccurate sex app_prob_rank
 regress math_sat unaccurate sex app_prob_rank
 
 replace TA171828 = . if TA171828 == 8 | TA171828 == 9 
 regress TA171828 gap1 app_prob_rank if abs(gap1) > 15 [pweight = ER34651]
 histogram TA171828
 [pweight = ER34651]
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
	
