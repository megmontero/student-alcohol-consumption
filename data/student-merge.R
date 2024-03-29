library(Rcmdr, quietly = TRUE)

# Change depending on your working directory
working_directory <- "F:/Drive/M�ster Data Science/Tipolog�a y ciclo de la vida de los datos/PRAC2/student-alcohol-consumption/data"
setwd(working_directory)


students_mat <- read.table("student-mat.csv", header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
students_por <- read.table("student-por.csv", header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)


students_both <- merge(students_mat, students_por, by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))

print(nrow(students_both))

summary(students_mat)
summary(students_por)
summary(students_both)

write.table(students_both, "students_both.csv", sep=",", col.names=TRUE, row.names=TRUE, quote=TRUE, na="NA")