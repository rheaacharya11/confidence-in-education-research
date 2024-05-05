#delimit ;
*  PSID DATA CENTER *****************************************************
   JOBID            : 333750                            
   DATA_DOMAIN      : TAi                               
   USER_WHERE       : NULL                              
   FILE_TYPE        : CDS Kids Only                     
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : do                                
   CODEBOOK_TYPE    : PDF                               
   N_OF_VARIABLES   : 124                               
   N_OF_OBSERVATIONS: 4138                              
   MAX_REC_LENGTH   : 210                               
   DATE & TIME      : May 5, 2024 @ 12:13:32
*************************************************************************
;

infix
      KIDS                 1 - 1           TAS                  2 - 2           KID02                3 - 5     
      TAS17                6 - 6           ER30000              7 - 7           ER30001              8 - 11    
      ER30002             12 - 14          ER31996             15 - 16          ER31997             17 - 17    
      ER32000             18 - 18          ER33601             19 - 22          ER33602             23 - 24    
      ER33603             25 - 26          CHREL               27 - 27          Q21B14              28 - 28    
      Q21B16              29 - 29          Q21K17              30 - 30          CHLDREL             31 - 31    
      Q23E1               32 - 32          Q23E2               33 - 33          Q23E3               34 - 34    
      Q23E10              35 - 35          Q23E11              36 - 36          Q23E12              37 - 37    
      Q23E13              38 - 38          Q23E20              39 - 39          Q23J1               40 - 41    
      Q23K27              42 - 42          Q23K29              43 - 43          Q23K30              44 - 44    
      Q23K31              45 - 45          MATH02              46 - 49          READ02              50 - 53    
      EMSREL              54 - 54          Q29A9               55 - 55          Q29A10              56 - 56    
      Q29A11              57 - 57          ASMREL              58 - 58          Q24BRSS             59 - 61    
      Q24APRAW            62 - 63          Q24APSS             64 - 66          Q24BRPR             67 - 69    
      Q24BRW              70 - 72          Q24APPR             73 - 75          Q24APW              76 - 78    
      ER66001             79 - 79          ER71570             80 - 86          ER34501             87 - 91    
      ER34502             92 - 93          ER34503             94 - 95     long ER34651             96 - 100   
      TA170001           101 - 101         TA170002           102 - 106         TA170003           107 - 111   
      TA170004           112 - 113         TA170015           114 - 114         TA170016           115 - 115   
      TA170036           116 - 116         TA170037           117 - 117         TA170075           118 - 118   
      TA170076           119 - 119         TA170077           120 - 120         TA170080           121 - 121   
      TA170089           122 - 122         TA170090           123 - 123         TA170091           124 - 124   
      TA170092           125 - 125         TA170093           126 - 126         TA170204           127 - 130   
      TA170205           131 - 134         TA170389           135 - 135         TA170456           136 - 138   
 long TA170462           139 - 145         TA170463           146 - 146         TA170777           147 - 147   
      TA170779           148 - 148         TA170781           149 - 149         TA170785           150 - 150   
      TA170787           151 - 153         TA170788           154 - 156         TA170789           157 - 158   
      TA170790           159 - 159         TA170791           160 - 160         TA170792           161 - 162   
      TA170802           163 - 165         TA170808           166 - 167         TA170814           168 - 172   
      TA170905           173 - 173         TA170907           174 - 174         TA170908           175 - 175   
      TA170909           176 - 176         TA170910           177 - 177         TA170911           178 - 178   
      TA170912           179 - 179         TA170913           180 - 180         TA170914           181 - 181   
      TA170915           182 - 182         TA170916           183 - 183         TA170917           184 - 184   
      TA171688           185 - 185         TA171715           186 - 186         TA171828           187 - 187   
      TA171836           188 - 188         TA171841           189 - 189         TA171846           190 - 190   
      TA171854           191 - 191         TA171862           192 - 192         TA171870           193 - 193   
      TA171878           194 - 194         TA171886           195 - 195         TA171894           196 - 196   
      TA171899           197 - 197         TA171921           198 - 198         TA171922           199 - 199   
      TA171923           200 - 200         TA171924           201 - 201         TA171925           202 - 202   
      TA171926           203 - 203         TA171927           204 - 204         TA171928           205 - 205   
      TA171932           206 - 206         TA171935           207 - 207         TA171936           208 - 208   
      TA171990           209 - 210   
using [path]\J333750.txt, clear 
;
label variable KIDS            "Sum of All KID Flags"                     ;
label variable TAS             "Sum of All TAS Flags"                     ;
label variable KID02           "KID2002 = 1 if exists, else missing"      ;
label variable TAS17           "TAS2017 = 1 if exists, else missing"      ;
label variable ER30000         "RELEASE NUMBER"                           ;
label variable ER30001         "1968 INTERVIEW NUMBER"                    ;
label variable ER30002         "PERSON NUMBER                         68" ;
label variable ER31996         "SAMPLING ERROR STRATUM"                   ;
label variable ER31997         "SAMPLING ERROR CLUSTER"                   ;
label variable ER32000         "SEX OF INDIVIDUAL"                        ;
label variable ER33601         "2001 INTERVIEW NUMBER"                    ;
label variable ER33602         "SEQUENCE NUMBER                       01" ;
label variable ER33603         "RELATION TO HEAD                      01" ;
label variable CHREL           "PCG CHILD FILE RELEASE NUMBER 02"         ;
label variable Q21B14          "TYPE ATTEND 02"                           ;
label variable Q21B16          "EVER IN GIFTED PROG 02"                   ;
label variable Q21K17          "DEMONSTRATE ACHIEVEMENT 02"               ;
label variable CHLDREL         "CHILD FILE RELEASE NUMBER 02"             ;
label variable Q23E1           "MATH SKILL GEN RATE 02"                   ;
label variable Q23E2           "MATH SKILL IN CONTEXT PEERS 02"           ;
label variable Q23E3           "MATH COMPARED T0 OTH SKILLS 02"           ;
label variable Q23E10          "HOW MUCH LIKE MATH 02"                    ;
label variable Q23E11          "READING SKILL GEN RATE 02"                ;
label variable Q23E12          "READING SKILL IN CONTEXT PEERS 02"        ;
label variable Q23E13          "READING COMPARED T0 OTH SKILLS 02"        ;
label variable Q23E20          "HOW MUCH LIKE READING 02"                 ;
label variable Q23J1           "RACE/ETHNICITY 02"                        ;
label variable Q23K27          "PROUD 02"                                 ;
label variable Q23K29          "GOOD THINGS ABOUT ME 02"                  ;
label variable Q23K30          "GOOD AS OTHERS 02"                        ;
label variable Q23K31          "OTHERS THINK I AM GOOD 02"                ;
label variable MATH02          "ABILITY SELF CONCEPTS MATH 02"            ;
label variable READ02          "ABILITY SELF CONCEPTS READING 02"         ;
label variable EMSREL          "EMSTEACH FILE RELEASE NUMBER 02"          ;
label variable Q29A9           "READING ABILITY 02"                       ;
label variable Q29A10          "MATH ABILITY 02"                          ;
label variable Q29A11          "GIFTED/TALENTED PROGRAM 02"               ;
label variable ASMREL          "ASSESSMENT FILE RELEASE NUMBER 02"        ;
label variable Q24BRSS         "BROAD READING SCORE 02"                   ;
label variable Q24APRAW        "APPLIED PROB RAW SCORE 02"                ;
label variable Q24APSS         "APPLIED PROB STD SCORE 02"                ;
label variable Q24BRPR         "BROAD READING PERCENTILE RANK 02"         ;
label variable Q24BRW          "BROAD READING W SCORE 02"                 ;
label variable Q24APPR         "APPLIED PROB PERCENTILE RANK 02"          ;
label variable Q24APW          "APPLIED PROB W SCORE 02"                  ;
label variable ER66001         "RELEASE NUMBER"                           ;
label variable ER71570         "2017 CORE/IMMIGRANT FAM WEIGHT NUMBER 1"  ;
label variable ER34501         "2017 INTERVIEW NUMBER"                    ;
label variable ER34502         "SEQUENCE NUMBER                       17" ;
label variable ER34503         "RELATION TO REFERENCE PERSON          17" ;
label variable ER34651         "CORE/IMM INDIVIDUAL CROSS-SECTION WT  17" ;
label variable TA170001        "RELEASE NUMBER"                           ;
label variable TA170002        "2017 TAS INTERVIEW (ID) NUMBER"           ;
label variable TA170003        "2017 PSID FAMILY IW (ID) NUMBER"          ;
label variable TA170004        "2017 INDIVIDUAL SEQUENCE NUMBER"          ;
label variable TA170015        "A1 HOW SATISFIED W/ LIFE AS A WHOLE"      ;
label variable TA170016        "A2 WTR INVOLVED IN ARTS"                  ;
label variable TA170036        "A16A HOW OFTEN WATCHED OR READ NEWS"      ;
label variable TA170037        "A16B HOW OFTEN READ FOR PLEASURE"         ;
label variable TA170075        "B18L FREQ OF FEELING CHALLENGED TO GROW"  ;
label variable TA170076        "B18M FREQ FEELING CONFIDENT OWN IDEAS"    ;
label variable TA170077        "B18N FREQ OF FEELING LIKED PERSONALITY"   ;
label variable TA170080        "B26B HOW OFTEN FEEL SHY"                  ;
label variable TA170089        "B27G SATISFIED WITH SELF"                 ;
label variable TA170090        "B27H WISH HAD MORE RESPECT FOR SELF"      ;
label variable TA170091        "B27J FEEL USELESS AT TIMES"               ;
label variable TA170092        "B27K THINK SELF NO GOOD AT ALL"           ;
label variable TA170093        "C1 CURRENT MARITAL STATUS"                ;
label variable TA170204        "D26 MAIN OCC (2010 CODE)--JOB 1"          ;
label variable TA170205        "D27 MAIN IND (2012 CODE)--JOB 1"          ;
label variable TA170389        "D85 WTR LOOKING FOR JOB"                  ;
label variable TA170456        "D119 LEISURE HOURS"                       ;
label variable TA170462        "E2A AMT OF WAGES/SALARY"                  ;
label variable TA170463        "ACCURACY OF WAGES/SALARY"                 ;
label variable TA170777        "G2 DEGREE ASPIRATION"                     ;
label variable TA170779        "G4 DEGREE EXPECTATION"                    ;
label variable TA170781        "G6 WTR GRADUATED HIGH SCHOOL"             ;
label variable TA170785        "G10 WTR TOOK SAT/ACT"                     ;
label variable TA170787        "G12 SAT SCORE IN CRITICAL READING"        ;
label variable TA170788        "G13 SAT SCORE IN MATH"                    ;
label variable TA170789        "G14 COMPOSITE OR TOTAL ACT SCORE"         ;
label variable TA170790        "G15 WTR ATTENDING OR HAS ATTENDED COLL"   ;
label variable TA170791        "G16 WTR FULL OR PART TIME STUDENT"        ;
label variable TA170792        "G17 REASON NOT IN COLLEGE - MENTION 1"    ;
label variable TA170802        "G18H 1ST MAJOR AT COLLEGE--COLLEGE #1"    ;
label variable TA170808        "G18P DEGREE RECEIVED--COLLEGE #1"         ;
label variable TA170814        "G18Y GRADE POINT AVERAGE--COLLEGE #1"     ;
label variable TA170905        "H12 WTR EVER HAD EMOTIONAL/PSYCH PROBS"   ;
label variable TA170907        "H12B WTR DEPRESSION"                      ;
label variable TA170908        "H12B WTR BIPOLAR DISORDER"                ;
label variable TA170909        "H12B WTR SCHIZOPHRENIA"                   ;
label variable TA170910        "H12B WTR ANXIETY"                         ;
label variable TA170911        "H12B WTR PHOBIAS"                         ;
label variable TA170912        "H12B WTR ALCOHOL PROBLEMS"                ;
label variable TA170913        "H12B WTR OTHER DRUG PROBLEMS"             ;
label variable TA170914        "H12B WTR OBSESSIVE COMPULSIVE DISORDER"   ;
label variable TA170915        "H12B WTR PTSD (POST-TRAUMATIC STRESS)"    ;
label variable TA170916        "H12B WTR ADD/ADHD"                        ;
label variable TA170917        "H12B WTR OTHER EMOTIONAL/PSYCH PROBLEM"   ;
label variable TA171688        "H38 WTR PARENT HAD DRUG PROB- PARENT #1"  ;
label variable TA171715        "H38 WTR PARENT HAD DRUG PROB- PARENT #2"  ;
label variable TA171828        "H107 WTR EVER TAKEN MARIJUANA"            ;
label variable TA171836        "H107 WTR EVER TAKEN COCAINE"              ;
label variable TA171841        "H107 WTR EVER TAKEN HEROIN"               ;
label variable TA171846        "H107 WTR EVER TAKEN PAIN RELIEVERS"       ;
label variable TA171854        "H107 WTR EVER TAKEN DIET PILLS"           ;
label variable TA171862        "H107 WTR EVER TAKEN AMPHETAMINES"         ;
label variable TA171870        "H107 WTR EVER TAKEN STEROIDS"             ;
label variable TA171878        "H107 WTR EVER TAKEN BARBITURATES"         ;
label variable TA171886        "H107 WTR EVER TAKEN TRANQUILIZERS"        ;
label variable TA171894        "H107 WTR EVER TAKEN HALLUCINOGENS"        ;
label variable TA171899        "H107 WTR EVER TAKEN INHALANTS"            ;
label variable TA171921        "K2A PCT OF CLOSE FRIENDS W/JOB NOT COLL"  ;
label variable TA171922        "K2B PCT OF CLOSE FRIENDS IN COLL/GRAD"    ;
label variable TA171923        "K2C PCT OF CLOSE FRIENDS UNEMP & LOOKNG"  ;
label variable TA171924        "K2D PCT OF CLOSE FRIENDS MARRIED, ETC."   ;
label variable TA171925        "K2E PCT OF CLOSE FRIENDS IN VO/TECH PGM"  ;
label variable TA171926        "K2F PCT OF CLOSE FRIENDS W/KIDS"          ;
label variable TA171927        "K2G PCT OF CLOSE FRIENDS WHO GET DRUNK"   ;
label variable TA171928        "K2H PCT OF CLOSE FRIENDS WHO USE DRUGS"   ;
label variable TA171932        "K9A HOW OFTEN DID SOMETHING DANGEROUS"    ;
label variable TA171935        "K9D HOW OFTEN DROVE WHEN DRUNK OR HIGH"   ;
label variable TA171936        "K9E HOW OFTEN RODE WITH DRUNK DRIVER"     ;
label variable TA171990        "HIGHEST EDUCATION LEVEL"                  ;
