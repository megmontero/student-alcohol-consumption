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



# Limpieza de datos


## Lectura de datos 

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

## Union de fuentes

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



```r
students.both=merge(students.mat,students.por,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet", "traveltime", "failures", "schoolsup", "activities", "higher", "romantic", "famrel", "freetime", "goout", "Dalc", "Walc", "health"))
summary(students.both)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:287   F:174   Min.   :15.00   R: 67   GT3:230   A: 31  
##  MS: 33   M:146   1st Qu.:16.00   U:253   LE3: 90   T:289  
##                   Median :16.00                            
##                   Mean   :16.52                            
##                   3rd Qu.:17.00                            
##                   Max.   :22.00                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home : 44   at_home : 14  
##  1st Qu.:2.000   1st Qu.:2.000   health  : 30   health  : 15  
##  Median :3.000   Median :3.000   other   :116   other   :177  
##  Mean   :2.872   Mean   :2.622   services: 75   services: 87  
##  3rd Qu.:4.000   3rd Qu.:4.000   teacher : 55   teacher : 27  
##  Max.   :4.000   Max.   :4.000                                
##         reason    nursery   internet    traveltime       failures      
##  course    :118   no : 59   no : 48   Min.   :1.000   Min.   :0.00000  
##  home      : 87   yes:261   yes:272   1st Qu.:1.000   1st Qu.:0.00000  
##  other     : 30                       Median :1.000   Median :0.00000  
##  reputation: 85                       Mean   :1.428   Mean   :0.08125  
##                                       3rd Qu.:2.000   3rd Qu.:0.00000  
##                                       Max.   :4.000   Max.   :3.00000  
##  schoolsup activities higher    romantic      famrel         freetime    
##  no :277   no :150    no :  7   no :221   Min.   :1.000   Min.   :1.000  
##  yes: 43   yes:170    yes:313   yes: 99   1st Qu.:4.000   1st Qu.:3.000  
##                                           Median :4.000   Median :3.000  
##                                           Mean   :3.987   Mean   :3.203  
##                                           3rd Qu.:5.000   3rd Qu.:4.000  
##                                           Max.   :5.000   Max.   :5.000  
##      goout            Dalc            Walc           health     
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:3.000  
##  Median :3.000   Median :1.000   Median :2.000   Median :4.000  
##  Mean   :3.069   Mean   :1.438   Mean   :2.225   Mean   :3.522  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##   guardian.x   studytime.x    famsup.x  paid.x      absences.x    
##  father: 74   Min.   :1.000   no :117   no :160   Min.   : 0.000  
##  mother:237   1st Qu.:1.000   yes:203   yes:160   1st Qu.: 0.000  
##  other :  9   Median :2.000                       Median : 4.000  
##               Mean   :2.084                       Mean   : 5.412  
##               3rd Qu.:3.000                       3rd Qu.: 7.250  
##               Max.   :4.000                       Max.   :75.000  
##       G1.x            G2.x            G3.x        guardian.y 
##  Min.   : 5.00   Min.   : 0.00   Min.   : 0.00   father: 74  
##  1st Qu.: 9.00   1st Qu.: 9.00   1st Qu.: 9.00   mother:237  
##  Median :11.00   Median :11.00   Median :11.00   other :  9  
##  Mean   :11.29   Mean   :11.18   Mean   :11.04               
##  3rd Qu.:14.00   3rd Qu.:14.00   3rd Qu.:14.00               
##  Max.   :19.00   Max.   :19.00   Max.   :20.00               
##   studytime.y    famsup.y  paid.y      absences.y          G1.y      
##  Min.   :1.000   no :117   no :300   Min.   : 0.000   Min.   : 0.00  
##  1st Qu.:1.000   yes:203   yes: 20   1st Qu.: 0.000   1st Qu.:11.00  
##  Median :2.000                       Median : 2.000   Median :12.00  
##  Mean   :2.084                       Mean   : 3.247   Mean   :12.39  
##  3rd Qu.:3.000                       3rd Qu.: 4.000   3rd Qu.:14.00  
##  Max.   :4.000                       Max.   :32.000   Max.   :19.00  
##       G2.y            G3.y      
##  Min.   : 5.00   Min.   : 0.00  
##  1st Qu.:11.00   1st Qu.:11.00  
##  Median :12.00   Median :13.00  
##  Mean   :12.57   Mean   :12.88  
##  3rd Qu.:14.00   3rd Qu.:15.00  
##  Max.   :19.00   Max.   :19.00
```

Vemos cuales realmente serian del mismo conjunto

```r
print(nrow(students.both[students$guardian.y!=students$guardian.x,c("guardian.x", "guardian.y")]))
```

```
## [1] 6
```

```r
print(nrow(students.both[students$guardian.y!=students$guardian.x,c("famsup.x", "famsup.y")]))
```

```
## [1] 6
```

```r
print(nrow(students.both[students$studytime.y!=students$studytime.x,c("studytime.x", "studytime.y")]))
```

```
## [1] 9
```

```r
print(nrow(students.both[students$paid.y!=students$paid.x,c("paid.x", "paid.y")]))
```

```
## [1] 171
```

```r
print(nrow(students.both[students$absences.y!=students$absences.x,c("absences.x", "absences.y")]))
```

```
## [1] 280
```

Por lo que creamos el dataset final

```r
students.merge=merge(students.mat,students.por,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet", "traveltime", "failures", "schoolsup", "activities", "higher", "romantic", "famrel", "freetime", "goout", "Dalc", "Walc", "health", "guardian", "famsup", "studytime"), all = TRUE,suffixes = c(".mat",".por"))
summary(students.merge)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:485   F:417   Min.   :15.00   R:218   GT3:508   A: 90  
##  MS:239   M:307   1st Qu.:16.00   U:506   LE3:216   T:634  
##                   Median :17.00                            
##                   Mean   :16.81                            
##                   3rd Qu.:18.00                            
##                   Max.   :22.00                            
##                                                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home :150   at_home : 48  
##  1st Qu.:2.000   1st Qu.:1.000   health  : 52   health  : 26  
##  Median :2.000   Median :2.000   other   :283   other   :407  
##  Mean   :2.485   Mean   :2.285   services:164   services:205  
##  3rd Qu.:4.000   3rd Qu.:3.000   teacher : 75   teacher : 38  
##  Max.   :4.000   Max.   :4.000                                
##                                                               
##         reason    nursery   internet    traveltime       failures     
##  course    :312   no :150   no :169   Min.   :1.000   Min.   :0.0000  
##  home      :171   yes:574   yes:555   1st Qu.:1.000   1st Qu.:0.0000  
##  other     : 78                       Median :1.000   Median :0.0000  
##  reputation:163                       Mean   :1.565   Mean   :0.3453  
##                                       3rd Qu.:2.000   3rd Qu.:0.0000  
##                                       Max.   :4.000   Max.   :3.0000  
##                                                                       
##  schoolsup activities higher    romantic      famrel         freetime  
##  no :648   no :378    no : 82   no :452   Min.   :1.000   Min.   :1.0  
##  yes: 76   yes:346    yes:642   yes:272   1st Qu.:4.000   1st Qu.:3.0  
##                                           Median :4.000   Median :3.0  
##                                           Mean   :3.913   Mean   :3.2  
##                                           3rd Qu.:5.000   3rd Qu.:4.0  
##                                           Max.   :5.000   Max.   :5.0  
##                                                                        
##      goout            Dalc            Walc           health     
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:2.000  
##  Median :3.000   Median :1.000   Median :2.000   Median :4.000  
##  Mean   :3.195   Mean   :1.519   Mean   :2.311   Mean   :3.552  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##                                                                 
##    guardian   famsup      studytime    paid.mat    absences.mat   
##  father:169   no :287   Min.   :1.00   no  :214   Min.   : 0.000  
##  mother:491   yes:437   1st Qu.:1.00   yes :181   1st Qu.: 0.000  
##  other : 64             Median :2.00   NA's:329   Median : 4.000  
##                         Mean   :1.92              Mean   : 5.709  
##                         3rd Qu.:2.00              3rd Qu.: 8.000  
##                         Max.   :4.00              Max.   :75.000  
##                                                   NA's   :329     
##      G1.mat          G2.mat          G3.mat      paid.por  
##  Min.   : 3.00   Min.   : 0.00   Min.   : 0.00   no  :610  
##  1st Qu.: 8.00   1st Qu.: 9.00   1st Qu.: 8.00   yes : 39  
##  Median :11.00   Median :11.00   Median :11.00   NA's: 75  
##  Mean   :10.91   Mean   :10.71   Mean   :10.42             
##  3rd Qu.:13.00   3rd Qu.:13.00   3rd Qu.:14.00             
##  Max.   :19.00   Max.   :19.00   Max.   :20.00             
##  NA's   :329     NA's   :329     NA's   :329               
##   absences.por        G1.por         G2.por          G3.por     
##  Min.   : 0.000   Min.   : 0.0   Min.   : 0.00   Min.   : 0.00  
##  1st Qu.: 0.000   1st Qu.:10.0   1st Qu.:10.00   1st Qu.:10.00  
##  Median : 2.000   Median :11.0   Median :11.00   Median :12.00  
##  Mean   : 3.659   Mean   :11.4   Mean   :11.57   Mean   :11.91  
##  3rd Qu.: 6.000   3rd Qu.:13.0   3rd Qu.:13.00   3rd Qu.:14.00  
##  Max.   :32.000   Max.   :19.0   Max.   :19.00   Max.   :19.00  
##  NA's   :75       NA's   :75     NA's   :75      NA's   :75
```

```r
# Save the dataset temporaly 
write.table(students, "../data/students.csv", sep=",", col.names=TRUE, row.names=TRUE, quote=TRUE, na="NA")
```



## Eliminamos NAs


Primeros creamos un nuevo dataset y unificamos la variable paid. 

```r
students.nonas <- students.merge[, c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet", "traveltime", "failures", "schoolsup", "activities", "higher", "romantic", "famrel", "freetime", "goout", "Dalc", "Walc", "health", "guardian", "famsup", "studytime")]
students.nonas$paid <- "no"
students.nonas$paid[NVL(students.merge$paid.mat == 'yes' | students.merge$paid.por == 'yes', FALSE)] <- "yes"
students.nonas$paid <- as.factor(students.nonas$paid)

summary(students.nonas)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:485   F:417   Min.   :15.00   R:218   GT3:508   A: 90  
##  MS:239   M:307   1st Qu.:16.00   U:506   LE3:216   T:634  
##                   Median :17.00                            
##                   Mean   :16.81                            
##                   3rd Qu.:18.00                            
##                   Max.   :22.00                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home :150   at_home : 48  
##  1st Qu.:2.000   1st Qu.:1.000   health  : 52   health  : 26  
##  Median :2.000   Median :2.000   other   :283   other   :407  
##  Mean   :2.485   Mean   :2.285   services:164   services:205  
##  3rd Qu.:4.000   3rd Qu.:3.000   teacher : 75   teacher : 38  
##  Max.   :4.000   Max.   :4.000                                
##         reason    nursery   internet    traveltime       failures     
##  course    :312   no :150   no :169   Min.   :1.000   Min.   :0.0000  
##  home      :171   yes:574   yes:555   1st Qu.:1.000   1st Qu.:0.0000  
##  other     : 78                       Median :1.000   Median :0.0000  
##  reputation:163                       Mean   :1.565   Mean   :0.3453  
##                                       3rd Qu.:2.000   3rd Qu.:0.0000  
##                                       Max.   :4.000   Max.   :3.0000  
##  schoolsup activities higher    romantic      famrel         freetime  
##  no :648   no :378    no : 82   no :452   Min.   :1.000   Min.   :1.0  
##  yes: 76   yes:346    yes:642   yes:272   1st Qu.:4.000   1st Qu.:3.0  
##                                           Median :4.000   Median :3.0  
##                                           Mean   :3.913   Mean   :3.2  
##                                           3rd Qu.:5.000   3rd Qu.:4.0  
##                                           Max.   :5.000   Max.   :5.0  
##      goout            Dalc            Walc           health     
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:2.000  
##  Median :3.000   Median :1.000   Median :2.000   Median :4.000  
##  Mean   :3.195   Mean   :1.519   Mean   :2.311   Mean   :3.552  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##    guardian   famsup      studytime     paid    
##  father:169   no :287   Min.   :1.00   no :515  
##  mother:491   yes:437   1st Qu.:1.00   yes:209  
##  other : 64             Median :2.00            
##                         Mean   :1.92            
##                         3rd Qu.:2.00            
##                         Max.   :4.00
```


Aplicamos un proceso similar para las calificaciones, utilizando la media en el caso que existan ambas:


```r
students.nonas$G1 <- rowMeans(students.merge[c('G1.mat', 'G1.por')], na.rm=TRUE)
students.nonas$G2 <- rowMeans(students.merge[c('G2.mat', 'G2.por')], na.rm=TRUE)
students.nonas$G3 <- rowMeans(students.merge[c('G3.mat', 'G3.por')], na.rm=TRUE)
summary(students.nonas)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:485   F:417   Min.   :15.00   R:218   GT3:508   A: 90  
##  MS:239   M:307   1st Qu.:16.00   U:506   LE3:216   T:634  
##                   Median :17.00                            
##                   Mean   :16.81                            
##                   3rd Qu.:18.00                            
##                   Max.   :22.00                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home :150   at_home : 48  
##  1st Qu.:2.000   1st Qu.:1.000   health  : 52   health  : 26  
##  Median :2.000   Median :2.000   other   :283   other   :407  
##  Mean   :2.485   Mean   :2.285   services:164   services:205  
##  3rd Qu.:4.000   3rd Qu.:3.000   teacher : 75   teacher : 38  
##  Max.   :4.000   Max.   :4.000                                
##         reason    nursery   internet    traveltime       failures     
##  course    :312   no :150   no :169   Min.   :1.000   Min.   :0.0000  
##  home      :171   yes:574   yes:555   1st Qu.:1.000   1st Qu.:0.0000  
##  other     : 78                       Median :1.000   Median :0.0000  
##  reputation:163                       Mean   :1.565   Mean   :0.3453  
##                                       3rd Qu.:2.000   3rd Qu.:0.0000  
##                                       Max.   :4.000   Max.   :3.0000  
##  schoolsup activities higher    romantic      famrel         freetime  
##  no :648   no :378    no : 82   no :452   Min.   :1.000   Min.   :1.0  
##  yes: 76   yes:346    yes:642   yes:272   1st Qu.:4.000   1st Qu.:3.0  
##                                           Median :4.000   Median :3.0  
##                                           Mean   :3.913   Mean   :3.2  
##                                           3rd Qu.:5.000   3rd Qu.:4.0  
##                                           Max.   :5.000   Max.   :5.0  
##      goout            Dalc            Walc           health     
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:2.000  
##  Median :3.000   Median :1.000   Median :2.000   Median :4.000  
##  Mean   :3.195   Mean   :1.519   Mean   :2.311   Mean   :3.552  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##    guardian   famsup      studytime     paid           G1       
##  father:169   no :287   Min.   :1.00   no :515   Min.   : 2.50  
##  mother:491   yes:437   1st Qu.:1.00   yes:209   1st Qu.: 9.00  
##  other : 64             Median :2.00             Median :11.00  
##                         Mean   :1.92             Mean   :10.94  
##                         3rd Qu.:2.00             3rd Qu.:13.00  
##                         Max.   :4.00             Max.   :18.50  
##        G2              G3       
##  Min.   : 0.00   Min.   : 0.00  
##  1st Qu.: 9.00   1st Qu.: 9.50  
##  Median :11.00   Median :11.00  
##  Mean   :10.97   Mean   :11.07  
##  3rd Qu.:13.00   3rd Qu.:13.00  
##  Max.   :18.50   Max.   :18.50
```
Por último lo aplicamos a las ausencias, antes de aplicar la media normalizamos los valores


```r
normalized<-function(y) {
  x<-y[!is.na(y)]
  x<-(x - min(x)) / (max(x) - min(x))
  y[!is.na(y)]<-x
  return(y)
}


students.nonas$absences <- rowMeans(sapply(students.merge[c('absences.mat', 'absences.por')], normalized), na.rm=TRUE)

summary(students.nonas)  
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:485   F:417   Min.   :15.00   R:218   GT3:508   A: 90  
##  MS:239   M:307   1st Qu.:16.00   U:506   LE3:216   T:634  
##                   Median :17.00                            
##                   Mean   :16.81                            
##                   3rd Qu.:18.00                            
##                   Max.   :22.00                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home :150   at_home : 48  
##  1st Qu.:2.000   1st Qu.:1.000   health  : 52   health  : 26  
##  Median :2.000   Median :2.000   other   :283   other   :407  
##  Mean   :2.485   Mean   :2.285   services:164   services:205  
##  3rd Qu.:4.000   3rd Qu.:3.000   teacher : 75   teacher : 38  
##  Max.   :4.000   Max.   :4.000                                
##         reason    nursery   internet    traveltime       failures     
##  course    :312   no :150   no :169   Min.   :1.000   Min.   :0.0000  
##  home      :171   yes:574   yes:555   1st Qu.:1.000   1st Qu.:0.0000  
##  other     : 78                       Median :1.000   Median :0.0000  
##  reputation:163                       Mean   :1.565   Mean   :0.3453  
##                                       3rd Qu.:2.000   3rd Qu.:0.0000  
##                                       Max.   :4.000   Max.   :3.0000  
##  schoolsup activities higher    romantic      famrel         freetime  
##  no :648   no :378    no : 82   no :452   Min.   :1.000   Min.   :1.0  
##  yes: 76   yes:346    yes:642   yes:272   1st Qu.:4.000   1st Qu.:3.0  
##                                           Median :4.000   Median :3.0  
##                                           Mean   :3.913   Mean   :3.2  
##                                           3rd Qu.:5.000   3rd Qu.:4.0  
##                                           Max.   :5.000   Max.   :5.0  
##      goout            Dalc            Walc           health     
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:2.000  
##  Median :3.000   Median :1.000   Median :2.000   Median :4.000  
##  Mean   :3.195   Mean   :1.519   Mean   :2.311   Mean   :3.552  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##    guardian   famsup      studytime     paid           G1       
##  father:169   no :287   Min.   :1.00   no :515   Min.   : 2.50  
##  mother:491   yes:437   1st Qu.:1.00   yes:209   1st Qu.: 9.00  
##  other : 64             Median :2.00             Median :11.00  
##                         Mean   :1.92             Mean   :10.94  
##                         3rd Qu.:2.00             3rd Qu.:13.00  
##                         Max.   :4.00             Max.   :18.50  
##        G2              G3           absences     
##  Min.   : 0.00   Min.   : 0.00   Min.   :0.0000  
##  1st Qu.: 9.00   1st Qu.: 9.50   1st Qu.:0.0000  
##  Median :11.00   Median :11.00   Median :0.0625  
##  Mean   :10.97   Mean   :11.07   Mean   :0.1057  
##  3rd Qu.:13.00   3rd Qu.:13.00   3rd Qu.:0.1527  
##  Max.   :18.50   Max.   :18.50   Max.   :0.8733
```




## Reducción dimensionalidad


Eliminamos School y calculamos la evaluacion como la media

```r
students.red <- students.nonas[,c("sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet", "traveltime", "failures", "schoolsup", "activities", "higher", "romantic", "famrel", "freetime", "goout", "Dalc", "Walc", "health", "guardian", "famsup", "studytime", "absences", "paid")]
students.red$G <-  rowMeans(students.nonas[c('G1', 'G2', 'G3')])

summary(students.red)
```

```
##  sex          age        address famsize   Pstatus      Medu      
##  F:417   Min.   :15.00   R:218   GT3:508   A: 90   Min.   :0.000  
##  M:307   1st Qu.:16.00   U:506   LE3:216   T:634   1st Qu.:2.000  
##          Median :17.00                             Median :2.000  
##          Mean   :16.81                             Mean   :2.485  
##          3rd Qu.:18.00                             3rd Qu.:4.000  
##          Max.   :22.00                             Max.   :4.000  
##       Fedu             Mjob           Fjob            reason    nursery  
##  Min.   :0.000   at_home :150   at_home : 48   course    :312   no :150  
##  1st Qu.:1.000   health  : 52   health  : 26   home      :171   yes:574  
##  Median :2.000   other   :283   other   :407   other     : 78            
##  Mean   :2.285   services:164   services:205   reputation:163            
##  3rd Qu.:3.000   teacher : 75   teacher : 38                             
##  Max.   :4.000                                                           
##  internet    traveltime       failures      schoolsup activities higher   
##  no :169   Min.   :1.000   Min.   :0.0000   no :648   no :378    no : 82  
##  yes:555   1st Qu.:1.000   1st Qu.:0.0000   yes: 76   yes:346    yes:642  
##            Median :1.000   Median :0.0000                                 
##            Mean   :1.565   Mean   :0.3453                                 
##            3rd Qu.:2.000   3rd Qu.:0.0000                                 
##            Max.   :4.000   Max.   :3.0000                                 
##  romantic      famrel         freetime       goout            Dalc      
##  no :452   Min.   :1.000   Min.   :1.0   Min.   :1.000   Min.   :1.000  
##  yes:272   1st Qu.:4.000   1st Qu.:3.0   1st Qu.:2.000   1st Qu.:1.000  
##            Median :4.000   Median :3.0   Median :3.000   Median :1.000  
##            Mean   :3.913   Mean   :3.2   Mean   :3.195   Mean   :1.519  
##            3rd Qu.:5.000   3rd Qu.:4.0   3rd Qu.:4.000   3rd Qu.:2.000  
##            Max.   :5.000   Max.   :5.0   Max.   :5.000   Max.   :5.000  
##       Walc           health        guardian   famsup      studytime   
##  Min.   :1.000   Min.   :1.000   father:169   no :287   Min.   :1.00  
##  1st Qu.:1.000   1st Qu.:2.000   mother:491   yes:437   1st Qu.:1.00  
##  Median :2.000   Median :4.000   other : 64             Median :2.00  
##  Mean   :2.311   Mean   :3.552                          Mean   :1.92  
##  3rd Qu.:3.000   3rd Qu.:5.000                          3rd Qu.:2.00  
##  Max.   :5.000   Max.   :5.000                          Max.   :4.00  
##     absences       paid           G         
##  Min.   :0.0000   no :515   Min.   : 1.333  
##  1st Qu.:0.0000   yes:209   1st Qu.: 9.167  
##  Median :0.0625             Median :11.000  
##  Mean   :0.1057             Mean   :10.991  
##  3rd Qu.:0.1527             3rd Qu.:13.000  
##  Max.   :0.8733             Max.   :18.333
```

## Tipo de variables


```r
sapply( students.red, class)
```

```
##        sex        age    address    famsize    Pstatus       Medu 
##   "factor"  "integer"   "factor"   "factor"   "factor"  "integer" 
##       Fedu       Mjob       Fjob     reason    nursery   internet 
##  "integer"   "factor"   "factor"   "factor"   "factor"   "factor" 
## traveltime   failures  schoolsup activities     higher   romantic 
##  "integer"  "integer"   "factor"   "factor"   "factor"   "factor" 
##     famrel   freetime      goout       Dalc       Walc     health 
##  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
##   guardian     famsup  studytime   absences       paid          G 
##   "factor"   "factor"  "integer"  "numeric"   "factor"  "numeric"
```

En los tipos mostrados hay algunos que no es correcto el tipo. En la educación tanto de la madre como del padre consideramos que aunque se use un número para la representación debería ser un factor. Lo mismo ocurre para el tiempo de viaje o el tiempo de estudio. 


```r
students.red$Medu <-as.factor(students.red$Medu) 
students.red$Fedu <-as.factor(students.red$Fedu) 
students.red$traveltime <-as.factor(students.red$traveltime) 
students.red$studytime <-as.factor(students.red$studytime) 
```



# Análisis Estadístico

## Análisis gráfico inicial


```r
vars = c("sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet", "traveltime", "failures", "schoolsup", "activities", "higher", "romantic", "famrel", "freetime", "goout", "health", "guardian", "famsup", "studytime", "absences", "paid", "G")
objs = c("Dalc", "Wcalc")



library(ggplot2)

for(i in vars) 
{
  if(is.factor(students.red[,i]))
  {
    f1 = students.red[,i]
plot <- ggplot(data = students.red, aes(x = f1, y = students.red[,"Walc"])) + 
  geom_boxplot(aes(fill = f1), width = 0.8) + theme_bw()  +
  xlab(i) + ylab("Weekend Consumption")
print(plot)
plot <- ggplot(data = students.red, aes(x = f1, y = students.red[,"Dalc"])) + 
  geom_boxplot(aes(fill = f1), width = 0.8) + theme_bw()  +
  xlab(i) + ylab("Weekday Consumption")
print(plot)

    }}
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-1.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-2.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-3.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-4.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-5.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-6.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-7.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-8.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-9.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-10.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-11.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-12.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-13.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-14.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-15.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-16.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-17.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-18.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-19.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-20.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-21.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-22.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-23.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-24.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-25.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-26.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-27.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-28.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-29.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-30.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-31.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-32.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-33.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-34.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-35.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-36.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-37.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-38.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-39.png)<!-- -->![](student-alcohol-consumption_files/figure-html/unnamed-chunk-13-40.png)<!-- -->



Viendo las gráficas vemos que hay variables que parece que sí tienen influencia a simple vista en el consumo de alcohol tanto a diarío como los fines de semana como pueden ser el sexo, el estado de los padres, sin embargo vemos otros que, a priori, no parece que tengan influencia así que en un primer momento vamos a dejar fuera del análisis si el alumno tiene internet, si tiene una relación, el tutor, la dirección, si realiza actividades extraescolares, si recibe clases de pago, si ha ido a la guarderia, o si  recibe el apoyo de su familia en el estudio. 

El dataset resultante y con el que continuaremos trabajando es el siguiente: 


```r
students <- students.red[,c("sex","age","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason", "traveltime", "failures", "schoolsup", "higher",  "famrel", "freetime", "goout", "Dalc", "Walc", "health", "studytime", "absences")]
summary(students)
```

```
##  sex          age        famsize   Pstatus Medu    Fedu          Mjob    
##  F:417   Min.   :15.00   GT3:508   A: 90   0:  7   0:  7   at_home :150  
##  M:307   1st Qu.:16.00   LE3:216   T:634   1:165   1:199   health  : 52  
##          Median :17.00                     2:205   2:235   other   :283  
##          Mean   :16.81                     3:164   3:147   services:164  
##          3rd Qu.:18.00                     4:183   4:136   teacher : 75  
##          Max.   :22.00                                                   
##        Fjob            reason    traveltime    failures      schoolsup
##  at_home : 48   course    :312   1:410      Min.   :0.0000   no :648  
##  health  : 26   home      :171   2:237      1st Qu.:0.0000   yes: 76  
##  other   :407   other     : 78   3: 59      Median :0.0000            
##  services:205   reputation:163   4: 18      Mean   :0.3453            
##  teacher : 38                               3rd Qu.:0.0000            
##                                             Max.   :3.0000            
##  higher        famrel         freetime       goout            Dalc      
##  no : 82   Min.   :1.000   Min.   :1.0   Min.   :1.000   Min.   :1.000  
##  yes:642   1st Qu.:4.000   1st Qu.:3.0   1st Qu.:2.000   1st Qu.:1.000  
##            Median :4.000   Median :3.0   Median :3.000   Median :1.000  
##            Mean   :3.913   Mean   :3.2   Mean   :3.195   Mean   :1.519  
##            3rd Qu.:5.000   3rd Qu.:4.0   3rd Qu.:4.000   3rd Qu.:2.000  
##            Max.   :5.000   Max.   :5.0   Max.   :5.000   Max.   :5.000  
##       Walc           health      studytime    absences     
##  Min.   :1.000   Min.   :1.000   1:236     Min.   :0.0000  
##  1st Qu.:1.000   1st Qu.:2.000   2:346     1st Qu.:0.0000  
##  Median :2.000   Median :4.000   3:106     Median :0.0625  
##  Mean   :2.311   Mean   :3.552   4: 36     Mean   :0.1057  
##  3rd Qu.:3.000   3rd Qu.:5.000             3rd Qu.:0.1527  
##  Max.   :5.000   Max.   :5.000             Max.   :0.8733
```




## Estadistica Inferencial 

En este apartado vamos a ver si hay diferencia significativas en el consumo de alcohol a diario o fines de semana entre estudiantes de distinto sexo o entre estudiantes con diferente situación de los padres. Se trata de un problema de diferencia de medias entre dos muestras.


Para cada caso la hipótesis sería: 


$$
\left\{
\begin{array}{ll}
H_{0}: &  \mu_{g1}-\mu_{g2}=0\\
H_{1}: & \mu_{g1}-\mu_{g2}\ne0
\end{array}
\right.
$$

Se trata de un problema de diferencia de medias en el que no conocemos la varianza poblacional, tampoco sabemos a priori si los datos siguen una distribución normal, prero el tamaño de las muestras es lo suficientemente grande para tener en cuenta el teorema del límite central.


Para el alcohol en fines de semana por sexo: 


```r
data_weekend_sex_m <- students$Walc[students$sex == 'M'] 
data_weekend_sex_f <- students$Walc[students$sex == 'F'] 

t.test(data_weekend_sex_m, data_weekend_sex_f, var.equal = TRUE, conf.level = 0.90)
```

```
## 
## 	Two Sample t-test
## 
## data:  data_weekend_sex_m and data_weekend_sex_f
## t = 9.7324, df = 722, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 90 percent confidence interval:
##  0.740428 1.042073
## sample estimates:
## mean of x mean of y 
##  2.824104  1.932854
```
Por el p-value vemos que si podemos rechazar la hipótesis nula y concluir que si hay diferencias significativas. 



Por sexo entre semana: 


```r
data_weekday_sex_m <- students$Dalc[students$sex == 'M'] 
data_weekday_sex_f <- students$Dalc[students$sex == 'F'] 

t.test(data_weekday_sex_m, data_weekday_sex_f, var.equal = TRUE, conf.level = 0.90)
```

```
## 
## 	Two Sample t-test
## 
## data:  data_weekday_sex_m and data_weekday_sex_f
## t = 8.2948, df = 722, p-value = 5.321e-16
## alternative hypothesis: true difference in means is not equal to 0
## 90 percent confidence interval:
##  0.4422066 0.6613171
## sample estimates:
## mean of x mean of y 
##  1.837134  1.285372
```
Por el p-value vemos que si podemos rechazar la hipótesis nula y concluir que si hay diferencias significativas. 



```r
data_weekday_pstatus_t <- students$Dalc[students$Pstatus == 'T'] 
data_weekday_pstatus_a <- students$Dalc[students$Pstatus == 'A'] 

t.test(data_weekday_pstatus_t, data_weekday_pstatus_a, var.equal = TRUE, conf.level = 0.90)
```

```
## 
## 	Two Sample t-test
## 
## data:  data_weekday_pstatus_t and data_weekday_pstatus_a
## t = 0.69872, df = 722, p-value = 0.4849
## alternative hypothesis: true difference in means is not equal to 0
## 90 percent confidence interval:
##  -0.09884577  0.24451700
## sample estimates:
## mean of x mean of y 
##  1.528391  1.455556
```
Por el p-value vemos que no hay diferencia significativa 




```r
data_weekend_pstatus_t <- students$Walc[students$Pstatus == 'T'] 
data_weekend_pstatus_a <- students$Walc[students$Pstatus == 'A'] 

t.test(data_weekend_pstatus_t, data_weekend_pstatus_a, var.equal = TRUE, conf.level = 0.90)
```

```
## 
## 	Two Sample t-test
## 
## data:  data_weekend_pstatus_t and data_weekend_pstatus_a
## t = 1.3035, df = 722, p-value = 0.1928
## alternative hypothesis: true difference in means is not equal to 0
## 90 percent confidence interval:
##  -0.05005058  0.42993140
## sample estimates:
## mean of x mean of y 
##  2.334385  2.144444
```
Por el p-value vemos que no hay diferencia significativa 




## Regresion 

En este apartado aplicaremos un modelo de regresión lineal múltiple que use como variables explicativas el sexo,
la frecuencia con la que el estudiante sale con amigos, la edad y como variable dependiente el consumo de alcohol los fines de semana. 

Al usar regresores cualitativos, es importante definir una categoría de referencia, para lo que usaremos la función de R *relevel* estableciendo la categoría "F" como referente para el sexo. El resultado lo almacenamos en una nueva  variable.



```r
students$sexR <- relevel(students$sex, "F")
modelo <- lm(Walc ~  goout + sexR + age, data = students )
summary(modelo)
```

```
## 
## Call:
## lm(formula = Walc ~ goout + sexR + age, data = students)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.5632 -0.8600 -0.1086  0.8219  4.0050 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.01328    0.55458   0.024    0.981    
## goout        0.41354    0.03571  11.580   <2e-16 ***
## sexRM        0.80044    0.08431   9.494   <2e-16 ***
## age          0.03788    0.03281   1.154    0.249    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.116 on 720 degrees of freedom
## Multiple R-squared:  0.2595,	Adjusted R-squared:  0.2564 
## F-statistic: 84.12 on 3 and 720 DF,  p-value: < 2.2e-16
```

Los coeficientes obtenidos para cada variable son: 


Observando el coeficiente de determinacion $R^{2}$ vemos que la proporción de variabilidad explicada por el modelo con respecto a la variabilidad total  es unicamente del 25% ...

OLD
------------------------------------------




# Análisis gráfico inicial





Sexo

```r
par(mfrow=c(1,2))
boxplot(Walc~sex,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~sex,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-20-1.png)<!-- -->

Parece que los hombres beben más.


Edad

```r
par(mfrow=c(1,2))
boxplot(Walc~age,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~age,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-21-1.png)<!-- -->

Parece que los mayores beben más entre semana.



             Fedu             Mjob           Fjob            reason    nursery   internet    traveltime       failures      schoolsup activities higher 
 
 

```r
par(mfrow=c(1,2))
boxplot(Walc~Medu,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~Medu,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-22-1.png)<!-- -->
 
 

```r
par(mfrow=c(1,2))
boxplot(Walc~Fedu,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~Fedu,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-23-1.png)<!-- -->
 
 
 
 


famsize

```r
par(mfrow=c(1,2))
boxplot(Walc~famsize,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~famsize,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-24-1.png)<!-- -->





Alcohol fin de sema y entre semana en función del estado de los padres 

```r
par(mfrow=c(1,2))

boxplot(Walc~Pstatus,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~Pstatus,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-25-1.png)<!-- -->


Si salen con amigos

```r
par(mfrow=c(1,2))
boxplot(Walc~goout,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~goout,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-26-1.png)<!-- -->

Parece que los que más salen, beben más los fines de semana. 




```r
par(mfrow=c(1,2))
boxplot(Walc~studytime,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~studytime,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-27-1.png)<!-- -->

Los que menos estudian, beben más los fines de semana.




```r
par(mfrow=c(1,2))
boxplot(Walc~famrel,data=students,  main="Boxplot Weekend Alcohol", ylab="Weekend Alcohol",col=(c("red","blue")))
boxplot(Dalc~famrel,data=students,  main="Boxplot Weekdays Alcohol", ylab="Weekdays Alcohol",col=(c("red","blue")))
```

![](student-alcohol-consumption_files/figure-html/unnamed-chunk-28-1.png)<!-- -->

Los que tienen buena relación con la familia no beben a diario. 






#Backup Goyo

Despu?s de hacer varias pruebas quitando y poniendo variables, he llegado a la conclusi?n de asumir todas como comunes para estudiantes que se encuentran en las dos clases excepto las notas (G1, G2 y G3).
Es decir, asumimos que alumnos cuyo todo conjunto de variables menos las notas es igual en los dos ficheros, se trata del mismo alumno. Haci?ndolo de este modo quedan:

```r
# 100 alumnos que dan matem?ticas y portugu?s 
nrow(students[!is.na(students$G1.x) & !is.na(students$G1.y),])
```

```
## [1] 0
```

```r
# 295 alumnos que dan s?lo matem?ticas
nrow(students[!is.na(students$G1.x) & is.na(students$G1.y),])
```

```
## [1] 0
```

```r
# 549 alumnos que dan s?lo portugu?s
nrow(students[is.na(students$G1.x) & !is.na(students$G1.y),])
```

```
## [1] 0
```

```r
# 0 datos an?malos (que no est?n en ninguna de las dos clases)
nrow(students[is.na(students$G1.x) & is.na(students$G1.y),])
```

```
## [1] 0
```
Tras tener este dataset, nuestros objetivos pueden ser ver c?mo influyen ciertos factores sociales (tiempo libre, familia, etc) en dos cosas:
- Consumo de alcohol del alumno
- Calificaciones del alumno
(y la una sobre la otra seg?n que caso)

Se me ocurre que de este dataset se puede tambi?n estudiar por ejemplo las calificaciones del alumno por campo (técnico - matemáticas - y humanidades - portugués). Aún así, teniendo en cuenta los dos puntos anteriores, veo más sentido tener una media de las calificaciones en total que aplicaría de la siguiente forma:
========
OPCIÓN A
========
- Para los alumnos que están en matemáticas, la media de las tres evaluaciones como calificacion_tec
- Para los alumnos que están en portugués, la media de las tres evaluaciones como calificacion_hum
- Para los alumnos que están en ambas clases, la media de calificacion_tec y calificacion_hum como calificacion_total
- Los alumnos que no apliquen en calificacion_tec o calificacion_mat, 'NA' como valor, y calificacion_total tambi?n 'NA'

Creo que así cubriríamos bastante terreno según lo que queramos hacer. Aún así, algo más simple si no nos interesa la calificación por campos/asignaturas, puede ser:
========
OPCIÓN B
========
- Para los alumnos que están en matemáticas, la media de las tres evaluaciones como calificacion_total
- Para los alumnos que están en portugués, la media de las tres evaluaciones como calificacion_total

De esta última forma queda un dataset más "limpio". Dime qué opinas. De momento dejo los datasets en dos variables y luego ya elegimos:


```r
students_a <- students.both
students_a$calificacion_tec <- (students_a$G1.x + students_a$G2.x + students_a$G3.x) / 3
students_a$calificacion_hum <- (students_a$G1.y + students_a$G2.y + students_a$G3.y) / 3
students_a$calificacion_total <- (students_a$calificacion_tec + students_a$calificacion_hum) / 2

students_b <- students.both
students_b$calificacion_total <- ifelse(!is.na(students_a$calificacion_tec), students_a$calificacion_tec, students_a$calificacion_hum)


summary(students_a)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:287   F:174   Min.   :15.00   R: 67   GT3:230   A: 31  
##  MS: 33   M:146   1st Qu.:16.00   U:253   LE3: 90   T:289  
##                   Median :16.00                            
##                   Mean   :16.52                            
##                   3rd Qu.:17.00                            
##                   Max.   :22.00                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home : 44   at_home : 14  
##  1st Qu.:2.000   1st Qu.:2.000   health  : 30   health  : 15  
##  Median :3.000   Median :3.000   other   :116   other   :177  
##  Mean   :2.872   Mean   :2.622   services: 75   services: 87  
##  3rd Qu.:4.000   3rd Qu.:4.000   teacher : 55   teacher : 27  
##  Max.   :4.000   Max.   :4.000                                
##         reason    nursery   internet    traveltime       failures      
##  course    :118   no : 59   no : 48   Min.   :1.000   Min.   :0.00000  
##  home      : 87   yes:261   yes:272   1st Qu.:1.000   1st Qu.:0.00000  
##  other     : 30                       Median :1.000   Median :0.00000  
##  reputation: 85                       Mean   :1.428   Mean   :0.08125  
##                                       3rd Qu.:2.000   3rd Qu.:0.00000  
##                                       Max.   :4.000   Max.   :3.00000  
##  schoolsup activities higher    romantic      famrel         freetime    
##  no :277   no :150    no :  7   no :221   Min.   :1.000   Min.   :1.000  
##  yes: 43   yes:170    yes:313   yes: 99   1st Qu.:4.000   1st Qu.:3.000  
##                                           Median :4.000   Median :3.000  
##                                           Mean   :3.987   Mean   :3.203  
##                                           3rd Qu.:5.000   3rd Qu.:4.000  
##                                           Max.   :5.000   Max.   :5.000  
##      goout            Dalc            Walc           health     
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:3.000  
##  Median :3.000   Median :1.000   Median :2.000   Median :4.000  
##  Mean   :3.069   Mean   :1.438   Mean   :2.225   Mean   :3.522  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##   guardian.x   studytime.x    famsup.x  paid.x      absences.x    
##  father: 74   Min.   :1.000   no :117   no :160   Min.   : 0.000  
##  mother:237   1st Qu.:1.000   yes:203   yes:160   1st Qu.: 0.000  
##  other :  9   Median :2.000                       Median : 4.000  
##               Mean   :2.084                       Mean   : 5.412  
##               3rd Qu.:3.000                       3rd Qu.: 7.250  
##               Max.   :4.000                       Max.   :75.000  
##       G1.x            G2.x            G3.x        guardian.y 
##  Min.   : 5.00   Min.   : 0.00   Min.   : 0.00   father: 74  
##  1st Qu.: 9.00   1st Qu.: 9.00   1st Qu.: 9.00   mother:237  
##  Median :11.00   Median :11.00   Median :11.00   other :  9  
##  Mean   :11.29   Mean   :11.18   Mean   :11.04               
##  3rd Qu.:14.00   3rd Qu.:14.00   3rd Qu.:14.00               
##  Max.   :19.00   Max.   :19.00   Max.   :20.00               
##   studytime.y    famsup.y  paid.y      absences.y          G1.y      
##  Min.   :1.000   no :117   no :300   Min.   : 0.000   Min.   : 0.00  
##  1st Qu.:1.000   yes:203   yes: 20   1st Qu.: 0.000   1st Qu.:11.00  
##  Median :2.000                       Median : 2.000   Median :12.00  
##  Mean   :2.084                       Mean   : 3.247   Mean   :12.39  
##  3rd Qu.:3.000                       3rd Qu.: 4.000   3rd Qu.:14.00  
##  Max.   :4.000                       Max.   :32.000   Max.   :19.00  
##       G2.y            G3.y       calificacion_tec calificacion_hum
##  Min.   : 5.00   Min.   : 0.00   Min.   : 2.00    Min.   : 4.00   
##  1st Qu.:11.00   1st Qu.:11.00   1st Qu.: 9.00    1st Qu.:11.00   
##  Median :12.00   Median :13.00   Median :11.00    Median :12.67   
##  Mean   :12.57   Mean   :12.88   Mean   :11.17    Mean   :12.62   
##  3rd Qu.:14.00   3rd Qu.:15.00   3rd Qu.:13.67    3rd Qu.:14.33   
##  Max.   :19.00   Max.   :19.00   Max.   :19.33    Max.   :18.67   
##  calificacion_total
##  Min.   : 4.00     
##  1st Qu.:10.00     
##  Median :11.67     
##  Mean   :11.89     
##  3rd Qu.:13.83     
##  Max.   :18.33
```

```r
summary(students_b)
```

```
##  school   sex          age        address famsize   Pstatus
##  GP:287   F:174   Min.   :15.00   R: 67   GT3:230   A: 31  
##  MS: 33   M:146   1st Qu.:16.00   U:253   LE3: 90   T:289  
##                   Median :16.00                            
##                   Mean   :16.52                            
##                   3rd Qu.:17.00                            
##                   Max.   :22.00                            
##       Medu            Fedu             Mjob           Fjob    
##  Min.   :0.000   Min.   :0.000   at_home : 44   at_home : 14  
##  1st Qu.:2.000   1st Qu.:2.000   health  : 30   health  : 15  
##  Median :3.000   Median :3.000   other   :116   other   :177  
##  Mean   :2.872   Mean   :2.622   services: 75   services: 87  
##  3rd Qu.:4.000   3rd Qu.:4.000   teacher : 55   teacher : 27  
##  Max.   :4.000   Max.   :4.000                                
##         reason    nursery   internet    traveltime       failures      
##  course    :118   no : 59   no : 48   Min.   :1.000   Min.   :0.00000  
##  home      : 87   yes:261   yes:272   1st Qu.:1.000   1st Qu.:0.00000  
##  other     : 30                       Median :1.000   Median :0.00000  
##  reputation: 85                       Mean   :1.428   Mean   :0.08125  
##                                       3rd Qu.:2.000   3rd Qu.:0.00000  
##                                       Max.   :4.000   Max.   :3.00000  
##  schoolsup activities higher    romantic      famrel         freetime    
##  no :277   no :150    no :  7   no :221   Min.   :1.000   Min.   :1.000  
##  yes: 43   yes:170    yes:313   yes: 99   1st Qu.:4.000   1st Qu.:3.000  
##                                           Median :4.000   Median :3.000  
##                                           Mean   :3.987   Mean   :3.203  
##                                           3rd Qu.:5.000   3rd Qu.:4.000  
##                                           Max.   :5.000   Max.   :5.000  
##      goout            Dalc            Walc           health     
##  Min.   :1.000   Min.   :1.000   Min.   :1.000   Min.   :1.000  
##  1st Qu.:2.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:3.000  
##  Median :3.000   Median :1.000   Median :2.000   Median :4.000  
##  Mean   :3.069   Mean   :1.438   Mean   :2.225   Mean   :3.522  
##  3rd Qu.:4.000   3rd Qu.:2.000   3rd Qu.:3.000   3rd Qu.:5.000  
##  Max.   :5.000   Max.   :5.000   Max.   :5.000   Max.   :5.000  
##   guardian.x   studytime.x    famsup.x  paid.x      absences.x    
##  father: 74   Min.   :1.000   no :117   no :160   Min.   : 0.000  
##  mother:237   1st Qu.:1.000   yes:203   yes:160   1st Qu.: 0.000  
##  other :  9   Median :2.000                       Median : 4.000  
##               Mean   :2.084                       Mean   : 5.412  
##               3rd Qu.:3.000                       3rd Qu.: 7.250  
##               Max.   :4.000                       Max.   :75.000  
##       G1.x            G2.x            G3.x        guardian.y 
##  Min.   : 5.00   Min.   : 0.00   Min.   : 0.00   father: 74  
##  1st Qu.: 9.00   1st Qu.: 9.00   1st Qu.: 9.00   mother:237  
##  Median :11.00   Median :11.00   Median :11.00   other :  9  
##  Mean   :11.29   Mean   :11.18   Mean   :11.04               
##  3rd Qu.:14.00   3rd Qu.:14.00   3rd Qu.:14.00               
##  Max.   :19.00   Max.   :19.00   Max.   :20.00               
##   studytime.y    famsup.y  paid.y      absences.y          G1.y      
##  Min.   :1.000   no :117   no :300   Min.   : 0.000   Min.   : 0.00  
##  1st Qu.:1.000   yes:203   yes: 20   1st Qu.: 0.000   1st Qu.:11.00  
##  Median :2.000                       Median : 2.000   Median :12.00  
##  Mean   :2.084                       Mean   : 3.247   Mean   :12.39  
##  3rd Qu.:3.000                       3rd Qu.: 4.000   3rd Qu.:14.00  
##  Max.   :4.000                       Max.   :32.000   Max.   :19.00  
##       G2.y            G3.y       calificacion_total
##  Min.   : 5.00   Min.   : 0.00   Min.   : 2.00     
##  1st Qu.:11.00   1st Qu.:11.00   1st Qu.: 9.00     
##  Median :12.00   Median :13.00   Median :11.00     
##  Mean   :12.57   Mean   :12.88   Mean   :11.17     
##  3rd Qu.:14.00   3rd Qu.:15.00   3rd Qu.:13.67     
##  Max.   :19.00   Max.   :19.00   Max.   :19.33
```

# Preparación de datos para ver si existen agrupaciones claras según ciertas variables

km_data <- students_b
km_data$studytime.x <- NULL
km_data$studytime.y <- NULL
km_data$failures.x <- NULL
km_data$failures.y <- NULL
km_data$paid.x <- NULL
km_data$paid.y <- NULL
km_data$G1.y <- NULL
km_data$G2.y <- NULL
km_data$G3.y <- NULL
km_data$G1.x <- NULL
km_data$G3.x <- NULL
km_data$G2.x <- NULL
km_data$studytime.x <- NULL
km_data$studytime.y <- NULL
km_data$failures.x <- NULL
km_data$failures.y <- NULL
summary(km_data)

# Seguir preparando datos y haciendo pruebas


