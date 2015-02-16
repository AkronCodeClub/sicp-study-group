
######################################################################################
### Pascal's triangle SICP exercise 1.1.2 - iteration
######################################################################################

# element[0] is always 1
# element[(length - 1)] is always 1
# element[(1..n)] = (element1 and element -1) in (row - 1) (previous array)


#  @current_expansion = []
# @previous_expansion = []

# (0..10).each do |row|
#   row_length = row + 1

#   current_expansion = Array.new(row_length, 0)

#   current_expansion.each_with_index do |val, index|

#     if index == 0 || index == current_expansion.length - 1
#       current_expansion[index] = 1
#     elsif current_expansion.length == 2
#      current_expansion[index] = 1
#     else
#       current_expansion[index] = @previous_expansion[row - 1][index - 1] + 
#                                  @previous_expansion[row - 1][index] 
#     end
#   end
#   @previous_expansion << current_expansion
#    @current_expansion << current_expansion
# end

# puts
# @current_expansion.each { |v| p v }


######################################################################################
### Pascal's triangle SICP exercise 1.1.2 - recursion
######################################################################################


@current_expansion ||= []

def pascals_triangle(rows)
   @current_expansion ||= []
  @previous_expansion ||= []
          @row_length ||= 1

  current_expansion = Array.new(@row_length, 0)

  current_expansion.each_with_index do |val, index|

    if index == 0 || index == current_expansion.length - 1
      current_expansion[index] = 1
    else
      current_expansion[index] = @previous_expansion.last[index - 1] + 
                                 @previous_expansion.last[index] 
    end
  end

  @previous_expansion << current_expansion
   @current_expansion << current_expansion

  if @row_length == rows
    #@current_expansion.each_with_index { |v, i| printf(("%#{60 + (i)}s"), v);puts }
    @current_expansion.each_with_index { |v, i| printf(("%#{30}s").center(30), v);puts }

  else
    @row_length += 1
    pascals_triangle(rows)   
  end
end

puts
@current_expansion.each { |v| p v.length }


pascals_triangle(10)


