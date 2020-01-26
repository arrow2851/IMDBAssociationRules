
library("arules")
library("arulesViz")
# min sup 0.3%, 0.7%, 1.2%
# min confidence 0.5, 0.7, 0.8

basket.data = read.transactions("processed-data.csv", quote = "", format = "basket", cols=c(1) , sep = ",", header = TRUE, rm.duplicates = TRUE)

r11 = apriori(basket.data, parameter = list(supp = 0.003, conf = 0.4, target = "rules"))
r12 = apriori(basket.data, parameter = list(supp = 0.003, conf = 0.45, target = "rules"))
r13 = apriori(basket.data, parameter = list(supp = 0.003, conf = 0.5, target = "rules"))

r21 = apriori(basket.data, parameter = list(supp = 0.007, conf = 0.4, target = "rules"))
r22 = apriori(basket.data, parameter = list(supp = 0.007, conf = 0.45, target = "rules"))
r23 = apriori(basket.data, parameter = list(supp = 0.007, conf = 0.5, target = "rules"))

r31 = apriori(basket.data, parameter = list(supp = 0.012, conf = 0.4, target = "rules"))
r32 = apriori(basket.data, parameter = list(supp = 0.012, conf = 0.45, target = "rules"))
r33 = apriori(basket.data, parameter = list(supp = 0.012, conf = 0.5, target = "rules"))



#Supp = 0.003
print(length(r11))
print(length(r12))
print(length(r13))

#Support = 0.007
print(length(r21))
print(length(r22))
print(length(r23))

#Support = 0.012
print(length(r31))
print(length(r32))
print(length(r33))


all.rules = unique(c(r11,r12,r13,r21,r22,r23,r31,r32,r33))

all.rules.hilift = sort(all.rules, by="lift", decreasing = TRUE)
all.rules.lowlift = sort(all.rules, by="lift", decreasing = FALSE)
print("High lift")
inspect((all.rules.hilift[1:5]))
mid.range = 33:38
mid.range = mid.range[!(mid.range == 35)]

print("Low lift")
inspect((all.rules.lowlift[1:5]))

print("Lift = 1")
inspect(all.rules.hilift[mid.range])

plot(sort(all.rules, by = "confidence", decreasing = TRUE), method = "grouped", measure = "confidence", main="Grouped All Rules by confidence")
plot(all.rules.hilift[1:5], method = "grouped", measure = "confidence",main="Grouped Top 5 Rules by Lift")
plot(all.rules.lowlift[1:5], method = "grouped", measure = "confidence", main="Grouped Bottom 5 Rules by Lift")
plot(all.rules.hilift[mid.range], method = "grouped", measure = "confidence", main="Grouped Rules with Lift closest to 1")



itemFrequencyPlot(basket.data,support = 0.003,horiz = TRUE,topN = 37,col="blue", type="relative", main="Item Frequency")
itemFrequencyPlot(basket.data,support = 0.007,horiz = TRUE,topN = 37,col = "purple", type="relative", main="Item Frequency")
itemFrequencyPlot(basket.data,support = 0.012,horiz = TRUE,topN = 37,col = "red", type="relative", main="Item Frequency")
