# sort l,r array in ascending order of l, and break tie by arranging in descending order of r
l = [ 1,1,2,3,5, 10, 13,14]
r = [4,2,3,7,8, 12, 15, 14]
int_min = -100
int_max = 100
n = l.__len__()
cover = [(l[0], r[0])]
min = r[0]
i = 1
while i < n:
    max = int_min
    max_index = -1
    while i < n and l[i] <= min:
        if r[i] > max and r[i] > min:
            max = r[i]
            max_index = i
        i += 1
    if max_index != -1:
        cover.append((l[max_index], r[max_index]))
        min = r[max_index]
    else:
        if i==n:
            break
        min = r[i]
        cover.append((l[i], r[i]))
        i+=1

        
        
print(cover)








