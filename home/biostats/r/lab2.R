raw = "id,dur.stay,age,sex,temp,wbc,antibiot
1,5,30,F,99,8,N
2,10,73,F,98,5,N
3,6,40,F,99,12,N
4,11,47,F,98.2,4,N
5,5,25,F,98.5,11,N
6,14,82,M,96.8,6,Y
7,30,60,M,99.5,8,Y
8,11,56,F,98.6,7,N
9,17,43,F,98,7,N
10,3,50,M,98,12,N
11,9,59,F,97.6,7,N
12,3,4,M,97.8,3,N
13,8,22,F,99.5,11,Y
14,8,33,F,98.4,14,Y
15,5,20,F,98.4,11,N
16,5,32,M,99,9,N
17,7,36,M,99.2,6,N
18,4,69,M,98,6,N
19,3,47,M,97,5,Y
20,7,22,M,98.2,6,N
21,9,11,M,98.2,10,N
22,11,19,M,98.6,14,Y
23,11,67,F,97.6,4,N
24,9,43,F,98.6,5,N
25,4,41,F,98,5,N"
fakefile = textConnection(raw)
data = read.csv(fakefile, header=TRUE)
print(data)
hist(data$age, xlab="Age (years)")
boxplot(data$age, ylab="Age (years)")
boxplot(data$dur.stay, ylab="Stay duration (days)")
hist(data$dur.stay, xlab="Stay duration (days)")
quantile(data$age)
mean(data$age)
sd(data$age)
var(data$age)
summary(data$age)
length(data$age[data$age > 20.2 & data$age < 60.1])
sort(data$temp)
quantile(data$temp)
plot(ecdf(data$temp), xlab="temp (F)", ylab="Cumul. Freq.", verticals=TRUE)
prop.table(table(data$antibiot))
boxplot(data$wbc[data$antibiot == "Y"], data$wbc[data$antibiot == "N"])
