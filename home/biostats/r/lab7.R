last.digits = c(5, 8, 4, 0, 0, 5, 0, 3, 4, 0, 0, 9, 5, 5, 8, 0, 0, 0, 5, 0, 
                8, 5, 7, 0, 0, 5, 0, 5, 4, 0, 0, 5, 0, 7, 0, 5, 7, 0, 0, 0, 
                5, 5, 5, 5, 0, 5, 5, 0, 5, 0, 5, 1, 9, 4, 0, 0, 0, 0, 2, 5, 
                0, 5, 0, 0, 7, 5, 8, 8, 8, 0, 5, 0, 8, 0, 0, 0, 5, 5, 6, 0)
hist(last.digits) ;
ldt = table(last.digits) ;
print("In tabular form:") ; print(ldt) ;

n = length(last.digits) ;
expected.prop = 1/10 ;
expected.n = rep(n*expected.prop, 10) ;
print("The expected numbers are: "); print(expected.n);

observed.n = as.vector(ldt) ;
grouped = rbind(observed.n, expected.n) ;
barplot(grouped, beside=T, names.arg=0:9,
        ylab="number", xlab="last digit") ;

chi.sq.terms = ((observed.n - expected.n)^2)/expected.n
print("The terms of the chi-sq test statistic are:"); print(chi.sq.terms)

chi.sq = sum(chi.sq.terms) ;
print("The test stat =") ; print(chi.sq) ;
df = 9 ;
p.val = pchisq(chi.sq, df=df, lower.tail=F) ;
print("The approx. P-value = "); print(p.val) ;

chisq.test(x=observed.n, p=expected.n/n) ;

chisq.test(x=c(107, 70, 23), p=c(.5, 1.0/3, 1.0/6)) ;

raw = "n.women	n.classes
0	5
1	15
2	81
3	180
4	288
5	259
6	133
7	39" ;
fakefile = textConnection(raw)
s = read.csv(fakefile, sep="\t", header=TRUE)
barplot(s$n.classes, names.arg = s$n.women, ylab="# of classes")

expected.class.p = dbinom(0:7, size=7, p=0.6);
expected.class.n = 1000*expected.class.p ;
print("The expected numbers in each category are:"); print(expected.class.n);

chisq.test(x=s$n.classes, p=expected.class.p) ;

calls = data.frame(issue=c("drug", "sex", "stress", "education"), counts=c(34, 30, 26, 30));
chisq.test(x=calls$counts, p=c(.4, .25, .25, .1));

