# 2000 to 2008 and 2014 to 2018


# To find: Top 5 rules each with lift > 1, < 1, and = 1

# TODO:
# 1. Pre-process the data files into a single file in appropriate format for input to the association rule mining program [10 pts] and do the following for complete submission:
#   I. For your data set, for each min_sup value given, plot how the candidate itemsets and frequent itemsets change over iterations.
# If you can, plot all of these in one plot with each bar with different colors for each iteration. Analyze the results. [20 pts]
# II. Do the above for frequent itemset. In fact, you can do one plot indicating all of the above. Analyze the results. [20 pts]
# III. Generate rules for each specified min_conf (for each min_sup).
# Plot the number of rules generated with min_sup on X-axis and min_conf on Y-axis. Provide its analysis in the report. [10 pts]
# IV. Filter 5 rules each for lift > 1, Lift < 1, and lift = 1 and provide their analysis in the report [10 pts]
# V. Visualize all (or top 100 by in descending order of min_conf) and the rules in IV above
library("arules")

part1.g = read.delim("1999-2008-genre.txt",quote = "", sep = ";",header = TRUE)
part1.a = read.delim("1999-2008-actor.txt", quote = "", sep = ";",header = TRUE)
part2.g = read.delim("2014-2018-genre.txt",quote = "", sep = ";",header = TRUE)
part2.a = read.delim("2014-2018-actor.txt",quote = "", sep = ";",header = TRUE)
gen.data = rbind(part1.g,part2.g)
actor.data = rbind(part1.a,part2.a)
actor.data = actor.data[!grepl("?", actor.data$ACTOR, fixed = TRUE),]
actor.data2 = aggregate(ACTOR ~ TID, data = actor.data,paste, collapse = ",")
total.data = merge(gen.data,actor.data2, by = "TID")
total.data = total.data[!(total.data$YEAR<2000 | (total.data$YEAR>2008 & total.data$YEAR<2014)),]

write.csv(total.data,"processed-data.csv", quote = FALSE ,row.names = FALSE)
