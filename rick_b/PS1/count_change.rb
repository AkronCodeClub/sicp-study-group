
def count_change(amount)
  @ways_to_make_change = 0
  cc(amount, 5)
end

def cc(amount, kinds_of_coins)

  if amount == 0
    @ways_to_make_change += 1
  elsif amount < 0 || kinds_of_coins == 0
    0
  else

    cc(amount, (kinds_of_coins - 1)) +
      cc((amount - first_denomination(kinds_of_coins)), kinds_of_coins)
  end
  @ways_to_make_change
end

def first_denomination(kinds_of_coins)
  [1, 5, 10, 25, 50][kinds_of_coins - 1]
end

p count_change(1) # 1
p count_change(10) # 4
p count_change(15) # 6
p count_change(100) # 292
p count_change(22) # 9
