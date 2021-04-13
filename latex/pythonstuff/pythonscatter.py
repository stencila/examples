import numpy as np
import matplotlib.pyplot as plt

mu = 0.0
sigma = 1.0
x = mu + sigma * np.random.randn(1000)
y = [i for i in range(1, 1001)]
fig = plt.figure()
ax = fig.add_subplot(1,1,1)
plt.scatter(y, x, facecolor='white', edgecolor='black')
ax.set_xlabel('Index')
ax.set_ylabel('Random variable $x$')
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
plt.show()