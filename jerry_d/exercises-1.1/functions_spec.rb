require 'rspec'
require_relative 'functions'

#####################################################################

context :minimum do

  it 'returns nil when given an empty list' do
    result = minimum([])
    expect(result).to be_nil
  end

  it 'returns the item when given a single-item list' do
    result = minimum([2])
    expect(result).to eq 2
  end

  it 'returns the minimum when the smallest is first' do
    result = minimum([2, 4, 6])
    expect(result).to eq 2
  end

  it 'returns the minimum when the smallest is last' do
    result = minimum([6, 4, 2])
    expect(result).to eq 2
  end

  it 'returns the minimum when the smallest is in the middle' do
    result = minimum([4, 2, 6])
    expect(result).to eq 2
  end

  it 'returns the minimum when all elements are the same' do
    result = minimum([2, 2, 2, 2, 2, 2])
    expect(result).to eq 2
  end
end

#####################################################################

shared_examples_for :drop_the_smallest_function do

  it 'returns an empty array when given no arguments' do
    result = send(func)
    expect(result).to eq []
  end

  it 'returns an empty array when given one argument' do
    result = send(func, 1)
    expect(result).to eq []
  end

  it 'returns the the correct array when all elements are the same' do
    result = send(func, 2, 2, 2)
    expect(result).to eq [2, 2]
  end

  it 'returns the proper array when the smallest is first' do
    result = send(func, 2, 4, 6)
    expect(result).to include(4)
    expect(result).to include(6)
  end

  it 'returns the proper array when the smallest is last' do
    result = send(func, 6, 4, 2)
    expect(result).to include(4)
    expect(result).to include(6)
  end

  it 'returns the proper array when the smallest is in the middle' do
    result = send(func, 4, 6, 2)
    expect(result).to include(4)
    expect(result).to include(6)
  end

  it 'only drops one element when multiple are the smallest value' do
    result = send(func, 1, 2, 1, 3, 4)
    expect(result.length).to eq 4
    expect(result).to include(1)
    expect(result).to include(2)
    expect(result).to include(3)
    expect(result).to include(4)
  end
end

context :drop_the_smallest do

  let!(:func){ :drop_the_smallest }

  it_behaves_like :drop_the_smallest_function
end

context :drop_the_smallest_by_reduction do

  let!(:func){ :drop_the_smallest_by_reduction }

  it_behaves_like :drop_the_smallest_function
end

#####################################################################

shared_examples_for :sum_squares_function do

  it 'returns 2 when given all arguments are 1' do
    result = send(func, 1, 1, 1)
    expect(result).to eq 2
  end

  it 'returns 8 when given all arguments are 2' do
    result = send(func, 2, 2, 2)
    expect(result).to eq 8
  end

  it 'returns 18 when given when given 3, 3, and a smaller number' do
    result = send(func, 3, 3, 2)
    expect(result).to eq 18
  end

  it 'returns 13 when given 1, 2, and 3' do
    result = send(func, 1, 2, 3)
    expect(result).to eq 13
  end

  it 'returns the proper result when the first arg is the smallest' do
    result = send(func, 2, 4, 6)
    expect(result).to eq 52
  end

  it 'returns the proper result when the second arg is the smallest' do
    result = send(func, 4, 2, 6)
    expect(result).to eq 52
  end

  it 'returns the proper result when the first arg is the smallest' do
    result = send(func, 6, 4, 2)
    expect(result).to eq 52
  end
end

context :sum_squares_of_two_biggest do

  let!(:func){ :sum_squares_of_two_biggest }

  it_behaves_like :sum_squares_function
end

context :sum_squares_excluding_smallest do

  let!(:func){ :sum_squares_excluding_smallest }

  it_behaves_like :sum_squares_function
end
