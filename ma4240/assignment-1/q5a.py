import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

pulse_rates = sorted([49, 40, 59, 56, 55, 70, 49, 59, 55, 49, 58,\
     54, 55, 72, 51,54, 56, 55, 65, 57, 61, 41, 52, 60, 49, 57, 46, 55, 63, 55])
print(pulse_rates)
pulse_rates = np.array(pulse_rates)
print(np.sum(pulse_rates)/pulse_rates.__len__())
ax = sns.boxplot(x=pulse_rates, color='green')
ax.set(xlabel="pulse rate")
plt.show()
sns.histplot(x=pulse_rates,color='red',binwidth=5)
plt.show()
