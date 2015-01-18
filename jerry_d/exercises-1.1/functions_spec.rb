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

#####################################################################

shared_examples_for :sqrt do

  it 'returns ~1.414 for 2' do
    result = mod.send(func, 2)
    expect(result).to be_within(0.001).of(1.4142156862745097)
  end

  it 'returns ~3.000 for 9' do
    result = mod.send(func, 9)
    expect(result).to be_within(0.001).of(3.00009155413138)
  end

  it 'returns ~11.704 for (+ 100 37)' do
    result = mod.send(func, 100+37)
    expect(result).to be_within(0.001).of(11.704699917758145)
  end

  it 'returns ~1.774 for (+ (sqrt 2) (sqrt 3))' do
    first = mod.send(func, 2)
    second = mod.send(func, 3)
    result = mod.send(func, first + second)
    expect(result).to be_within(0.001).of(1.7739279023207892)
  end

  it 'returns ~1000 for (square (sqrt 1000))' do
    result = mod.send(func, 1000)
    result *= result
    expect(result).to be_within(0.001).of(1000.000369924366)
  end
end

context 'Math.sqrt' do

  let!(:mod){ Math }
  let!(:func){ :sqrt }

  it_behaves_like :sqrt
end

context SquareRoot do

  let!(:mod){ SquareRoot }
  let!(:func){ :calculate_for }

  it_behaves_like :sqrt
end

#####################################################################

shared_examples_for :cbrt do

  it 'returns ~1.260 for 2' do
    result = mod.send(func, 2)
    expect(result).to be_within(0.001).of(1.2599210498948732)
  end

  it 'returns ~2.080 for 9' do
    result = mod.send(func, 9)
    expect(result).to be_within(0.001).of(2.080083823051904)
  end

  it 'returns ~5.155 for (+ 100 37)' do
    result = mod.send(func, 100+37)
    expect(result).to be_within(0.001).of(5.1551367354757724)
  end

  it 'returns ~1.393 for (+ (cbrt 2) (cbrt 3))' do
    first = mod.send(func, 2)
    second = mod.send(func, 3)
    result = mod.send(func, first + second)
    expect(result).to be_within(0.001).of(1.392849702964866)
  end

  it 'returns ~1000 for (cube (cbrt 1000))' do
    result = mod.send(func, 1000)
    result = result * result * result
    expect(result).to be_within(0.001).of(1000.0)
  end
end

context 'Math.cbrt' do

  let!(:mod){ Math }
  let!(:func){ :cbrt }

  it_behaves_like :cbrt
end

context CubeRoot do

  let!(:mod){ CubeRoot }
  let!(:func){ :calculate_for }

  it_behaves_like :cbrt
end
