require 'rspec'
require_relative 'functions'

#####################################################################

context :double do

  specify { expect(Schemer.double(1)).to eq 2 }

  specify { expect(Schemer.double(2)).to eq 4 }

  specify { expect(Schemer.double(3)).to eq 6 }

  specify { expect(Schemer.double(4)).to eq 8 }

  specify { expect(Schemer.double(10)).to eq 20 }
end

context :second_order do

  specify { expect(Schemer.second_order(1)).to eq 12 }

  specify { expect(Schemer.second_order(2)).to eq 35 }

  specify { expect(Schemer.second_order(3)).to eq 64 }

  specify { expect(Schemer.second_order(4)).to eq 99 }

  specify { expect(Schemer.second_order(10)).to eq 435 }
end

context :bigger2 do

  specify { expect(Schemer.bigger2(1, 2)).to eq 2 }

  specify { expect(Schemer.bigger2(2, 1)).to eq 2 }

  specify { expect(Schemer.bigger2(-1, 2)).to eq 2 }

  specify { expect(Schemer.bigger2(2, -1)).to eq 2 }

  specify { expect(Schemer.bigger2(2, 2)).to eq 2 }
end

context :bigger3 do

  specify { expect(Schemer.bigger3(1, 2, 3)).to eq 3 }

  specify { expect(Schemer.bigger3(3, 2, 1)).to eq 3 }

  specify { expect(Schemer.bigger3(1, 3, 2)).to eq 3 }

  specify { expect(Schemer.bigger3(-1, -2, 3)).to eq 3 }

  specify { expect(Schemer.bigger3(3, 3, 3)).to eq 3 }
end

context :bigger do

  specify { expect(Schemer.bigger()).to be_nil }

  specify { expect(Schemer.bigger(10)).to eq 10 }

  specify { expect(Schemer.bigger(1, 10)).to eq 10 }

  specify { expect(Schemer.bigger(1, -10)).to eq 1 }

  specify { expect(Schemer.bigger(1, 2, 3, 4, 5, 6, 7)).to eq 7 }

  specify { expect(Schemer.bigger(7, 6, 5, 4, 3, 2, 1)).to eq 7 }

  specify { expect(Schemer.bigger(3, 2, 6, 4, 7, 1, 3)).to eq 7 }

  specify { expect(Schemer.bigger(1, 4, 2, 4, 3, 4)).to eq 4 }

  specify { expect(Schemer.bigger(4, 4, 4, 4, 4, 4)).to eq 4 }
end

context :quadratic_root do

  specify { expect(Schemer.quadratic_root(1, -4, 0)).to be_within(0.01).of(4) }

  specify { expect(Schemer.quadratic_root(1, -6, 9)).to be_within(0.01).of(3) }

  specify { expect(Schemer.quadratic_root(1, 3, 1)).to be_within(0.01).of(-0.3819660112501051) }
end
