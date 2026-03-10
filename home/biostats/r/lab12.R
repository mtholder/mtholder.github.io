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
plot(data$months.driving, data$post.hippo.diff,
     xlab="months as taxi driver",
     ylab="Posterior hippocampus deviation (cubic mm)");

lin.mod = lm(post.hippo.diff ~ months.driving, data=data) ;

plot(resid(lin.mod) ~ data$months.driving,
     xlab="months driving",
     ylab="post.hippo residual (cu. mm)");
abline(h=0);

cor(data$months.driving, data$post.hippo.diff) ;
cor.test(data$months.driving, data$post.hippo.diff) ;

