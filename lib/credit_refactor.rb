require 'pry'

class CreditCheck

attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
    @valid = false
  end

  def make_array
    num_string = card_number.chars
    num_string.map do |num|
      num.to_i
    end
    num_string
  end

  def eat_last
    make_array[0..-2]
  end

  def reverser
    eat_last.reverse
  end

  def double_i
    sum = []
    reverser.each_with_index do |num, index|
      if index.even?
        num = ((num.to_i) * 2).to_s
      end 
      sum << num
    end
    sum
  end

  def adds_over_ten
   above_ten = []
    double_i.each do |num|
      num = num.to_i
      if num > 9
        num -= 9
      end
      above_ten << num.to_s
    end
    above_ten
  end

  def adds_together
    sum = 0
    adds_over_ten.each do |num|
      num = num.to_i
      sum += num
    end
    sum 
  end

  def the_total
    adds_together + make_array[-1].to_i
  end

  def is_valid?
    if adds_together % 10 == 0
      valid = true
    end
  end
end

# binding.pry
# ""