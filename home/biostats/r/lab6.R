x = 8
n = 20
p = .65
dbinom(x, n, p)
domain = 0:n
null.dist = dbinom(domain, n, p)
print(paste(c("The null distribution is: ", null.dist)))
barplot(null.dist, names.arg=domain)
expected = n*p
print(paste(c("The expected value under the null is: ", expected)))

obs.diff = x - expected
print(paste("The difference between the observed # and the expected was", obs.diff))

as.extreme = abs(domain - expected) >= abs(obs.diff)
print("The tails of the distribution will correspond to TRUE values:")
print(as.extreme)

col = c("white", "red")
x.col = col[1 + as.numeric(as.extreme)]
barplot(null.dist, names.arg=domain, col=x.col)

prob.as.extreme = sum(null.dist[as.extreme])
print(paste("If the null is true, the prob. of a result at least as extreme as",
            x, "is", prob.as.extreme))

print(paste("Pr(x <= 8) =", pbinom(8, 20, 0.65)))
print(paste("Pr(x > 17) =", 1 - pbinom(17, 20, 0.65)))
print(paste("Pr(in tails) =", 1 + pbinom(8, 20, 0.65) - pbinom(17, 20, 0.65)))

