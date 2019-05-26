---
title: "Código Práctica 2: Limpieza dataset 'Student Alcohol Consumption '"
author: "Gregorio Andrés García Menéndez (gagarcia) & Manuel Gomez Montero (megmontero)"
date: "Junio, 2019"
output:
  html_document:
    keep_md: yes
    number_sections: yes
    toc: yes
    toc_depth: 2
    toc_float: yes
  pdf_document:
    toc: yes
    toc_depth: '2'
lang: es
---







**Introducción**

Práctica 2 de .... chapa... 


Leemos ambos ficheros mostramos resumén para matemáticas:


```r
students.mat=read.table("../data/student-mat.csv",sep=",",header=TRUE)
students.por=read.table("../data/student-por.csv",sep=",",header=TRUE)
summary(students.mat)
```

```
##  school   sex          age       address famsize   Pstatus      Medu      
##  GP:349   F:208   Min.   :15.0   R: 88   GT3:281   A: 41   Min.   :0.000  
##  MS: 46   M:187   1st Qu.:16.0   U:307   LE3:114   T:354   1st Qu.:2.000  
##                   Median :17.0                             Median :3.000  
##                   Mean   :16.7                             Mean   :2.749  
##                   3rd Qu.:18.0                             3rd Qu.:4.000  
##                   Max.   :22.0                             Max.   :4.000  
##       Fedu             Mjob           Fjob            reason   
##  Min.   :0.000   at_home : 59   at_home : 20   course    :145  
##  1st Qu.:2.000   health  : 34   health  : 18   home      :109  
##  Median :2.000   other   :141   other   :217   other     : 36  
##  Mean   :2.522   services:103   services:111   reputation:105  
##  3rd Qu.:3.000   teacher : 58   teacher : 29                   
##  Max.   :4.000                                                 
##    guardian     traveltime      studytime        failures      schoolsup
##  father: 90   Min.   :1.000   Min.   :1.000   Min.   :0.0000   no :344  
##  mother:273   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:0.0000   yes: 51  
##  other : 32   Median :1.000   Median :2.000   Median :0.0000            
##               Mean   :1.448   Mean   :2.035   Mean   :0.3342            
##               3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:0.0000            
##               Max.   :4.000   Max.   :4.000   Max.   :3.0000            
##  famsup     paid     activities nursery   higher    internet  romantic 
##  no :153   no :214   no :194    no : 81   no : 20   no : 66   no :263  
##  yes:242   yes:181   yes:201    yes:314   yes:375   yes:329   yes:132  
##                                                                        
##                                                                        
##                                                                        
##                                                                        
##      famrel         freetime         goout            Dalc      
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:4.000   1st Qu.:3.000   1st Qu.:2.000   1st Qu.:1.000  
##  Median :4.000   Median :3.000   Median :3.000   Median :1.000  
##  Mean   :3.944   Mean   :3.235   Mean   :3.109   Mean   :1.481  
##  3rd Qu.:5.000   3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:2.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##       Walc           health         absences            G1       
##  Min.   :1.000   Min.   :1.000   Min.   : 0.000   Min.   : 3.00  
##  1st Qu.:1.000   1st Qu.:3.000   1st Qu.: 0.000   1st Qu.: 8.00  
##  Median :2.000   Median :4.000   Median : 4.000   Median :11.00  
##  Mean   :2.291   Mean   :3.554   Mean   : 5.709   Mean   :10.91  
##  3rd Qu.:3.000   3rd Qu.:5.000   3rd Qu.: 8.000   3rd Qu.:13.00  
##  Max.   :5.000   Max.   :5.000   Max.   :75.000   Max.   :19.00  
##        G2              G3       
##  Min.   : 0.00   Min.   : 0.00  
##  1st Qu.: 9.00   1st Qu.: 8.00  
##  Median :11.00   Median :11.00  
##  Mean   :10.71   Mean   :10.42  
##  3rd Qu.:13.00   3rd Qu.:14.00  
##  Max.   :19.00   Max.   :20.00
```


Y para portugués: 


```r
summary(students.por)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:423   F:383   Min.   :15.00   R:197   GT3:457   A: 80  
##  MS:226   M:266   1st Qu.:16.00   U:452   LE3:192   T:569  
##                   Median :17.00                            
##                   Mean   :16.74                            
##                   3rd Qu.:18.00                            
##                   Max.   :22.00                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home :135   at_home : 42  
##  1st Qu.:2.000   1st Qu.:1.000   health  : 48   health  : 23  
##  Median :2.000   Median :2.000   other   :258   other   :367  
##  Mean   :2.515   Mean   :2.307   services:136   services:181  
##  3rd Qu.:4.000   3rd Qu.:3.000   teacher : 72   teacher : 36  
##  Max.   :4.000   Max.   :4.000                                
##         reason      guardian     traveltime      studytime    
##  course    :285   father:153   Min.   :1.000   Min.   :1.000  
##  home      :149   mother:455   1st Qu.:1.000   1st Qu.:1.000  
##  other     : 72   other : 41   Median :1.000   Median :2.000  
##  reputation:143                Mean   :1.569   Mean   :1.931  
##                                3rd Qu.:2.000   3rd Qu.:2.000  
##                                Max.   :4.000   Max.   :4.000  
##     failures      schoolsup famsup     paid     activities nursery  
##  Min.   :0.0000   no :581   no :251   no :610   no :334    no :128  
##  1st Qu.:0.0000   yes: 68   yes:398   yes: 39   yes:315    yes:521  
##  Median :0.0000                                                     
##  Mean   :0.2219                                                     
##  3rd Qu.:0.0000                                                     
##  Max.   :3.0000                                                     
##  higher    internet  romantic      famrel         freetime   
##  no : 69   no :151   no :410   Min.   :1.000   Min.   :1.00  
##  yes:580   yes:498   yes:239   1st Qu.:4.000   1st Qu.:3.00  
##                                Median :4.000   Median :3.00  
##                                Mean   :3.931   Mean   :3.18  
##                                3rd Qu.:5.000   3rd Qu.:4.00  
##                                Max.   :5.000   Max.   :5.00  
##      goout            Dalc            Walc          health     
##  Min.   :1.000   Min.   :1.000   Min.   :1.00   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.00   1st Qu.:2.000  
##  Median :3.000   Median :1.000   Median :2.00   Median :4.000  
##  Mean   :3.185   Mean   :1.502   Mean   :2.28   Mean   :3.536  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.00   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.00   Max.   :5.000  
##     absences            G1             G2              G3       
##  Min.   : 0.000   Min.   : 0.0   Min.   : 0.00   Min.   : 0.00  
##  1st Qu.: 0.000   1st Qu.:10.0   1st Qu.:10.00   1st Qu.:10.00  
##  Median : 2.000   Median :11.0   Median :11.00   Median :12.00  
##  Mean   : 3.659   Mean   :11.4   Mean   :11.57   Mean   :11.91  
##  3rd Qu.: 6.000   3rd Qu.:13.0   3rd Qu.:13.00   3rd Qu.:14.00  
##  Max.   :32.000   Max.   :19.0   Max.   :19.00   Max.   :19.00
```



En el código de ejemplo los unía a ver que ver si tiene sentido. ya que no son los mismos alumnos.


```r
students=merge(students.mat,students.por,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
summary(students)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:342   F:198   Min.   :15.00   R: 81   GT3:278   A: 38  
##  MS: 40   M:184   1st Qu.:16.00   U:301   LE3:104   T:344  
##                   Median :17.00                            
##                   Mean   :16.59                            
##                   3rd Qu.:17.00                            
##                   Max.   :22.00                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home : 53   at_home : 16  
##  1st Qu.:2.000   1st Qu.:2.000   health  : 33   health  : 17  
##  Median :3.000   Median :3.000   other   :138   other   :211  
##  Mean   :2.806   Mean   :2.565   services: 96   services:107  
##  3rd Qu.:4.000   3rd Qu.:4.000   teacher : 62   teacher : 31  
##  Max.   :4.000   Max.   :4.000                                
##         reason    nursery   internet   guardian.x   traveltime.x  
##  course    :140   no : 72   no : 58   father: 91   Min.   :1.000  
##  home      :110   yes:310   yes:324   mother:275   1st Qu.:1.000  
##  other     : 34                       other : 16   Median :1.000  
##  reputation: 98                                    Mean   :1.442  
##                                                    3rd Qu.:2.000  
##                                                    Max.   :4.000  
##   studytime.x      failures.x     schoolsup.x famsup.x  paid.x   
##  Min.   :1.000   Min.   :0.0000   no :331     no :144   no :205  
##  1st Qu.:1.000   1st Qu.:0.0000   yes: 51     yes:238   yes:177  
##  Median :2.000   Median :0.0000                                  
##  Mean   :2.034   Mean   :0.2906                                  
##  3rd Qu.:2.000   3rd Qu.:0.0000                                  
##  Max.   :4.000   Max.   :3.0000                                  
##  activities.x higher.x  romantic.x    famrel.x      freetime.x   
##  no :181      no : 18   no :261    Min.   :1.00   Min.   :1.000  
##  yes:201      yes:364   yes:121    1st Qu.:4.00   1st Qu.:3.000  
##                                    Median :4.00   Median :3.000  
##                                    Mean   :3.94   Mean   :3.223  
##                                    3rd Qu.:5.00   3rd Qu.:4.000  
##                                    Max.   :5.00   Max.   :5.000  
##     goout.x          Dalc.x          Walc.x        health.x    
##  Min.   :1.000   Min.   :1.000   Min.   :1.00   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.00   1st Qu.:3.000  
##  Median :3.000   Median :1.000   Median :2.00   Median :4.000  
##  Mean   :3.113   Mean   :1.474   Mean   :2.28   Mean   :3.579  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.00   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.00   Max.   :5.000  
##    absences.x          G1.x            G2.x            G3.x      
##  Min.   : 0.000   Min.   : 3.00   Min.   : 0.00   Min.   : 0.00  
##  1st Qu.: 0.000   1st Qu.: 8.00   1st Qu.: 8.25   1st Qu.: 8.00  
##  Median : 3.000   Median :10.50   Median :11.00   Median :11.00  
##  Mean   : 5.319   Mean   :10.86   Mean   :10.71   Mean   :10.39  
##  3rd Qu.: 8.000   3rd Qu.:13.00   3rd Qu.:13.00   3rd Qu.:14.00  
##  Max.   :75.000   Max.   :19.00   Max.   :19.00   Max.   :20.00  
##   guardian.y   traveltime.y    studytime.y      failures.y     schoolsup.y
##  father: 91   Min.   :1.000   Min.   :1.000   Min.   :0.0000   no :332    
##  mother:275   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:0.0000   yes: 50    
##  other : 16   Median :1.000   Median :2.000   Median :0.0000              
##               Mean   :1.445   Mean   :2.039   Mean   :0.1414              
##               3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:0.0000              
##               Max.   :4.000   Max.   :4.000   Max.   :3.0000              
##  famsup.y  paid.y    activities.y higher.y  romantic.y    famrel.y    
##  no :143   no :356   no :182      no : 18   no :259    Min.   :1.000  
##  yes:239   yes: 26   yes:200      yes:364   yes:123    1st Qu.:4.000  
##                                                        Median :4.000  
##                                                        Mean   :3.942  
##                                                        3rd Qu.:5.000  
##                                                        Max.   :5.000  
##    freetime.y      goout.y          Dalc.y          Walc.y     
##  Min.   :1.00   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:3.00   1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000  
##  Median :3.00   Median :3.000   Median :1.000   Median :2.000  
##  Mean   :3.23   Mean   :3.118   Mean   :1.476   Mean   :2.291  
##  3rd Qu.:4.00   3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000  
##  Max.   :5.00   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##     health.y       absences.y          G1.y            G2.y      
##  Min.   :1.000   Min.   : 0.000   Min.   : 0.00   Min.   : 5.00  
##  1st Qu.:3.000   1st Qu.: 0.000   1st Qu.:10.00   1st Qu.:11.00  
##  Median :4.000   Median : 2.000   Median :12.00   Median :12.00  
##  Mean   :3.576   Mean   : 3.673   Mean   :12.11   Mean   :12.24  
##  3rd Qu.:5.000   3rd Qu.: 6.000   3rd Qu.:14.00   3rd Qu.:14.00  
##  Max.   :5.000   Max.   :32.000   Max.   :19.00   Max.   :19.00  
##       G3.y      
##  Min.   : 0.00  
##  1st Qu.:11.00  
##  Median :13.00  
##  Mean   :12.52  
##  3rd Qu.:14.00  
##  Max.   :19.00
```


Propongo unirlo así que nos salgan nulos y aplicar una mejor limpieza, habría que ver que campos son comunes y cuales no.


```r
students=merge(students.mat,students.por,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet", "guardian"), all = TRUE)
summary(students)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:443   F:396   Min.   :15.00   R:204   GT3:474   A: 83  
##  MS:233   M:280   1st Qu.:16.00   U:472   LE3:202   T:593  
##                   Median :17.00                            
##                   Mean   :16.81                            
##                   3rd Qu.:18.00                            
##                   Max.   :22.00                            
##                                                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home :141   at_home : 46  
##  1st Qu.:2.000   1st Qu.:1.000   health  : 49   health  : 24  
##  Median :2.000   Median :2.000   other   :267   other   :381  
##  Mean   :2.494   Mean   :2.291   services:146   services:189  
##  3rd Qu.:4.000   3rd Qu.:3.000   teacher : 73   teacher : 36  
##  Max.   :4.000   Max.   :4.000                                
##                                                               
##         reason    nursery   internet    guardian    traveltime.x  
##  course    :295   no :137   no :160   father:155   Min.   :1.000  
##  home      :157   yes:539   yes:516   mother:464   1st Qu.:1.000  
##  other     : 74                       other : 57   Median :1.000  
##  reputation:150                                    Mean   :1.449  
##                                                    3rd Qu.:2.000  
##                                                    Max.   :4.000  
##                                                    NA's   :275    
##   studytime.x     failures.x     schoolsup.x famsup.x    paid.x   
##  Min.   :1.00   Min.   :0.0000   no  :348    no  :156   no  :219  
##  1st Qu.:1.00   1st Qu.:0.0000   yes : 53    yes :245   yes :182  
##  Median :2.00   Median :0.0000   NA's:275    NA's:275   NA's:275  
##  Mean   :2.03   Mean   :0.3466                                    
##  3rd Qu.:2.00   3rd Qu.:0.0000                                    
##  Max.   :4.00   Max.   :3.0000                                    
##  NA's   :275    NA's   :275                                       
##  activities.x higher.x   romantic.x    famrel.x       freetime.x   
##  no  :195     no  : 21   no  :269   Min.   :1.000   Min.   :1.000  
##  yes :206     yes :380   yes :132   1st Qu.:4.000   1st Qu.:3.000  
##  NA's:275     NA's:275   NA's:275   Median :4.000   Median :3.000  
##                                     Mean   :3.948   Mean   :3.239  
##                                     3rd Qu.:5.000   3rd Qu.:4.000  
##                                     Max.   :5.000   Max.   :5.000  
##                                     NA's   :275     NA's   :275    
##     goout.x          Dalc.x          Walc.x         health.x    
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:3.000  
##  Median :3.000   Median :1.000   Median :2.000   Median :4.000  
##  Mean   :3.105   Mean   :1.474   Mean   :2.282   Mean   :3.566  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##  NA's   :275     NA's   :275     NA's   :275     NA's   :275    
##    absences.x          G1.x            G2.x            G3.x      
##  Min.   : 0.000   Min.   : 3.00   Min.   : 0.00   Min.   : 0.00  
##  1st Qu.: 0.000   1st Qu.: 8.00   1st Qu.: 9.00   1st Qu.: 8.00  
##  Median : 4.000   Median :11.00   Median :11.00   Median :11.00  
##  Mean   : 5.656   Mean   :10.87   Mean   :10.66   Mean   :10.36  
##  3rd Qu.: 8.000   3rd Qu.:13.00   3rd Qu.:13.00   3rd Qu.:13.00  
##  Max.   :75.000   Max.   :19.00   Max.   :19.00   Max.   :20.00  
##  NA's   :275      NA's   :275     NA's   :275     NA's   :275    
##   traveltime.y    studytime.y      failures.y     schoolsup.y famsup.y  
##  Min.   :1.000   Min.   :1.000   Min.   :0.0000   no  :582    no  :251  
##  1st Qu.:1.000   1st Qu.:1.000   1st Qu.:0.0000   yes : 69    yes :400  
##  Median :1.000   Median :2.000   Median :0.0000   NA's: 25    NA's: 25  
##  Mean   :1.568   Mean   :1.928   Mean   :0.2258                         
##  3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:0.0000                         
##  Max.   :4.000   Max.   :4.000   Max.   :3.0000                         
##  NA's   :25      NA's   :25      NA's   :25                             
##   paid.y    activities.y higher.y   romantic.y    famrel.y    
##  no  :612   no  :335     no  : 70   no  :412   Min.   :1.000  
##  yes : 39   yes :316     yes :581   yes :239   1st Qu.:4.000  
##  NA's: 25   NA's: 25     NA's: 25   NA's: 25   Median :4.000  
##                                                Mean   :3.932  
##                                                3rd Qu.:5.000  
##                                                Max.   :5.000  
##                                                NA's   :25     
##    freetime.y       goout.y          Dalc.y          Walc.y     
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:3.000   1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000  
##  Median :3.000   Median :3.000   Median :1.000   Median :2.000  
##  Mean   :3.184   Mean   :3.184   Mean   :1.501   Mean   :2.278  
##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##  NA's   :25      NA's   :25      NA's   :25      NA's   :25     
##     health.y       absences.y          G1.y            G2.y      
##  Min.   :1.000   Min.   : 0.000   Min.   : 0.00   Min.   : 0.00  
##  1st Qu.:2.000   1st Qu.: 0.000   1st Qu.:10.00   1st Qu.:10.00  
##  Median :4.000   Median : 2.000   Median :11.00   Median :11.00  
##  Mean   :3.538   Mean   : 3.682   Mean   :11.39   Mean   :11.56  
##  3rd Qu.:5.000   3rd Qu.: 6.000   3rd Qu.:13.00   3rd Qu.:13.00  
##  Max.   :5.000   Max.   :32.000   Max.   :19.00   Max.   :19.00  
##  NA's   :25      NA's   :25       NA's   :25      NA's   :25     
##       G3.y      
##  Min.   : 0.00  
##  1st Qu.:10.00  
##  Median :12.00  
##  Mean   :11.89  
##  3rd Qu.:14.00  
##  Max.   :19.00  
##  NA's   :25
```

```r
write.table(students, "students.csv", sep=",", col.names=TRUE, row.names=TRUE, quote=TRUE, na="NA")
```




