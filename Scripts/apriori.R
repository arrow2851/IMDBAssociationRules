library("arules")
# min sup 0.3%, 0.7%, 1.2%
# min confidence 0.5, 0.7, 0.8

basket.data = read.transactions("processed-data.csv", quote = "", format = "basket", cols=c(1) , sep = ",", header = TRUE, rm.duplicates = TRUE)

# 
# data.rules <- apriori(basket.data, parameter = list(supp = 0.003, conf = 0.5, target = "rules"))
# 
# inspect(data.rules)
frequentItems <- apriori(basket.data, parameter = list(supp = 0.003, target = "frequent itemsets"))

df1 = as(frequentItems, "data.frame")
frequentItems <- apriori(basket.data, parameter = list(supp = 0.007, target = "frequent itemsets"))

df2 = as(frequentItems, "data.frame")
frequentItems <- apriori(basket.data, parameter = list(supp = 0.012, target = "frequent itemsets"))

df3 = as(frequentItems, "data.frame")



data.rules = apriori(basket.data, parameter = list(supp = 0.003, conf = 0.4, target = "rules"))
r1 = as(data.rules, "data.frame")
data.rules = apriori(basket.data, parameter = list(supp = 0.007, conf = 0.45, target = "rules"))
r2 = as(data.rules, "data.frame")
data.rules = apriori(basket.data, parameter = list(supp = 0.012, conf = 0.5, target = "rules"))
r3 = as(data.rules, "data.frame")


# write.table(df1,"frequent003.txt", sep = ";", quote = FALSE ,row.names = FALSE)
# write.table(df2,"frequent007.txt", sep = ";", quote = FALSE ,row.names = FALSE)
# write.table(df3,"frequent012.txt", sep = ";", quote = FALSE ,row.names = FALSE)

write.table(r1,"rules003.csv", quote = FALSE ,row.names = FALSE)
write.table(r2,"rules007.csv", quote = FALSE ,row.names = FALSE)
write.table(r3,"rules012.csv", quote = FALSE ,row.names = FALSE)