# Exercises: 1.1 The Elements of Programming

def drop_the_smallest_by_reduction(*args)
  min = args.min
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
  drop_the_smallest_recursive(args.min, false, [], args)
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
