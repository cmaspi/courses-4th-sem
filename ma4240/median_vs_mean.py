import numpy as np
import time
from matplotlib import pyplot as plt
medianTime, meanTime = [],[]
size = [10,100,1000,10000,100000,1000000,10000000,100000000]
for itr in size:
    bogus_arr = np.random.rand(itr)
    initTime = time.time()
    median = np.median(bogus_arr)
    finalTime = time.time()
    medianTime.append(finalTime-initTime)
    initTime = time.time()
    mean = np.mean(bogus_arr)
    finalTime = time.time()
    meanTime.append(finalTime-initTime)
plt.plot(size,medianTime,label="Median")
plt.plot(size,meanTime,label="Mean")
plt.scatter(size,medianTime)
plt.scatter(size,meanTime)
plt.xlabel("Size of the array")
plt.ylabel("Time taken in seconds")
plt.grid()
plt.legend()
plt.show()
