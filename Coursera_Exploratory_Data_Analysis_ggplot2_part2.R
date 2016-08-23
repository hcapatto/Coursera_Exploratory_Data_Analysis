#In a previous lesson we showed you the vast capabilities of
#qplot, the basic workhorse function of the ggplot2 package.
#In this lesson we'll focus on some fundamental components of
#the package. These underlie qplot which uses default values
#when it calls them. If you understand these building blocks,
#you will be better able to customize your plots. We'll use
#the second workhorse function in the package, ggplot, as
#well as other graphing functions.

#A "grammar" of graphics means that ggplot2 contains building
#blocks with which you can create your own graphical objects.
#What are these basic components of ggplot2 plots? There are
#7 of them.

#Obviously, there's a DATA FRAME which contains the data
#you're trying to plot. Then the AESTHETIC MAPPINGS determine
#how data are mapped to color, size, etc. The GEOMS
#(geometric objects) are what you see in the plot (points,
#lines, shapes) and FACETS are the panels used in conditional
#plots. You've used these or seen them used in the first
#ggplot2 (qplot) lesson.

#There are 3 more. STATS are statistical transformations such
#as binning, quantiles, and smoothing which ggplot2 applies
#to the data. SCALES show what coding an aesthetic map uses
#(for example, male = red, female = blue). Finally, the plots
#are depicted on a COORDINATE SYSTEM. When you use qplot
#these were taken care of for you.

#As in the base plotting system (and in contrast to the
#lattice system), when building plots with ggplot2, the plots
#are built up in layers, maybe in several steps. You can plot
#the data, then overlay a summary (for instance, a regression
#line or smoother) and then add any metadata and annotations
#you need.

#We'll keep using the mpg data that comes with the ggplot2
#package. Recall the versatility of qplot. Just as a
#refresher, call qplot now with 5 arguments. The first 3 deal
#with data - displ, hwy, and data=mpg. The fourth is geom set
#equal to the concatenation of the two strings, "point" and
#"smooth". The fifth is facets set equal to the formula
#.~drv. Try this now.

qplot(displ, hwy, data = mpg, geom=c("point","smooth"),
      facets=.~drv)

#We see a 3 facet plot, one for each drive type (4, f, and
#r). Now we'll see how ggplot works. We'll build up a similar
#plot using the basic components of the package. We'll do
#this in a series of steps.

#First we'll create a variable g by assigning to it the output of a
#call to ggplot with 2 arguments. The first is mpg (our dataset)
#and the second will tell ggplot what we want to plot, in this
#case, displ and hwy. These are what we want our aesthetics to
#represent so we enclose these as two arguments to the function
#aes. Try this now.

summary(g)

#Note that if you tried to print g with the expressions g or
#print(g) you'd get an error! Even though it's a great package,
#ggplot doesn't know how to display the data yet since you didn't
#specify how you wanted to see it. Now type g+geom_point() and see
#what happens.

g+geom_point()

#By calling the function geom_point you added a layer. By not
#assigning the expression to a variable you displayed a plot.
#Notice that you didn't have to pass any arguments to the function
#geom_point. That's because the object g has all the data stored in
#it. (Remember you saw that when you ran summary on g before.) Now
#use the expression you just typed (g + geom_point()) and add to it
#another layer, a call to geom_smooth(). Notice the red message R
#gives you.

g+geom_point()+geom_smooth()

#The gray shadow around the blue line is the confidence band. See
#how wide it is at the right? Let's try a different smoothing
#function. Use the up arrow to recover the expression you just
#typed, and instead of calling geom_smooth with no arguments, call
#it with the argument method set equal to the string "lm".

g+geom_point()+geom_smooth(method = "lm")

#By changing the smoothing function to "lm" (linear model) ggplot2 generated a regression line
#through the data. Now recall the expression you just used and add to it another call, this time
#to the function facet_grid. Use the formula . ~ drv as it argument. Note that this is the same
#type of formula used in the calls to qplot.

g+geom_point()+geom_smooth(method = "lm")+facet_grid(facets=.~drv)

#So far you've just used the default labels that ggplot provides. You can add your own annotation
#using functions such as xlab(), ylab(), and ggtitle(). In addition, the function labs() is more
#general and can be used to label either or both axes as well as provide a title. Now recall the
#expression you just typed and add a call to the function ggtitle with the argument "Swirl
#Rules!".

g+geom_point()+geom_smooth(method = "lm")+facet_grid(facets=.~drv)+ggtitle("Swirl Rules!")

#Let's practice modifying aesthetics now. We'll use the graphic object g that we already filled
#with mpg data and add a call to the function geom_point, but this time we'll give geom_point 3
#arguments. Set the argument color equal to "pink", the argument size to 4, and the argument
#alpha to 1/2. Notice that all the arguments are set equal to constants.

g+geom_point(color="pink",size=4,alpha=1/2)

#Now we'll modify the aesthetics so that color indicates which drv type each point represents.
#Again, use g and add to it a call to the function geom_point with 3 arguments. The first is size
#set equal to 4, the second is alpha equal to 1/2. The third is a call to the function aes with
#the argument color set equal to drv. Note that you MUST use the function aes since the color of
#the points is data dependent and not a constant as it was in the previous example.

g + geom_point(aes(color = drv), size = 4, alpha = 1/2)

#Now we'll practice modifying labels. Again, we'll use g and
#add to it calls to 3 functions. First, add a call to
#geom_point with an argument making the color dependent on
#the drv type (as we did in the previous example). Second,
#add a call to the function labs with the argument title set
#equal to "Swirl Rules!". Finally, add a call to labs with 2
#arguments, one setting x equal to "Displacement" and the
#other setting y equal to "Hwy Mileage".

g + geom_point(aes(color = drv)) 
+ labs(title="Swirl Rules!") 
+ labs(x="Displacement", y="Hwy Mileage")

#Note that you could have combined the two calls to the
#function labs in the previous example. Now we'll practice
#customizing the geom_smooth calls. Use g and add to it a
#call to geom_point setting the color to drv type (remember
#to use the call to the aes function), size set to 2 and
#alpha to 1/2. Then add a call to geom_smooth with 4
#arguments. Set size equal to 4, linetype to 3, method to
#"lm", and se to FALSE.

g + geom_point(aes(color = drv),size=2, alpha = 1/2) + geom_smooth(size=4,linetype=3,method = "lm", se=FALSE)

#What did these arguments do? The method specified a linear
#regression (note the negative slope indicating that the
#bigger the displacement the lower the gas mileage), the
#linetype specified that it should be dashed (not
#continuous), the size made the dashes big, and the se flag
#told ggplot to turn off the gray shadows indicating standard
#errors (confidence intervals).

#Finally, let's do a simple plot using the black and white
#theme, theme_bw. Specify g and add a call to the function
#geom_point with the argument setting the color to the drv
#type. Then add a call to the function theme_bw with the
#argument base_family set equal to "Times". See if you notice
#the difference.

g + geom_point(aes(color = drv))
+theme_bw(base_family = "Times")

g+geom_line()+ylim(-3,3)

g+geom_line()+coord_cartesian(ylim=c(-3,3))

#Start by creating the graphical object g by assigning to it
#a call to ggplot with 2 arguments. The first is the dataset
#and the second is a call to the function aes. This call will
#have 3 arguments, x set equal to displ, y set equal to hwy,
#and color set equal to factor(year). This last will allow us
#to distinguish between the two manufacturing years (1999 and
#2008) in our data.


#passos para montagem de um gráfico

g <- ggplot(mpg,aes(x=displ,y=hwy,color=factor(year)))

g+geom_point()+facet_grid(drv~cyl,margins=TRUE)

g+geom_point()+facet_grid(drv~cyl,margins=TRUE)
+geom_smooth(size=2,color="black",method = "lm", se=FALSE)

g+geom_point()
+facet_grid(drv~cyl,margins=TRUE)
+geom_smooth(size=2,color="black",method = "lm", se=FALSE)
+labs(x="Displacement",y="Highway Mileage",title="Swirl Rules!")


