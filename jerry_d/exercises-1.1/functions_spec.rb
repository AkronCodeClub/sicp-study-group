require 'rspec'
require_relative 'functions'

context :sum_squares_of_two_biggest do

  it 'returns 2 when given all arguments are 1' do
    result = sum_squares_of_two_biggest(1, 1, 1)
    expect(result).to eq 2
  end

  it 'returns 8 when given all arguments are 2' do
    result = sum_squares_of_two_biggest(2, 2, 2)
    expect(result).to eq 8
  end

  it 'returns 18 when given when given 3, 3, and a smaller number' do
    result = sum_squares_of_two_biggest(3, 3, 2)
    expect(result).to eq 18
  end

  it 'returns 13 when given 1, 2, and 3' do
    result = sum_squares_of_two_biggest(1, 2, 3)
    expect(result).to eq 13
  end

  it 'returns the proper result when the first arg is the smallest' do
    result = sum_squares_of_two_biggest(2, 4, 6)
    expect(result).to eq 52
  end

  it 'returns the proper result when the second arg is the smallest' do
    result = sum_squares_of_two_biggest(4, 2, 6)
    expect(result).to eq 52
  end

  it 'returns the proper result when the first arg is the smallest' do
    result = sum_squares_of_two_biggest(6, 4, 2)
    expect(result).to eq 52
  end
end
