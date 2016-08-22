#Yes, ggplot2 combines the best of base and lattice. It
#allows for multipanel (conditioning) plots (as lattice does)
#but also post facto annotation (as base does), so you can
#add titles and labels. It uses the low-level grid package
#(which comes with R) to draw the graphics. As part of its
#grammar philosophy, ggplot2 plots are composed of aesthetics
#(attributes such as size, shape, color) and geoms (points,
#lines, and bars), the geometric objects you see on the plot.

#The ggplot2 package has 2 workhorse functions. The more
#basic workhorse function is qplot, (think quick plot), which
#works like the plot function in the base graphics system. It
#can produce many types of plots (scatter, histograms, box
#and whisker) while hiding tedious details from the user.
#Similar to lattice functions, it looks for data in a data
#frame or parent environment.

#The more advanced workhorse function in the package is
#ggplot, which is more flexible and can be customized for
#doing things qplot cannot do. In this lesson we will focus on
#qplot.

#We'll start by showing how easy and versatile qplot is.
#First, let's look at some data which comes with the ggplot2
#package. The mpg data frame contains fuel economy data for
#38 models of cars manufactured in 1999 and 2008. Run the R
#command str with the argument mpg. This will give you an
#idea of what mpg contains.

str(mpg)

qplot(displ, hwy, data = mpg,geom=c("point","smooth"),color=drv)

#Notice the gray areas surrounding each trend lines. These
#indicate the 95% confidence intervals for the lines

#Before we leave qplot's scatterplotting ability, call qplot
#again, this time with 3 arguments. The first is y set equal
#to hwy, the second is data set equal to mpg, and the third
#is color set equal to drv. Try this now.

qplot(y=hwy,data=mpg,color=drv)


#Comparing the values of myhigh with the plot, we see the
#first entries in the vector (29, 29, 31, 30,...) correspond
#to the leftmost points in the the plot (in order), and the
#last entries in myhigh (28, 29, 26, 26, 26) correspond to
#the rightmost plotted points. So, specifying the y parameter
#only, without an x argument, plots the values of the y
#argument in the order in which they occur in the data.

#The all-purpose qplot can also create box and whisker plots.
#Call qplot now with 4 arguments. First specify the variable
#by which you'll split the data, in this case drv, then
#specify the variable which you want to examine, in this case
#hwy. The third argument is data (set equal to mpg), and the
#fourth, the geom, set equal to the string "boxplot"

qplot(drv,hwy,data=mpg,geom="boxplot",color = manufacturer)

#Now, on to histograms. These display frequency counts for a
#single variable. Let's start with an easy one. Call qplot
#with 3 arguments. First specify the variable for which you
#want the frequency count, in this case hwy, then specify the
#data (set equal to mpg), and finally, the aesthetic, fill,
#set equal to drv. Instead of a plain old histogram, this
#will again use colors to distinguish the 3 different drive
#factors.

qplot(hwy,data = mpg, fill = drv)

#See how qplot consistently uses the colors. Red (if 4-wheel
#drv is in the bin) is at the bottom of the bin, then green
#on top of it (if present), followed by blue (rear wheel
#drv). The color lets us see right away that 4-wheel drive
#vehicles in this dataset don't have gas mileages exceeding
#30 miles per gallon.

#It's cool that qplot can do this so easily, but some people
#may find this multi-color histogram hard to interpret.
#Instead of using colors to distinguish between the drive
#factors let's use facets or panels. (That's what lattice
#called them.) This just means we'll split the data into 3
#subsets (according to drive) and make 3 smaller individual
#plots of each subset in one plot (and with one call to
#qplot).


#We'll do two plots, a scatterplot and then a histogram, each
#with 3 facets. For the scatterplot, call qplot with 4
#arguments. The first two are displ and hwy and the third is
#the argument data set equal to mpg. The fourth is the
#argument facets which will be set equal to the expression .
#~ drv which is ggplot2's shorthand for number of rows (to
# the left of the ~) and number of columns (to the right of
#the ~). Here the . indicates a single row and drv implies 3,
#since there are 3 distinct drive factors. Try this now.

qplot(displ,hwy,data = mpg, facets = .~ drv)

qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)