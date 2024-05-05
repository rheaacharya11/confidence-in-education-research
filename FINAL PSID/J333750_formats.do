
label define ASMRELL  ///
       1 "Release number 1 - July 2004"  ///
       2 "Release number 2 - January 2005"  ///
       3 "Release number 3 - October 2005"  ///
       4 "Release number 4 - January 2014"  ///
       5 "Release number 5 - May 2019"

label define CHLDRELL  ///
       1 "Release number 1 - July 2004"  ///
       2 "Release number 2 - January 2005"  ///
       3 "Release number 3 - October 2005"  ///
       4 "Release number 4 - June 2010"  ///
       5 "Release number 5 - November 2015"  ///
       6 "Release number 6 - May 2019"

label define CHRELL  ///
       1 "Release number 1 - July 2004"  ///
       2 "Release number 2 - January 2005"  ///
       3 "Release number 3 - March 2006"  ///
       4 "Release number 4 - November 2015"

label define EMSRELL  ///
       1 "Release number 1 - June 2004"  ///
       2 "Release number 2 - May 2013"  ///
       3 "Release number 3 - November 2015"

label define ER30000L  ///
       1 "Release number 1, June 2023"  ///
       2 "Release number 2, March 2024"
forvalues n = 1/32 {
    label define ER31996L `n' "Core sample stratum code"  , modify
}
forvalues n = 33/56 {
    label define ER31996L `n' "Latino sample stratum code"  , modify
}
forvalues n = 57/87 {
    label define ER31996L `n' "Immigrant 97/99  sample stratum code"  , modify
}
forvalues n = 88/94 {
    label define ER31996L `n' "Immigrant 17/19 sample stratum code"  , modify
}

label define ER31997L  ///
       1 "Unit number 1"  ///
       2 "Unit number 2"

label define ER32000L  ///
       1 "Male"  ///
       2 "Female"  ///
       9 "NA"
forvalues n = 1/20 {
    label define ER33602L `n' "Individuals in the family at the time of the 2001 interview"  , modify
}
forvalues n = 51/59 {
    label define ER33602L `n' "Individuals in institutions at the time of the 2001 interview"  , modify
}
forvalues n = 71/80 {
    label define ER33602L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 1999 and 2001 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER33602L `n' "Individuals who were living in 1999 but died by the time of the 2001 interview"  , modify
}
label define ER33602L        0 "Inap.:  born or moved in after the 2001 interview; from Latino sample (ER30001=7001-9308); from Immigrant 2017 sample (ER30001=4001-4851); main family nonresponse by 2001 or mover-out nonresponse by 1999 (ER33601=0)"  , modify

label define ER33603L  ///
      10 "Head in 2001; 1999 Head who was mover-out nonresponse by the time of the 2001 interview"  ///
      20 "Legal Wife in 2001; 1999 Wife who was mover-out nonresponse by the time of the 2001 interview"  ///
      22 `""Wife"--female cohabitor who has lived with Head for 12 months or more; 1999 "Wife" who was mover-out nonresponse by the time of the 2001 interview"'  ///
      30 "Son or daughter of Head (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Head (children of legal Wife (code 20) who are not children of Head)"  ///
      35 `"Son or daughter of "Wife" but not Head (includes only those children of mothers whose relationship to Head is 22 but who are not children of Head)"'  ///
      37 "Son-in-law or daughter-in-law of Head (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Head (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Head; i.e., brother or sister of legal Wife, or spouse of Head`=char(146)'s brother or sister."  ///
      48 "Brother or sister of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Head (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Head (includes parents of legal wives (code 20) only)"  ///
      58 "Father or mother of Head`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Head (includes grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Head (includes great-grandchildren of legal Wife (code 20), but those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Head (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Wife (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Head"  ///
      69 "Great-grandfather or great-grandmother of legal Wife (code 20)"  ///
      70 "Nephew or niece of Head"  ///
      71 "Nephew or niece of legal Wife (code 20)"  ///
      72 "Uncle or Aunt of Head"  ///
      73 "Uncle or Aunt of legal Wife (code 20)"  ///
      74 "Cousin of Head"  ///
      75 "Cousin of legal Wife (code 20)"  ///
      83 "Children of first-year cohabitor but not of Head (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Head"  ///
      90 "Legal husband of Head"  ///
      95 "Other relative of Head"  ///
      96 "Other relative of legal Wife (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes homosexual partners, friends of children of the FU, etc.)"  ///
       0 "Inap.:  from Latino sample (ER30001=7001-9308); from Immigrant 2017 sample (ER30001=4001-4851); main family nonresponse by 2001 or mover-out nonresponse by 1999 (ER33601=0); born or moved in after the 2001 interview (ER33601>0 and ER33602=0)"
forvalues n = 1/20 {
    label define ER34502L `n' "Individuals in the family at the time of the 2017 interview"  , modify
}
forvalues n = 51/59 {
    label define ER34502L `n' "Individuals in institutions at the time of the 2017 interview"  , modify
}
forvalues n = 71/80 {
    label define ER34502L `n' "Individuals who moved out of the FU or out of institutions and established their own households between the 2015 and 2017 interviews"  , modify
}
forvalues n = 81/89 {
    label define ER34502L `n' "Individuals who were living in 2015 but died by the time of the 2017 interview"  , modify
}
label define ER34502L        0 "Inap.:  from Immigrant 17 recontact sample (ER30001=4700-4851) or Multiplicity sample (ER30001=4001-4462 and ER32052=2019); from Latino sample (ER30001=7001-9308); main family nonresponse by 2017 or mover-out nonresponse by 2015 (ER34501=0)"  , modify

label define ER34503L  ///
      10 "Reference Person in 2017; 2015 Reference Person who was mover-out nonresponse by the time of the 2017 interview"  ///
      20 "Legal Spouse in 2017; 2015 Spouse who was mover-out nonresponse by the time of the 2017 interview"  ///
      22 "Partner--cohabitor who has lived with Reference Person for 12 months or more; 2015 Partner who was mover-out nonresponse by the time of the 2017 interview"  ///
      30 "Son or daughter of Reference Person (includes adopted children but not stepchildren)"  ///
      33 "Stepson or stepdaughter of Reference Person (children of legal Spouse [code 20] who are not children of Reference Person)"  ///
      35 "Son or daughter of Partner but not Reference Person (includes only those children of mothers whose relationship to Reference Person is 22 but who are not children of Reference Person)"  ///
      37 "Son-in-law or daughter-in-law of Reference Person (includes stepchildren-in-law)"  ///
      38 "Foster son or foster daughter, not legally adopted"  ///
      40 "Brother or sister of Reference Person (includes step and half sisters and brothers)"  ///
      47 "Brother-in-law or sister-in-law of Reference Person (i.e., brother or sister of legal Spouse; spouse of HD`=char(146)'s brother or sister; spouse of legal Spouse`=char(146)'s brother or sister)"  ///
      48 "Brother or sister of Reference Person`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      50 "Father or mother of Reference Person (includes stepparents)"  ///
      57 "Father-in-law or mother-in-law of Reference Person (includes parents of legal spouses [code 20] only)"  ///
      58 "Father or mother of Reference Person`=char(146)'s cohabitor (the cohabitor is coded 22 or 88)"  ///
      60 "Grandson or granddaughter of Reference Person (includes grandchildren of legal Spouse [code 20] only; those of a cohabitor are coded 97)"  ///
      65 "Great-grandson or great-granddaughter of Reference Person (includes great-grandchildren of legal Spouse [code 20]; those of a cohabitor are coded 97)"  ///
      66 "Grandfather or grandmother of Reference Person (includes stepgrandparents)"  ///
      67 "Grandfather or grandmother of legal Spouse (code 20)"  ///
      68 "Great-grandfather or great-grandmother of Reference Person"  ///
      69 "Great-grandfather or great-grandmother of legal Spouse (code 20)"  ///
      70 "Nephew or niece of Reference Person"  ///
      71 "Nephew or niece of legal Spouse (code 20)"  ///
      72 "Uncle or Aunt of Reference Person"  ///
      73 "Uncle or Aunt of legal Spouse (code 20)"  ///
      74 "Cousin of Reference Person"  ///
      75 "Cousin of legal Spouse (code 20)"  ///
      83 "Children of first-year cohabitor but not of Reference Person (the parent of this child is coded 88)"  ///
      88 "First-year cohabitor of Reference Person"  ///
      90 "Uncooperative legal spouse of Reference Person (this individual is unable or unwilling to be designated as Reference Person or Spouse)"  ///
      92 "Uncooperative partner of Reference Person (this individual is unable or unwilling to be designated as Partner)"  ///
      95 "Other relative of Reference Person"  ///
      96 "Other relative of legal Spouse (code 20)"  ///
      97 "Other relative of cohabitor (the cohabitor is code 22 or 88)"  ///
      98 "Other nonrelatives (includes friends of children of the FU, boyfriend/girlfriend of son/daughter, et al.)"  ///
       0 "Inap.:  from Immigrant 17 recontact sample (ER30001=4700-4851) or Multiplicity sample (ER30001=4001-4462 and ER32052=2019); from Latino sample (ER30001=7001-9308); main family nonresponse by 2017 or mover-out nonresponse by 2015 (ER34502=0)"

label define ER66001L  ///
       1 "Release number 1, February 2019"  ///
       2 "Release number 2, August 2019"  ///
       3 "Release number 3, June 2023"

label define Q21B14L  ///
       1 "Private/religious school"  ///
       2 "Private/non-religious school"  ///
       3 "Both"  ///
       7 "Other - Specify"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.: if Q21B13=0,5,8,9"

label define Q21B16L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.: if (Q21B4=5 and Q21IwAge<7)"

label define Q21K17L  ///
       1 "Never"  ///
       2 "Once"  ///
       3 "2-3 times"  ///
       4 "4 or more times"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.: if Q21K6=5,8,9"
forvalues n = 1/7 {
    label define Q23E1L `n' "Not at all good (1) - OK (4) - very good (7)"  , modify
}
label define Q23E1L        8 "DK"  , modify
label define Q23E1L        9 "NA; refused"  , modify
forvalues n = 1/7 {
    label define Q23E10L `n' "Not at all (1) - somewhat (4) - very much (7)"  , modify
}
label define Q23E10L        8 "DK"  , modify
label define Q23E10L        9 "NA; refused"  , modify
forvalues n = 1/7 {
    label define Q23E11L `n' "Not at all good (1) - OK (4) - very good (7)"  , modify
}
label define Q23E11L        8 "DK"  , modify
label define Q23E11L        9 "NA; refused"  , modify
forvalues n = 1/7 {
    label define Q23E12L `n' "One of the worst (1) - in the middle (4) - the best (7)"  , modify
}
label define Q23E12L        8 "DK"  , modify
label define Q23E12L        9 "NA; refused"  , modify
forvalues n = 1/7 {
    label define Q23E13L `n' "A lot worse (1) - about the same (4) - a lot better (7)"  , modify
}
label define Q23E13L        8 "DK"  , modify
label define Q23E13L        9 "NA; refused"  , modify
forvalues n = 1/7 {
    label define Q23E2L `n' "One of the worst (1) - in the middle (4) - the best (7)"  , modify
}
label define Q23E2L        8 "DK"  , modify
label define Q23E2L        9 "NA; refused"  , modify
forvalues n = 1/7 {
    label define Q23E20L `n' "Not at all (1) - somewhat (4) - very much (7)"  , modify
}
label define Q23E20L        8 "DK"  , modify
label define Q23E20L        9 "NA; refused"  , modify
forvalues n = 1/7 {
    label define Q23E3L `n' "A lot worse in math than in other subjects (1) - about the same (4) - a lot better in math than in other subjects (7)"  , modify
}
label define Q23E3L        8 "DK"  , modify
label define Q23E3L        9 "NA; refused"  , modify

label define Q23J1L  ///
       1 "African American"  ///
       2 "White"  ///
       3 "Hispanic"  ///
       4 "Asian/Pacific Islander"  ///
       5 "American Indian or Alaskan Native"  ///
       6 "Multi-Racial"  ///
      98 "DK"  ///
      99 "NA; refused"  ///
       0 "Inap.: if not eligible for Section J (Age=8-11 yrs old)"

label define Q23K27L  ///
       1 "Never"  ///
       2 "Rarely"  ///
       3 "Sometimes"  ///
       4 "Most of the time"  ///
       5 "Always"  ///
       9 "NA"  ///
       0 "Inap.: if not eligible for ACASI Section K (Age=8-9 yrs old)"

label define Q23K29L  ///
       1 "Never"  ///
       2 "Rarely"  ///
       3 "Sometimes"  ///
       4 "Most of the time"  ///
       5 "Always"  ///
       9 "NA"  ///
       0 "Inap.: if not eligible for ACASI Section K (Age=8-9 yrs old)"

label define Q23K30L  ///
       1 "Never"  ///
       2 "Rarely"  ///
       3 "Sometimes"  ///
       4 "Most of the time"  ///
       5 "Always"  ///
       9 "NA"  ///
       0 "Inap.: if not eligible for ACASI Section K (Age=8-9 yrs old)"

label define Q23K31L  ///
       1 "Never"  ///
       2 "Rarely"  ///
       3 "Sometimes"  ///
       4 "Most of the time"  ///
       5 "Always"  ///
       9 "NA"  ///
       0 "Inap.: if not eligible for ACASI Section K (Age=8-9 yrs old)"
forvalues n = 0/60 {
    label define Q24APRAWL `n' "Actual score"  , modify
}
label define Q24APRAWL       99 "NA (Not ascertained); Applied Problems not administered"  , modify

label define Q29A10L  ///
       1 "Above average"  ///
       2 "Average"  ///
       3 "Below average"  ///
       8 "DK"  ///
       9 "NA; refused"

label define Q29A11L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.: School does not have gifted/talented program"

label define Q29A9L  ///
       1 "Above average"  ///
       2 "Average"  ///
       3 "Below average"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170001L  ///
       1 "Release number 1, August 2019"  ///
       2 "Release number 2, May 2020"
forvalues n = 1/20 {
    label define TA170004L `n' "Individuals in the family at the time of the 2017 PSID interview"  , modify
}
forvalues n = 51/59 {
    label define TA170004L `n' "Individuals in institutions at the time of the 2017 PSID interview"  , modify
}

label define TA170015L  ///
       1 "Completely satisfied"  ///
       2 "Very satisfied"  ///
       3 "Somewhat satisfied"  ///
       4 "Not very satisfied"  ///
       5 "Not at all satisfied"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170016L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170036L  ///
       1 "Less than once a month"  ///
       2 "At least once a month"  ///
       3 "Once a week"  ///
       4 "Several times a week"  ///
       5 "Almost every day"  ///
       6 "Every day"  ///
       7 "IF VOL.:  Never"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170037L  ///
       1 "Less than once a month"  ///
       2 "At least once a month"  ///
       3 "Once a week"  ///
       4 "Several times a week"  ///
       5 "Almost every day"  ///
       6 "Every day"  ///
       7 "IF VOL.:  Never"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170075L  ///
       1 "Never"  ///
       2 "Once or twice"  ///
       3 "About once a week"  ///
       4 "Two or three times a week"  ///
       5 "Almost every day"  ///
       6 "Every day"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170076L  ///
       1 "Never"  ///
       2 "Once or twice"  ///
       3 "About once a week"  ///
       4 "Two or three times a week"  ///
       5 "Almost every day"  ///
       6 "Every day"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170077L  ///
       1 "Never"  ///
       2 "Once or twice"  ///
       3 "About once a week"  ///
       4 "Two or three times a week"  ///
       5 "Almost every day"  ///
       6 "Every day"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170080L  ///
       1 "Never"  ///
       2 "Rarely"  ///
       3 "Sometimes"  ///
       4 "Often"  ///
       5 "Almost always or always"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170089L  ///
       1 "Strongly disagree"  ///
       2 "Disagree"  ///
       3 "Agree"  ///
       4 "Strongly agree"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170090L  ///
       1 "Strongly disagree"  ///
       2 "Disagree"  ///
       3 "Agree"  ///
       4 "Strongly agree"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170091L  ///
       1 "Strongly disagree"  ///
       2 "Disagree"  ///
       3 "Agree"  ///
       4 "Strongly agree"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170092L  ///
       1 "Strongly disagree"  ///
       2 "Disagree"  ///
       3 "Agree"  ///
       4 "Strongly agree"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170093L  ///
       1 "Married"  ///
       2 "Never married"  ///
       3 "Widowed"  ///
       4 "Divorced"  ///
       5 "Separated"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170389L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170463L  ///
       1 "Value imputed by PSID staff"  ///
       0 "Inap.:  not imputed; did not earn wages or salaries in 2016 (TA170461=5); DK, NA, or RF whether earned wages or salaries in 2016 (TA170461=8 or 9); DK, NA, or RF wages and salaries in 2016 (TA170462=9999998 or 9999999)"

label define TA170777L  ///
       1 "Master`=char(146)'s degree (M.A. or M.S.)"  ///
       2 "Doctorate of Philosophy (Ph.D.)"  ///
       3 "Medical Doctorate (M.D.)"  ///
       4 "Law Degree (J.D.)"  ///
       7 "Another degree"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  does not want to get more than four years of college or has gone as far as wants to in school (TA170776=1-5 or 7-8); DK, NA, or RF how far would like to go in school (TA170776=98 or 99)"

label define TA170779L  ///
       1 "Master`=char(146)'s degree (M.A. or M.S.)"  ///
       2 "Doctorate of Philosophy (Ph.D.)"  ///
       3 "Medical Doctorate (M.D.)"  ///
       4 "Law Degree (J.D.)"  ///
       7 "Another degree"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  has gone as far as wants to in school (TA170776=8); does not think will get more than 4 years of college (TA170778=1-5 or 7); DK, NA, or RF how far would actually go in school (TA170778=98 or 99)"

label define TA170781L  ///
       1 "Graduated from high school"  ///
       2 "Got a GED"  ///
       3 "Neither"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  education level reported during the 2017 PSID interview; highest grade completed was less than twelfth grade (TA170780=1-11)"

label define TA170785L  ///
       1 "SAT only"  ///
       2 "ACT only"  ///
       3 "Both"  ///
       5 "IF VOL.:  Neither"  ///
       8 "DK"  ///
       9 "NA; refused"
forvalues n = 1/36 {
    label define TA170789L `n' "Actual score"  , modify
}
label define TA170789L       95 "IF VOL.: have not received score yet"  , modify
label define TA170789L       98 "DK"  , modify
label define TA170789L       99 "NA; refused"  , modify
label define TA170789L        0 "Inap.:  did not take ACT (TA170785=1 or 5); DK, NA, or RF whether took SAT/ACT (TA170785=8 or 9)"  , modify

label define TA170790L  ///
       1 "Yes, currently attending college"  ///
       3 "No, not currently attending college but have attended in the past"  ///
       5 "No, never attended college"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170791L  ///
       1 "Full-time"  ///
       2 "Part-time"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  not currently attending college or has never attended college (TA170790=3 or 5); DK, NA, or RF whether currently attending or ever attended college (TA170790=8 or 9)"

label define TA170792L  ///
       1 "Already graduated from college"  ///
       2 "Enrolled or completed technical/vocational/certificate training"  ///
       3 "Currently in high school"  ///
       4 "Did not finish high school"  ///
       5 "Have completed as much college as wanted/not interested"  ///
       6 "Undecided about future plans/goals; taking a break"  ///
       7 "Plan to attend; in process of applying"  ///
       8 "Financial reasons"  ///
       9 "Employed/needed to work"  ///
      10 "Family commitments"  ///
      11 "Other personal reasons"  ///
      12 "Too busy"  ///
      13 "Difficulties with transportation"  ///
      14 "Does not have a specific reason"  ///
      97 "Other miscellaneous reason(s)"  ///
      98 "DK"  ///
      99 "NA; refused"  ///
       0 "Inap.:  currently attending college (TA170790=1)"

label define TA170808L  ///
       1 "Associate`=char(146)'s Degree"  ///
       2 "Bachelor`=char(146)'s Degree"  ///
       3 "Master`=char(146)'s Degree"  ///
       4 "Doctoral degree"  ///
       5 "Medical Doctorate"  ///
       6 "Law Degree (JD)"  ///
       7 "Other"  ///
      97 "Did not receive degree"  ///
      98 "DK"  ///
      99 "NA; refused"  ///
       0 "Inap.:  in college (TA170795=1); never attended college or DK, NA, or RF whether attended college (TA170795=3)"

label define TA170905L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA170907L  ///
       1 "Diagnosed with depression"  ///
       5 "Never diagnosed with depression"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170908L  ///
       1 "Diagnosed with bipolar disorder (e.g., mania)"  ///
       5 "Never diagnosed with bipolar disorder (e.g., mania)"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170909L  ///
       1 "Diagnosed with schizophrenia (e.g., psychosis)"  ///
       5 "Never diagnosed with schizophrenia (e.g., psychosis)"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170910L  ///
       1 "Diagnosed with anxiety (e.g., panic)"  ///
       5 "Never diagnosed with anxiety (e.g., panic)"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170911L  ///
       1 "Diagnosed with phobias"  ///
       5 "Never diagnosed with phobias"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170912L  ///
       1 "Diagnosed with alcohol abuse/dependence/alcoholism"  ///
       5 "Never diagnosed with alcohol abuse/dependence/alcoholism"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170913L  ///
       1 "Diagnosed with drug abuse/dependence/drug addiction"  ///
       5 "Never diagnosed with drug abuse/dependence/drug addiction"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170914L  ///
       1 "Diagnosed with obsessive compulsive disorder"  ///
       5 "Never diagnosed with obsessive compulsive disorder"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170915L  ///
       1 "Diagnosed with PTSD (Post-Traumatic Stress Disorder)"  ///
       5 "Never diagnosed with PTSD (Post-Traumatic Stress Disorder)"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170916L  ///
       1 "Diagnosed with ADD/ADHD"  ///
       5 "Never diagnosed with ADD/ADHD"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA170917L  ///
       1 "Diagnosed with other emotional or psychiatric disorder"  ///
       5 "Never diagnosed with other emotional or psychiatric disorder"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  never diagnosed with emotional, nervous, or psychiatric problems (TA170905=5); DK, NA, or RF whether ever diagnosed with emotional, nervous, or psychiatric problems (TA170905=8 or 9)"

label define TA171688L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  not raised by anyone (TA171669=3); DK, NA, or RF how many people raised by (TA171669=8 or 9)"

label define TA171715L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  raised by 1 person (TA171669=1); not raised by anyone (TA171669=3); DK, NA, or RF how many people raised by (TA171669=8 or 9)"

label define TA171828L  ///
       1 "Has tried marijuana or hashish"  ///
       5 "Has never tried marijuana or hashish"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171836L  ///
       1 "Has tried cocaine"  ///
       5 "Has never tried cocaine"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171841L  ///
       1 "Has tried heroin"  ///
       5 "Has never tried heroin"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171846L  ///
       1 "Has tried narcotics or pain relievers"  ///
       5 "Has never tried narcotics or pain relievers"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171854L  ///
       1 "Has tried diet pills"  ///
       5 "Has never tried diet pills"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171862L  ///
       1 "Has tried amphetamines"  ///
       5 "Has never tried amphetamines"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171870L  ///
       1 "Has tried steroids"  ///
       5 "Has never tried steroids"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171878L  ///
       1 "Has tried barbiturates"  ///
       5 "Has never tried barbiturates"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171886L  ///
       1 "Has tried tranquilizers"  ///
       5 "Has never tried tranquilizers"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171894L  ///
       1 "Has tried hallucinogens"  ///
       5 "Has never tried hallucinogens"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171899L  ///
       1 "Has tried inhalants"  ///
       5 "Has never tried inhalants"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171921L  ///
       1 "None (0%)"  ///
       2 "A few (25%)"  ///
       3 "About half (50%)"  ///
       4 "Most (75%)"  ///
       5 "All (100%)"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171922L  ///
       1 "None (0%)"  ///
       2 "A few (25%)"  ///
       3 "About half (50%)"  ///
       4 "Most (75%)"  ///
       5 "All (100%)"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171923L  ///
       1 "None (0%)"  ///
       2 "A few (25%)"  ///
       3 "About half (50%)"  ///
       4 "Most (75%)"  ///
       5 "All (100%)"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171924L  ///
       1 "None (0%)"  ///
       2 "A few (25%)"  ///
       3 "About half (50%)"  ///
       4 "Most (75%)"  ///
       5 "All (100%)"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171925L  ///
       1 "None (0%)"  ///
       2 "A few (25%)"  ///
       3 "About half (50%)"  ///
       4 "Most (75%)"  ///
       5 "All (100%)"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171926L  ///
       1 "None (0%)"  ///
       2 "A few (25%)"  ///
       3 "About half (50%)"  ///
       4 "Most (75%)"  ///
       5 "All (100%)"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171927L  ///
       1 "None (0%)"  ///
       2 "A few (25%)"  ///
       3 "About half (50%)"  ///
       4 "Most (75%)"  ///
       5 "All (100%)"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171928L  ///
       1 "None (0%)"  ///
       2 "A few (25%)"  ///
       3 "About half (50%)"  ///
       4 "Most (75%)"  ///
       5 "All (100%)"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171932L  ///
       1 "Never"  ///
       2 "Once"  ///
       3 "2-3 times"  ///
       4 "4-6 times"  ///
       5 "7-10 times"  ///
       6 "11-20 times"  ///
       7 "21 or more times"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171935L  ///
       1 "Never"  ///
       2 "Once"  ///
       3 "2-3 times"  ///
       4 "4-6 times"  ///
       5 "7-10 times"  ///
       6 "11-20 times"  ///
       7 "21 or more times"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171936L  ///
       1 "Never"  ///
       2 "Once"  ///
       3 "2-3 times"  ///
       4 "4-6 times"  ///
       5 "7-10 times"  ///
       6 "11-20 times"  ///
       7 "21 or more times"  ///
       8 "DK"  ///
       9 "NA; refused"

label define TA171990L  ///
       1 "Less than high school diploma"  ///
       2 "GED, no college"  ///
       3 "High school graduate, no college"  ///
       4 "GED plus some college"  ///
       5 "High school graduate plus some college"  ///
       6 "GED plus Associate`=char(146)'s degree"  ///
       7 "High school graduate plus Associate`=char(146)'s degree"  ///
       8 "GED plus Bachelor`=char(146)'s degree"  ///
       9 "High school graduate plus Bachelor`=char(146)'s degree"  ///
      10 "GED plus Master`=char(146)'s degree"  ///
      11 "High school graduate plus Master`=char(146)'s degree"  ///
      12 "GED plus Doctoral degree"  ///
      13 "High school graduate plus Doctoral degree"  ///
      14 "GED plus Medical degree"  ///
      15 "High school graduate plus Medical degree"  ///
      16 "GED plus Law degree"  ///
      17 "High school graduate plus Law degree"  ///
      18 "GED plus other degree"  ///
      19 "High school graduate plus other degree"  ///
      98 "DK"  ///
      99 "NA; refused"

label values ASMREL     ASMRELL
label values CHLDREL    CHLDRELL
label values CHREL      CHRELL
label values EMSREL     EMSRELL
label values ER30000    ER30000L
label values ER31996    ER31996L
label values ER31997    ER31997L
label values ER32000    ER32000L
label values ER33602    ER33602L
label values ER33603    ER33603L
label values ER34502    ER34502L
label values ER34503    ER34503L
label values ER66001    ER66001L
label values Q21B14     Q21B14L
label values Q21B16     Q21B16L
label values Q21K17     Q21K17L
label values Q23E1      Q23E1L
label values Q23E10     Q23E10L
label values Q23E11     Q23E11L
label values Q23E12     Q23E12L
label values Q23E13     Q23E13L
label values Q23E2      Q23E2L
label values Q23E20     Q23E20L
label values Q23E3      Q23E3L
label values Q23J1      Q23J1L
label values Q23K27     Q23K27L
label values Q23K29     Q23K29L
label values Q23K30     Q23K30L
label values Q23K31     Q23K31L
label values Q24APRAW   Q24APRAWL
label values Q29A10     Q29A10L
label values Q29A11     Q29A11L
label values Q29A9      Q29A9L
label values TA170001   TA170001L
label values TA170004   TA170004L
label values TA170015   TA170015L
label values TA170016   TA170016L
label values TA170036   TA170036L
label values TA170037   TA170037L
label values TA170075   TA170075L
label values TA170076   TA170076L
label values TA170077   TA170077L
label values TA170080   TA170080L
label values TA170089   TA170089L
label values TA170090   TA170090L
label values TA170091   TA170091L
label values TA170092   TA170092L
label values TA170093   TA170093L
label values TA170389   TA170389L
label values TA170463   TA170463L
label values TA170777   TA170777L
label values TA170779   TA170779L
label values TA170781   TA170781L
label values TA170785   TA170785L
label values TA170789   TA170789L
label values TA170790   TA170790L
label values TA170791   TA170791L
label values TA170792   TA170792L
label values TA170808   TA170808L
label values TA170905   TA170905L
label values TA170907   TA170907L
label values TA170908   TA170908L
label values TA170909   TA170909L
label values TA170910   TA170910L
label values TA170911   TA170911L
label values TA170912   TA170912L
label values TA170913   TA170913L
label values TA170914   TA170914L
label values TA170915   TA170915L
label values TA170916   TA170916L
label values TA170917   TA170917L
label values TA171688   TA171688L
label values TA171715   TA171715L
label values TA171828   TA171828L
label values TA171836   TA171836L
label values TA171841   TA171841L
label values TA171846   TA171846L
label values TA171854   TA171854L
label values TA171862   TA171862L
label values TA171870   TA171870L
label values TA171878   TA171878L
label values TA171886   TA171886L
label values TA171894   TA171894L
label values TA171899   TA171899L
label values TA171921   TA171921L
label values TA171922   TA171922L
label values TA171923   TA171923L
label values TA171924   TA171924L
label values TA171925   TA171925L
label values TA171926   TA171926L
label values TA171927   TA171927L
label values TA171928   TA171928L
label values TA171932   TA171932L
label values TA171935   TA171935L
label values TA171936   TA171936L
label values TA171990   TA171990L
