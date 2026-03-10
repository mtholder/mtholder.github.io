data <- read.csv(url("http://phylo.bio.ku.edu/biostats/Lab3.csv"))
require(pastecs)
stat.desc(d$s10)

r = subset(data, data$s1>0, select=2:27)
for (i in 1:26) {
  samp = r[[i]] ;
  meanv[i] = mean(samp) ; 
  sdv[i] = sd(samp) ;
}
n = 20
se.v = sdv/sqrt(n)
moe.v = 2*se.v
lower.ci.v = meanv - moe.v
upper.ci.v = meanv + moe.v
contains.true.val = lower.ci.v < true.val & true.val < upper.ci.v
print(paste(sum(contains.true.val), " of the 26 CIs contained the true mean"))
s.contains.true.val = 0
s.mean = 0
s.up = 0
s.lo = 0
s.n = 80
s.se = 0
reps = 1:100
for (i in reps) {
  s.sample = sample(data$pop, s.n) ;
  ms = mean(s.sample) ;
  s.mean[i] = ms ;
  s.se[i] = sd(s.sample)/sqrt(s.n) ;
  s.up[i] = ms + 2*s.se[i] ;
  s.lo[i] = ms - 2*s.se[i] ;
  s.contains.true.val[i] = s.lo[i] < true.val & true.val < s.up[i]
}
print(paste(sum(s.contains.true.val), " of the 100 CIs contained the true mean"))

print(paste(sum(sim.contains.true.val), " of the 100 CIs contained the true mean"))
# plot each mean against its rep number
plot(reps, sim.mean, ylim=c(min(s.lo), max(s.up)), ylab="mean", xlab="sim. rep. #")
# we already figured which CIs overlap with the true value, and plot those segments.
excl = !sim.contains.true.val
segments(reps[excl], s.lo[excl], reps[excl], s.up[excl])
# we can make a line corresponding to the y-intercept of the true value with slope=0
abline(a=true.val, b=0)
