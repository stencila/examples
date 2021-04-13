import numpy as np
import matplotlib.pyplot as plt

plt.rcParams.update({
        "text.usetex": True,
        "font.family": "serif",
        "font.serif": ["Palatino"],
    })

def plot_hist(x):
    fig = plt.figure()
    ax = fig.add_subplot(1,1,1)
    num_bins = 30
    ax.hist(x, num_bins, facecolor='gray', alpha=0.5)
    ax.set_xlabel('Random variable $x$')
    ax.set_ylabel('Frequency')
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    # plt.title(r'Histogram of 1,000 random draws from $\mathcal{N}$(0.0, 1.0):')
    plt.show()

def plot_scatter(x):
    y = [i for i in range(1, 1001)]
    fig = plt.figure()
    ax = fig.add_subplot(1,1,1)
    plt.scatter(y, x, facecolor='white', edgecolor='black')
    ax.set_xlabel('Index')
    ax.set_ylabel('Random variable $x$')
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    # plt.title(r'Scatterplot of 1,000 random draws from $\mathcal{N}$(0.0, 1.0) as a function of their indices:')
    plt.show()

if __name__ == "__main__":
    mu = 0.0
    sigma = 1.0
    x = mu + sigma * np.random.randn(1000)

    plot_hist(x)
    # plot_scatter(x)