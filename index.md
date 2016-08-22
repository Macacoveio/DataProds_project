Extreme water level calculator
========================================================
author: Fernando S Silva
date: Aug 22, 2016
autosize: true

Predicting the behavior of a river
========================================================

Imagine someone asked you to design a bridge or a building at the waterfront.

- Your structure must not be flooded or destroyed when the river rises 
- It must also not be very expensive
- You have data on the river of interest

What margin of sefety should you use? In other words, what water level should your project withstand?

Example of high tide calculation
========================================================

Showing an example time series of water elevation data from a major river in Brazil:


```r
library(boot); data(manaus)
# Reference level is supposed to be at 35.874m above mean sea level
manaus <- manaus + 35.874;  plot(manaus)
```

![plot of chunk unnamed-chunk-1](index-figure/unnamed-chunk-1-1.png)


Example of high tide calculation
=======================================================

The example below shows the calculation of the maximum water level for a return period of 200 years using Gumbel distribution.


```r
library(lfstat)
fit <- evfit(manaus, distribution = "gum", extreme = "maximum")
evquantile(fit, return.period = 200)$T_Years_Event
```

```
             distribution
return period      gum
          200 41.60211
```

That means the chance of this particular level being equaled or exceeded in a given year is 1/200.

App for extreme level calculation
=====================================================

With the app found at <https://macacoveio.shinyapps.io/DataProds_project1/>, you can do that and also:

- Calculate the minimum water level (if you are worried about droughts instead of floods);
- Set different return periods;
- Utilize only a portion of the time series for the calculation, instead of the whole series of data, since older data might not be reflective of the current conditions.
