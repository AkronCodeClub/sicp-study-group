# Exercises: 1.1 The Elements of Programming

def minimum(list)
  if list.empty?
    nil
  else
    minimum_recursive(list.first, list)
  end
end

def minimum_recursive(min, list)
  if list.empty?
    min
  else
    minimum_recursive((list.first < min ? list.first : min), list.drop(1))
  end
end

def drop_the_smallest_by_reduction(*args)
  #min = args.min
  min = minimum(args)
  found = false
  result = args.reduce([]) do |memo, item|
    if item == min && ! found
      found = true
    else
      memo << item
    end
    memo
  end
  return result
end

def drop_the_smallest(*args)
  drop_the_smallest_recursive(minimum(args), false, [], args)
end

def drop_the_smallest_recursive(min, found, accum, list)
  if list.empty?
    return accum
  elsif list.first == min && ! found
    drop_the_smallest_recursive(min, true, accum, list.drop(1))
  else
    accum << list.first
    drop_the_smallest_recursive(min, found, accum, list.drop(1))
  end
end

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

# Exercise 1.3
#
# Define a procedure that takes three numbers as arguments and
# returns the sum of the squares of the two larger numbers.
def sum_squares_excluding_smallest(*args)
  drop_the_smallest(*args).reduce(0) do |accum, n|
    accum += n * n
  end
end

#####################################################################

module SquareRoot
  extend self

  def abs(x)
    x < 0 ? -x : x
  end

  def sqrt_iter(guess, x)
    if good_enough?(guess, x)
      guess
    else
      sqrt_iter(improve(guess, x), x)
    end
  end

  def improve(guess, x)
    average(guess, (x / guess))
  end

  def average(x, y)
    (x + y) / 2
  end

  def square(x)
    x * x
  end

  def good_enough?(guess, x)
    abs((square(guess) - x)) < 0.001
  end

  def calculate_for(x)
    sqrt_iter(1.0, x)
  end
end

#####################################################################

module CubeRoot
  extend self

  def abs(x)
    x < 0 ? -x : x
  end

  def cbrt_iter(guess, x)
    if good_enough?(guess, x)
      guess
    else
      cbrt_iter(improve(guess, x), x)
    end
  end

  def improve(guess, x)
    ((x / square(guess)) + (2 * guess)) / 3
  end

  def square(x)
    x * x
  end

  def cube(x)
    x * x * x
  end

  def good_enough?(guess, x)
    abs((cube(guess) - x)) < 0.001
  end

  def calculate_for(x)
    cbrt_iter(1.0, x)
  end
end
