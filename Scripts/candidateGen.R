library("arules")
library("stringi")


calc.nth.itemsets <-function(fileName)
{
df = read.delim(fileName, header = TRUE, sep = ";", quote = "")

df = df$items
df =  gsub("\\{|\\}", "", as.character(df) )

clist = character()
c1 = character()
c2 = character()
c3 = character()
c4 = character()
c5 = character()
c6 = character()
c7 = character()
for (i in 0:10) {
  flist = df[str_count(df,",") == i]
  if (length(flist) == 0) {
    break
    
  }
  if(i == 0){
    c1 = flist    }
  for (f1 in flist) {

    
    list.pos1 = which(flist == f1)
    index1 = stri_locate_last(f1,regex = ",")
    sub.check1 = substr(f1,start = 1, stop = index1[1])
    for (f2 in flist) {
      list.pos2 = which(flist == f2)
      if (identical(f1,f2)) {
        next
      }
      if(list.pos1>=list.pos2){
        next
      }
      #get index of last ,
      index2 = stri_locate_last(f2,regex = ",")
      if (is.na(index2[1])) {
        sub.res = paste(f1,f2,sep = ",")
        clist = append(clist,sub.res)
        c2 = append(c2,sub.res)
      }
      else{
        sub.check2 = substr(f2,start = 1,stop = index2[1])
        if (identical(sub.check1,sub.check2)) {
          remaining.sub = substr(f2, start = index2[1], stop = str_length(f2))
          sub.res = paste(f1,remaining.sub,sep = "")
          clist = append(clist, sub.res)
          if (i ==1) {
            c3 = append(c3,sub.res)
          }
          if (i==2) {
            c4 = append(c4,sub.res)
          }
          if (i == 3) {
            c5 = append(c5,sub.res)
          }
          if (i == 4) {
            c6 = append(c6,sub.res)
          }
          if (i == 5) {
            c7 = append(c7,sub.res)
          }
          
          
        }
      }
    }

    
  }
  
}

print(fileName)
print(" n(C1 - C7) Items =")
print(length(c1))
print(length(c2))
print(length(c3))
print(length(c4))
print(length(c5))
print(length(c6))
print(length(c7))

print(" n(F1 - F7) Items =")
for(x in 0:6)
{
  print(length(df[str_count(df,",") == x]))
}
}


calc.nth.itemsets("frequent003.txt")
calc.nth.itemsets("frequent007.txt")
calc.nth.itemsets("frequent012.txt")

# basket.data = read.transactions("processed-data.csv", quote = "", format = "basket", cols=c(1) , sep = ",", header = TRUE, rm.duplicates = TRUE)

# 
# data.rules <- apriori(basket.data, parameter = list(supp = 0.003, conf = 0.5, target = "rules"))
# 
# inspect(data.rules)
# frequentItems1 <- apriori(basket.data, parameter = list(supp = 0.003, minlen = 1, maxlen = 1, target = "frequent itemsets"))
# inspect((frequentItems1))
# df = as(frequentItems1,"data.frame")
# df = df$items
# x = cross2(df,df)
# print(matrix(x))


# df1 = as(frequentItems, "data.frame")
# frequentItems <- apriori(basket.data, parameter = list(supp = 0.007, target = "frequent itemsets"))
# 
# df2 = as(frequentItems, "data.frame")
# frequentItems <- apriori(basket.data, parameter = list(supp = 0.012, target = "frequent itemsets"))
# 
# df3 = as(frequentItems, "data.frame")



