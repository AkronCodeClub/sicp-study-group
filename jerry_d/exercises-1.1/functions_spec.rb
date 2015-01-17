require 'rspec'
require_relative 'functions'

context :drop_the_smallest do

  it 'returns an empty array when given no arguments' do
    result = drop_the_smallest
    expect(result).to eq []
  end

  it 'returns an empty array when given one argument' do
    result = drop_the_smallest(1)
    expect(result).to eq []
  end

  it 'returns the the correct array when all elements are the same' do
    result = drop_the_smallest(2, 2, 2)
    expect(result).to eq [2, 2]
  end

  it 'returns the proper array when the smallest is first' do
    result = drop_the_smallest(2, 4, 6)
    expect(result).to include(4)
    expect(result).to include(6)
  end

  it 'returns the proper array when the smallest is last' do
    result = drop_the_smallest(6, 4, 2)
    expect(result).to include(4)
    expect(result).to include(6)
  end

  it 'returns the proper array when the smallest is in the middle' do
    result = drop_the_smallest(4, 6, 2)
    expect(result).to include(4)
    expect(result).to include(6)
  end

  it 'only drops one element when multiple are the smallest value' do
    result = drop_the_smallest(1, 2, 1, 3, 4)
    expect(result.length).to eq 4
    expect(result).to include(1)
    expect(result).to include(2)
    expect(result).to include(3)
    expect(result).to include(4)
  end
end

context :sum_squares_excluding_smallest do

  it 'returns 2 when given all arguments are 1' do
    result = sum_squares_excluding_smallest(1, 1, 1)
    expect(result).to eq 2
  end

  it 'returns 8 when given all arguments are 2' do
    result = sum_squares_excluding_smallest(2, 2, 2)
    expect(result).to eq 8
  end

  it 'returns 18 when given when given 3, 3, and a smaller number' do
    result = sum_squares_excluding_smallest(3, 3, 2)
    expect(result).to eq 18
  end

  it 'returns 13 when given 1, 2, and 3' do
    result = sum_squares_excluding_smallest(1, 2, 3)
    expect(result).to eq 13
  end

  it 'returns the proper result when the first arg is the smallest' do
    result = sum_squares_excluding_smallest(2, 4, 6)
    expect(result).to eq 52
  end

  it 'returns the proper result when the second arg is the smallest' do
    result = sum_squares_excluding_smallest(4, 2, 6)
    expect(result).to eq 52
  end

  it 'returns the proper result when the first arg is the smallest' do
    result = sum_squares_excluding_smallest(6, 4, 2)
    expect(result).to eq 52
  end
end
