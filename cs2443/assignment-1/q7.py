a = [1,-5,1,-5,9,-5,1,-5,1]
a = [3,-5,7,-4,1,-8,3,-7,5,-9,5,-2,4]
n = a.__len__()

# finding the last positive element
m = 0

# This step takes O(n) time in worst case
# -------------------------------
for i in range(n-1,-1,-1):      
    if a[i]>0:
        m = i
        break
# -------------------------------

# initializing
start, final = 0, 0

# we will start with first element, then check the sum of every interval
# that starts at first element
# we will update the final till it becomes n
# turn will store the last element which changed the sign of sum

intervals = []

#----------------------------------------------------------------------------
while final != m :
    s = 0
    # If there are k intervals, then this step will be repeated k times
    # it requires O(n) time for each step
    for i in range(start,m+1):
        s += a[i]
        # so if sum is positive
        # and element is also positive, then we can include it
        # for the ending of this interval
        # we will still look for bigger interval
        # if we can find bigger, we will go ahead with the bigger interval
        # for the next interval we will start with either final
        # or the next positive number after final
        if s>0 and a[i]>0:
            final = i
    intervals.append((start, final))
    s = a[final]
    assign = False

    # This step will take O(the distance between these two positive integers)
    # O(n)
    # ------------------------------
    for i in range(final+1,m+1):
        if a[i]>0:
            if assign:
                final = i
            break
        s += a[i]
        if s<=0:
            # using final as starting point for
            # next interval is not beneficial
            assign = True
    start = final
    #---------------------------------
#-----------------------------------------------------------------------------
print(intervals)
                    
         