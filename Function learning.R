# ================================================================
# MATH517 - LEARNING CUSTOM FUNCTIONS IN R
# ================================================================
# Beginner-friendly study notes based on the topics we have covered
# in Tutorial 5: Exercise 1 and Exercise 2 (Tasks 1 and 2).
#
# You can run this script from top to bottom in RStudio.
# Each section explains what we are doing and why.
# ================================================================


# ----------------------------------------------------------------
# SECTION 1: CREATE A VECTOR
# ----------------------------------------------------------------
# c() combines several values into one vector.
# NA means a missing value.
# <- assigns the vector to the name x.

x <- c(2, 6, NA, 5, 2, 1, NA, 6, 6, 7, NA, 4, 0)

print(x)


# ----------------------------------------------------------------
# SECTION 2: BUILT-IN FUNCTIONS
# ----------------------------------------------------------------
# R already provides useful functions such as mean(), min(),
# max(), and sd(). We do not need to create these ourselves.
#
# na.rm = TRUE tells R to ignore missing values when calculating.
# Without it, these calculations return NA for our vector.

mean(x, na.rm = TRUE)

min(x, na.rm = TRUE)

max(x, na.rm = TRUE)

sd(x, na.rm = TRUE)


# ----------------------------------------------------------------
# SECTION 3: OUR FIRST CUSTOM FUNCTION
# ----------------------------------------------------------------
# A custom function is a set of instructions that we write.
# We can call it again without repeating those instructions.
#
# function(x) means that the function accepts an input called x.
# The final expression is returned automatically in R.

mean_NA <- function(x) {

  mean(x, na.rm = TRUE)

}

# Call the function using our vector.

mean_NA(x)


# ----------------------------------------------------------------
# SECTION 4: A FUNCTION THAT RETURNS SEVERAL STATISTICS
# ----------------------------------------------------------------
# Here we calculate four statistics and put them into a list.
#
# list() lets us return several named results together.
# return() explicitly sends those results back to the caller.

statistics_basic <- function(x) {

  minimum_na <- min(x, na.rm = TRUE)

  mean_na <- mean(x, na.rm = TRUE)

  sd_na <- sd(x, na.rm = TRUE)

  max_na <- max(x, na.rm = TRUE)

  return(list(
    min = minimum_na,
    mean = mean_na,
    sd = sd_na,
    max = max_na
  ))

}

statistics_basic(x)


# ----------------------------------------------------------------
# SECTION 5: COUNT MISSING VALUES
# ----------------------------------------------------------------
# is.na(x) checks every element of x.
# It gives TRUE for missing values and FALSE for other values.
# sum() counts TRUE values because TRUE counts as 1 in R.

sum(is.na(x))


# ----------------------------------------------------------------
# SECTION 6: DEFAULT ARGUMENTS (OUR FINAL EXERCISE 1 FUNCTION)
# ----------------------------------------------------------------
# na.rm = TRUE is a DEFAULT ARGUMENT.
#
# If we call statistics_NA(x), R automatically uses TRUE.
# If we call statistics_NA(x, na.rm = FALSE), we override it.
#
# Notice: min(x, na.rm = na.rm)
# The LEFT na.rm is the argument expected by min().
# The RIGHT na.rm is the value supplied to our custom function.
#
# = can assign a value or pass a named argument.
# == checks whether two values are equal.

statistics_NA <- function(x, na.rm = TRUE) {

  minimum_na <- min(x, na.rm = na.rm)

  mean_na <- mean(x, na.rm = na.rm)

  sd_na <- sd(x, na.rm = na.rm)

  max_na <- max(x, na.rm = na.rm)

  number_na <- sum(is.na(x))

  return(list(
    min = minimum_na,
    mean = mean_na,
    sd = sd_na,
    max = max_na,
    number_missing = number_na
  ))

}

# Default: missing values are ignored for the four statistics.

statistics_NA(x)

# Override: missing values are NOT ignored for the statistics.
# The missing-value count is still 3.

statistics_NA(x, na.rm = FALSE)


# ----------------------------------------------------------------
# SECTION 7: UNDERSTAND = AND ==
# ----------------------------------------------------------------
# A single = can assign a value.
# A double == compares two values and gives TRUE or FALSE.

age = 30

age == 30

age == 40


# ----------------------------------------------------------------
# SECTION 8: CREATE A HISTOGRAM USING A CUSTOM FUNCTION
# ----------------------------------------------------------------
# This is Exercise 2, Task 1.
#
# ggplot2 is a package for making graphs.
# Install it once if needed by running:
# install.packages("ggplot2")
#
# library() loads the installed package.

library(ggplot2)

# A histogram displays the distribution of numerical values.
# We first convert the vector into a data frame.
# Then ggplot() starts the graph.
# geom_histogram() adds the histogram bars.
#
# The function returns a ggplot object, which RStudio can display.

display_data <- function(x) {

  df_x <- data.frame(x = x)

  ggplot(df_x, aes(x = x)) +
    geom_histogram()

}

# Call the function to create a histogram.
# With this small vector, ggplot2 may suggest a different binwidth.
# The missing observations are not plotted.

display_data(x)


# ----------------------------------------------------------------
# SECTION 9: ADD A DEFAULT X-AXIS LABEL
# ----------------------------------------------------------------
# This is Exercise 2, Task 2.
#
# x_lab = "my_data" sets a default label for the horizontal axis.
# labs(x = x_lab) passes that label to the graph.
# We can change the label when calling the function.

display_data <- function(x, x_lab = "my_data") {

  df_x <- data.frame(x = x)

  ggplot(df_x, aes(x = x)) +
    geom_histogram() +
    labs(x = x_lab)

}

# Use the default axis label: "my_data".

display_data(x)

# Override the default axis label with our own words.

display_data(x, x_lab = "My numerical data")


# ----------------------------------------------------------------
# WHAT WE HAVE LEARNED
# ----------------------------------------------------------------
# 1. c() creates a vector.
# 2. R has built-in functions, including mean() and sd().
# 3. function() lets us define our own reusable function.
# 4. We call a function by writing its name and arguments.
# 5. return() explicitly returns a result.
# 6. list() combines several named outputs.
# 7. is.na() checks missing values; sum(is.na(x)) counts them.
# 8. Default arguments are used unless we override them.
# 9. = passes a named argument or assigns a value; == compares.
# 10. A custom function can create a ggplot2 histogram.
# 11. We can customise our histogram using an x_lab argument.
#
# END OF THE MATERIAL WE HAVE COVERED SO FAR
# ================================================================
