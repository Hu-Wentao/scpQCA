# pban test
library(cna)
cna(d.pban, cov = .95, maxstep = c(6, 6, 10))

library(QCApro)
eQMC(data = d.pban, outcome="PB", n.cut = .8, incl.cut1 = .8, incl.cut0 = 1)
