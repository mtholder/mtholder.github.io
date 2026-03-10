raw = "species,asymmetry
Pareas stanleyi,8.048
P. nuchalis,10.916
P. margaritophorus,12.191
P. macularius,16.813
P. iwasaki,17.45
P. hamptoni,8.845
P. formosensis,15.857
P. chinensis,14.422
P. carinatus,10.916
P. bolengeri,10.438
Asthenodipsas vertebralis,16.255
Asthenodipsas laevis,17.371"
fakefile = textConnection(raw)
data = read.csv(fakefile, header=TRUE)
print(data)

summary(data$asymmetry) ;
sd(data$asymmetry) ;
require(pastecs) ;
stat.desc(data$asymmetry) ;

hist(data$asymmetry) ;

t.test(data$asymmetry, mu=0.0) ;