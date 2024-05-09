#delimit ;
*  PSID DATA CENTER *****************************************************
   JOBID            : 333825                            
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : do                                
   N_OF_VARIABLES   : 101                               
   N_OF_OBSERVATIONS: 19686                             
   MAX_REC_LENGTH   : 259                               
   DATE & TIME      : May 7, 2024 @ 21:53:04
*************************************************************************
;

infix
      CDSCUMREL            1 - 1           CDSCUMID68           2 - 5           CDSCUMPN             6 - 8     
      CDSTYPE97            9 - 9           CRFID97             10 - 14          CRSN97              15 - 16    
      CDS_HID97           17 - 21          CDS_SN97            22 - 23          ID68PCG97           24 - 27    
      PNPCG97             28 - 30          CRPCGFID97          31 - 35          CRPCGSN97           36 - 37    
      ID68OCG97           38 - 41          PNOCG97             42 - 44          CROCGFID97          45 - 49    
      CROCGSN97           50 - 51          DEMOG_97            52 - 52          PCGHH_97            53 - 53    
      PCGCH_97            54 - 54          CHILD_97            55 - 55          CDSTYPE02           56 - 56    
      CRFID02             57 - 61          CRSN02              62 - 63          CDS_HID02           64 - 68    
      CDS_SN02            69 - 70          ID68PCG02           71 - 74          PNPCG02             75 - 77    
      CRPCGFID02          78 - 82          CRPCGSN02           83 - 84          ID68OCG02           85 - 88    
      PNOCG02             89 - 91          CROCGFID02          92 - 96          CROCGSN02           97 - 98    
      DEMOG_02            99 - 99          PCGHH_02           100 - 100         PCGCH_02           101 - 101   
      CHILD_02           102 - 102         CDSTYPE07          103 - 103         CRFID07            104 - 108   
      CRSN07             109 - 110         CDS_HID07          111 - 115         CDS_SN07           116 - 117   
      ID68PCG07          118 - 121         PNPCG07            122 - 124         CRPCGFID07         125 - 129   
      CRPCGSN07          130 - 131         ID68OCG07          132 - 135         PNOCG07            136 - 138   
      CROCGFID07         139 - 143         CROCGSN07          144 - 145         DEMOG_07           146 - 146   
      PCGHH_07           147 - 147         PCGCH_07           148 - 148         CHILD_07           149 - 149   
      CDSTYPE14          150 - 150         CRFID14            151 - 155         CRSN14             156 - 157   
      CDS_HID14          158 - 162         CDS_SN14           163 - 164         ID68PCG14          165 - 168   
      PNPCG14            169 - 171         CRPCGFID14         172 - 176         CRPCGSN14          177 - 178   
      CDSPCGSN14         179 - 180         PCGHHNO14          181 - 181         DEMOG_14           182 - 182   
      PCGHH_14           183 - 183         PCGCH_14           184 - 184         CHILD_14           185 - 185   
      CDSTYPE19          186 - 186         CRFID19            187 - 191         CRSN19             192 - 193   
      CDS_HID19          194 - 198         CDS_SN19           199 - 200         ID68PCG19          201 - 204   
      PNPCG19            205 - 207         CRPCGFID19         208 - 212         CRPCGSN19          213 - 214   
      CDSPCGSN19         215 - 216         PCGHHNO19          217 - 217         DEMOG_19           218 - 218   
      PCGHH_19           219 - 219         PCGCH_19           220 - 220         CHILD_19           221 - 221   
      PCGHH_20           222 - 222         PCGCH_20           223 - 223         CDSTYPE21          224 - 224   
      CRFID21            225 - 229         CRSN21             230 - 231         CDS_HID21          232 - 236   
      CDS_SN21           237 - 238         ID68PCG21          239 - 242         PNPCG21            243 - 245   
      CRPCGFID21         246 - 250         CRPCGSN21          251 - 252         CDSPCGSN21         253 - 254   
      PCGHHNO21          255 - 255         DEMOG_21           256 - 256         PCGHH_21           257 - 257   
      PCGCH_21           258 - 258         CHILD_21           259 - 259   
using [path]\M333825.txt, clear 
;
label variable CDSCUMREL       "RELEASE NUMBER"                           ;
label variable CDSCUMID68      "1968 INTERVIEW NUMBER"                    ;
label variable CDSCUMPN        "PERSON NUMBER 68"                         ;
label variable CDSTYPE97       "CDS PERSON TYPE                       97" ;
label variable CRFID97         "CORE FAMILY INTERVIEW NUMBER          97" ;
label variable CRSN97          "CORE SEQUENCE NUMBER                  97" ;
label variable CDS_HID97       "CDS HOUSEHOLD INTERVIEW NUMBER        97" ;
label variable CDS_SN97        "CDS SEQUENCE NUMBER                   97" ;
label variable ID68PCG97       "PCG 1968 INTERVIEW NUMBER             97" ;
label variable PNPCG97         "PCG PERSON NUMBER                     97" ;
label variable CRPCGFID97      "PCG CORE FAMILY INTERVIEW NUMBER      97" ;
label variable CRPCGSN97       "PCG CORE SEQUENCE NUMBER              97" ;
label variable ID68OCG97       "OCG 1968 INTERVIEW NUMBER             97" ;
label variable PNOCG97         "OCG PERSON NUMBER                     97" ;
label variable CROCGFID97      "OCG CORE FAMILY INTERVIEW NUMBER      97" ;
label variable CROCGSN97       "OCG CORE SEQUENCE NUMBER              97" ;
label variable DEMOG_97        "CDS DEMOG FILE                        97" ;
label variable PCGHH_97        "CDS PCG HOUSEHOLD FILE                97" ;
label variable PCGCH_97        "CDS PCG CHILD FILE                    97" ;
label variable CHILD_97        "CDS CHILD FILE                        97" ;
label variable CDSTYPE02       "CDS PERSON TYPE                       02" ;
label variable CRFID02         "CORE FAMILY INTERVIEW NUMBER          02" ;
label variable CRSN02          "CORE SEQUENCE NUMBER                  02" ;
label variable CDS_HID02       "CDS HOUSEHOLD INTERVIEW NUMBER        02" ;
label variable CDS_SN02        "CDS SEQUENCE NUMBER                   02" ;
label variable ID68PCG02       "PCG 1968 INTERVIEW NUMBER             02" ;
label variable PNPCG02         "PCG PERSON NUMBER                     02" ;
label variable CRPCGFID02      "PCG CORE FAMILY INTERVIEW NUMBER      02" ;
label variable CRPCGSN02       "PCG CORE SEQUENCE NUMBER              02" ;
label variable ID68OCG02       "OCG 1968 INTERVIEW NUMBER             02" ;
label variable PNOCG02         "OCG PERSON NUMBER                     02" ;
label variable CROCGFID02      "OCG CORE FAMILY INTERVIEW NUMBER      02" ;
label variable CROCGSN02       "OCG CORE SEQUENCE NUMBER              02" ;
label variable DEMOG_02        "CDS DEMOG FILE                        02" ;
label variable PCGHH_02        "CDS PCG HOUSEHOLD FILE                02" ;
label variable PCGCH_02        "CDS PCG CHILD FILE                    02" ;
label variable CHILD_02        "CDS CHILD FILE                        02" ;
label variable CDSTYPE07       "CDS PERSON TYPE                       07" ;
label variable CRFID07         "CORE FAMILY INTERVIEW NUMBER          07" ;
label variable CRSN07          "CORE SEQUENCE NUMBER                  07" ;
label variable CDS_HID07       "CDS HOUSEHOLD INTERVIEW NUMBER        07" ;
label variable CDS_SN07        "CDS SEQUENCE NUMBER                   07" ;
label variable ID68PCG07       "PCG 1968 INTERVIEW NUMBER             07" ;
label variable PNPCG07         "PCG PERSON NUMBER                     07" ;
label variable CRPCGFID07      "PCG CORE FAMILY INTERVIEW NUMBER      07" ;
label variable CRPCGSN07       "PCG CORE SEQUENCE NUMBER              07" ;
label variable ID68OCG07       "OCG 1968 INTERVIEW NUMBER             07" ;
label variable PNOCG07         "OCG PERSON NUMBER                     07" ;
label variable CROCGFID07      "OCG CORE FAMILY INTERVIEW NUMBER      07" ;
label variable CROCGSN07       "OCG CORE SEQUENCE NUMBER              07" ;
label variable DEMOG_07        "CDS DEMOG FILE                        07" ;
label variable PCGHH_07        "CDS PCG HOUSEHOLD FILE                07" ;
label variable PCGCH_07        "CDS PCG CHILD FILE                    07" ;
label variable CHILD_07        "CDS CHILD FILE                        07" ;
label variable CDSTYPE14       "CDS PERSON TYPE                       14" ;
label variable CRFID14         "CORE FAMILY INTERVIEW NUMBER          14" ;
label variable CRSN14          "CORE SEQUENCE NUMBER                  14" ;
label variable CDS_HID14       "CDS HOUSEHOLD INTERVIEW NUMBER        14" ;
label variable CDS_SN14        "CDS SEQUENCE NUMBER                   14" ;
label variable ID68PCG14       "PCG 1968 INTERVIEW NUMBER             14" ;
label variable PNPCG14         "PCG PERSON NUMBER                     14" ;
label variable CRPCGFID14      "PCG CORE FAMILY INTERVIEW NUMBER      14" ;
label variable CRPCGSN14       "PCG CORE SEQUENCE NUMBER              14" ;
label variable CDSPCGSN14      "PCG CDS SEQUENCE NUMBER               14" ;
label variable PCGHHNO14       "CDS HOUSEHOLD PCG INDICATOR           14" ;
label variable DEMOG_14        "CDS DEMOG FILE                        14" ;
label variable PCGHH_14        "CDS PCG HOUSEHOLD FILE                14" ;
label variable PCGCH_14        "CDS PCG CHILD FILE                    14" ;
label variable CHILD_14        "CDS CHILD FILE                        14" ;
label variable CDSTYPE19       "CDS PERSON TYPE                       19" ;
label variable CRFID19         "CORE FAMILY INTERVIEW NUMBER          19" ;
label variable CRSN19          "CORE SEQUENCE NUMBER                  19" ;
label variable CDS_HID19       "CDS HOUSEHOLD INTERVIEW NUMBER        19" ;
label variable CDS_SN19        "CDS SEQUENCE NUMBER                   19" ;
label variable ID68PCG19       "PCG 1968 INTERVIEW NUMBER             19" ;
label variable PNPCG19         "PCG PERSON NUMBER                     19" ;
label variable CRPCGFID19      "PCG CORE FAMILY INTERVIEW NUMBER      19" ;
label variable CRPCGSN19       "PCG CORE SEQUENCE NUMBER              19" ;
label variable CDSPCGSN19      "PCG CDS SEQUENCE NUMBER               19" ;
label variable PCGHHNO19       "CDS HOUSEHOLD PCG INDICATOR           19" ;
label variable DEMOG_19        "CDS DEMOG FILE                        19" ;
label variable PCGHH_19        "CDS PCG HOUSEHOLD FILE                19" ;
label variable PCGCH_19        "CDS PCG CHILD FILE                    19" ;
label variable CHILD_19        "CDS CHILD FILE                        19" ;
label variable PCGHH_20        "CDS PCG HOUSEHOLD FILE                20" ;
label variable PCGCH_20        "CDS PCG CHILD FILE                    20" ;
label variable CDSTYPE21       "CDS PERSON TYPE                       21" ;
label variable CRFID21         "CORE FAMILY INTERVIEW NUMBER          21" ;
label variable CRSN21          "CORE SEQUENCE NUMBER                  21" ;
label variable CDS_HID21       "CDS HOUSEHOLD INTERVIEW NUMBER        21" ;
label variable CDS_SN21        "CDS SEQUENCE NUMBER                   21" ;
label variable ID68PCG21       "PCG 1968 INTERVIEW NUMBER             21" ;
label variable PNPCG21         "PCG PERSON NUMBER                     21" ;
label variable CRPCGFID21      "PCG CORE FAMILY INTERVIEW NUMBER      21" ;
label variable CRPCGSN21       "PCG CORE SEQUENCE NUMBER              21" ;
label variable CDSPCGSN21      "PCG CDS SEQUENCE NUMBER               21" ;
label variable PCGHHNO21       "CDS HOUSEHOLD PCG INDICATOR           21" ;
label variable DEMOG_21        "CDS DEMOG FILE                        21" ;
label variable PCGHH_21        "CDS PCG HOUSEHOLD FILE                21" ;
label variable PCGCH_21        "CDS PCG CHILD FILE                    21" ;
label variable CHILD_21        "CDS CHILD FILE                        21" ;
