# Exercises: 1.1 The Elements of Programming

# Exercise 1.3
#
# Define a procedure that takes three numbers as arguments and
# returns the sum of the squares of the two larger numbers.
def sum_squares_of_two_biggest(a, b, c)
  if a < b && a < c
    b * b + c * c
  elsif b < a && b < c
    a * a + c * c
  else
    a * a + b * b
  end
end
