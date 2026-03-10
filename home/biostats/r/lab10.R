raw = "group,before,after
A,19,40
B,77,8
C,11,50
D,28,40
E,42,0
F,85,7
G,90,23
H,12,18
I,78,14
J,50,25
K,62,9
L,50,41"
fakefile = textConnection(raw)
data = read.csv(fakefile, header=TRUE)
print(data)

hist(data$before - data$after, xlab="Change in # of mosquitoes (before - after)") ;

t.test(data$before - data$after, mu=0)

t.test(data$before, data$after, mu=0, paired=TRUE) ;

axr = c(0, max(c(data$before, data$after)))
plot(data$before, data$after, xlab="before", ylab="after", xlim=axr, ylim=axr);
abline(0, 1);

raw = "months.driving,post.hippo.diff,ant.hippo
54,-2.4,110.68
60,0.35,97.55
62,-0.44,95.85
67,-3.53,114.55
72,-1.68,90.29
90,-4.05,115.63
102,-1.33,114.08
139,-4.77,111.77
223,-3.88,71.59
258,0,103.58
258,-2.2,71.59
272,0.07,84.26
272,1.41,69.89
340,3.09,85.96
349,3.98,96.93" ;
fakefile = textConnection(raw) ;
data = read.csv(fakefile, header=TRUE) ;
print(data) ;

plot(data$months.driving, data$post.hippo.diff, xlab="months as taxi driver", ylab="Posterior hippocampus difference.") ;

lt = data$post.hippo.diff[data$months.driving < 180] ;
geq = data$post.hippo.diff[data$months.driving >= 180] ;
boxplot(lt, geq, names = c("<15 yrs", ">= 15 yrs"), ylab="post.hippo.diff")

require(pastecs)
stat.desc(lt)
stat.desc(geq)
qqnorm(lt) ;
qqnorm(geq) ;
