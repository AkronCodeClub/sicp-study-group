@amount = 0
@kinds_of_coins = 0
@ways_to_make_change = 0





def count_change(amount)
  cc(amount, 5)
end  

# (else (+ (cc amount (- kinds-of-coins 1))
#          (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

def cc(amount, kinds_of_coins)
  @ways_to_make_change ||= 0

  if amount == 0
    @ways_to_make_change += 1
  elsif amount < 0 || kinds_of_coins == 0
    
  else
   p amount
   p "kinds_of_coins #{kinds_of_coins}"
   #cc(amount, (kinds_of_coins - 1))
   cc((amount - first_denomination(kinds_of_coins)), kinds_of_coins)
   p amount
  end
  @ways_to_make_change
end

def first_denomination(kinds_of_coins) 

  case kinds_of_coins

  when kinds_of_coins == 1
    return 1
  when kinds_of_coins == 2
    return 5
  when kinds_of_coins == 3
    return 10
  when kinds_of_coins == 4
    return 25
  else #kinds_of_coins == 5
    return 50
  end
end

p count_change(100)