# Yet another mtcars example

In this short example, we're going to use R _code cells_ and a _range input_ to create an interactive plot of the famous (infamous?) [_mtcars_](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html "undefined") data set as described in the R help:

> The data was extracted from the 1974 
>
> _Motor Trend_
>
>  US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).

First let's create a simple, static plot of fuel consumption versus horse power using "ggplot":

```r
#!
ggplot(mtcars, aes(x=hp,y=mpg)) + 
  geom_point() +
  labs(x='Power (horsepower)', y='Fuel efficiency (miles per gallon)') + 
  theme_bw()
```

Now, let's add a smoother line to the plot. We'll make the degree of smoothing adjustable by defining a range input called "smoothing" which we will pass to a new version of the plot cell: [0.5]{name=smoothing type=range min=0.1 max=1 step=0.1} (click on this to adjust the smoothing and see the settings for a range input):


```r
#! (smoothing)
ggplot(mtcars, aes(x=hp,y=mpg)) + 
  geom_point() +
  geom_smooth(span=smoothing) + 
  labs(x='Power (horsepower)', y='Fuel efficiency (miles per gallon)') + 
  theme_bw()
```
 