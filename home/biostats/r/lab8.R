# tc = c(rep("none", 26), rep("many", 18), rep("one", 23)) ;
# crusher = c(rep("right", 2), rep("left", 4), rep("neither", 20),
#             rep("right", 8), rep("left", 9), rep("neither", 1),
#             rep("right", 7), rep("left", 9), rep("neither", 7)) ;
# data = data.frame(chips=tc, crusher=crusher) ;
# tab.data = table(data$chips, data$crusher) ;
# print(tab.data) ;
# 
# none.row = c(2, 4, 20)
# many.row = c(8, 9, 1)
# one.row = c(7, 9, 7)
# none.sum = sum(none.row)
# many.sum = sum(many.row)
# one.sum = sum(one.row)
# grand.sum = sum(none.sum, many.sum, one.sum)
# col.s = 0
# for (i in 1:3) {
#     col.s[i] = none.row[i] + many.row[i] + one.row[i]
# }
# expected = c(rep(none.s, 3), rep(many.s, 3), rep(one.s, 3))*col.s/grand.s
# observed = c(none.row, many.row, one.row)
# c2 = sum((observed - expected)^2/expected)
# 
# chisq.test(tab.data)

data.vec = c(2, 4, 20, 8, 9, 1, 7, 9, 7) ;
observed = matrix(data.vec, 3, 3, byrow=TRUE) ;
print("The observations were:"); print(observed);

row.sum = c() ;
col.sum = c() ;
for (i in 1:3) {
  row.sum[i] = sum(observed[i,]) ;
  col.sum[i] = sum(observed[,i]) ;
}
print("The row sums are:"); print(row.sum) ;
print("The column sums are:"); print(col.sum) ;
grand.sum = sum(row.sum)
print("The grand sum is:"); print(grand.sum) ;

expected = matrix(nrow = 3, ncol=3)
for (i in 1:3) {
  for (j in 1:3) {
    expected[i,j] = row.sum[i] * col.sum[j] / n ;
  }
}
print("The expected number are:"); print(expected);

c2terms = ((observed - expected)^2)/expected
print("The terms of the chi-sq test stat are:"); print(c2terms);
c2 = sum(c2terms)
print("The chi-sq test stat is:"); print(c2);

p.val = pchisq(c2, df=df, lower.tail=F) ;
print("The approx. P-value = "); print(p.val) ;

chisq.test(observed) ;

data <- read.csv(url("http://phylo.bio.ku.edu/biostats/Lab8restraints.csv"))
dt = table(data$restraint, data$status) ;
print("The observed counts are:") ; print(dt) ;
chisq.test(dt) ;
