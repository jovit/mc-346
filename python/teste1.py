def getMax(l):
    dic = {key : 0 for key in l}
    for e in l: 
        dic[e] += 1
    
    return max(dic, key=dic.get)


print(getMax([1,2,3,4,5,6,2,6,6,6,6]))