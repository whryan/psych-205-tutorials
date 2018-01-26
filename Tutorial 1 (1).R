# Tutorial 1 - Learning about loops, graphics and a little exercise on SEM

set.seed(1)

# Define a vector x (a one dimensional array that has 10 elemens)

x <- array(0,10)

# An alternative to doing this is as follows:

x <- rep(0,10)

t <- seq(1,10)

# Use a for loop to change the value of x. Here i is the "index" and it takes values from 1 to 10
for (i in 1:10) {
x[i] <- i*3 
}

## You can do this more computationally efficiently, as follows (for loops in R are slow):
x[1:10] <- seq(3,30,by=3)

sampMeans <- rep(0,100)
sampMeans[1:100] <- sapply( 1:100, function(x) mean(rnorm(100,mean=100,sd=10)) ) # If you need something to actually vary in your function, put the x where the varying needs to happen (for example, if you wanted some different means, you could write mean=x)

plot(t, x)

# We can generate 100 samples from a normal distribution with mean 100 and standard deviation 10

xSamp <- rnorm(100,mean=100, sd=10)
meanSamp <- mean(xSamp)


# Exercise 1. Check the values of xSamp, draw a histogram (hist function), show the mean on the histogram as a dashed vertical line (abline)
summary(xSamp)

hist(xSamp)
abline(v=mean(xSamp), col="blue", lty=2)


# Exercise 2. Write a loop to generate 100 samples from the same normal distribution (each of 100 data points) and save the sample mean in an array

means = 1:100

for (i in 1:100){
  means[i] = mean(rnorm(100, mean=100, sd=10))
}

	
# Exercise 3. On a new window (dev.new()). Display the distribution of sample mean in a histogram and show the mean of means as a vertical dashed line. Compare to the histogram of samples. 
dev.new()
hist(means)
abline(v=mean(means), col="blue", lty=2)


# Exercise 4. Calculate the standard deviation (sd) of this DOSM. Does the number agree with the theoretical value?
sd(means)


# Exercise 5. Use the arrows command to draw an arrow showing the sem.
sem = sd(means)/sqrt(length(means))
arrows (x0=,y0=, x1=,y1=) #x0/y0 and x1/y1


# Exercise 6.  Using a new "for loop" calculate the sample mean for samples of 10,20,50,100,200,500,1000 sample size.
samples = c(10,20,50,100,200,500,1000)
loops = 1:length(samples)
new_means = vector('numeric', length(samples))
  
for (i in loops) {
  new_means[i] = mean(rnorm(samples[i],mean=100,sd=10))
}

#QUESTION - why does this not give the same results when repeated?


# Exercise 7. Now try doing this using the sapply syntax above. It's okay to rotely copy it at this point. Slowly learning to extend this construct to various settings will help make your use of R much less frustrating (if initially harder to read).
sampMeans <- rep(0,length(samples))
sampMeans[1:length(samples)] <- sapply( samples, function(x) mean(rnorm(x,mean=100,sd=10)) )


# Exercise 8. On a new plot, plot you sample mean as a function of sample size.
# Add three curves to your plot that correspond to the theoretical mean (solid line) and the range of 95% confidence for the sample mean (two dotted lines)

dev.new()
plot(samples, sampMeans)
abline(h=100, col="blue", lty=3)


