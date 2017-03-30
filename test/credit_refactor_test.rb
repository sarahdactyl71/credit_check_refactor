gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_refactor'
require 'pry'

class CreditCheckTest < Minitest::Test
  
  def test_does_it_exist
    c = CreditCheck.new(12345)
    assert_instance_of CreditCheck, c
  end

  def test_does_it_take_a_number
    c = CreditCheck.new(12345)
    assert_equal 12345, c.card_number
  end

  def test_breaks_into_chars
    c = CreditCheck.new("12345")
    assert_equal ["1", "2", "3", "4", "5"], c.make_array
  end

  def test_eats_last
    c = CreditCheck.new("12345")
    assert_equal ["1", "2", "3", "4"], c.eat_last
  end

  def test_does_it_reverse
    c = CreditCheck.new("12345")
    assert_equal ["4", "3", "2", "1"], c.reverser
  end

  def test_double_even_indexes
    c = CreditCheck.new("12345")
    c2 = CreditCheck.new("56789")
    assert_equal ["8","3","4","1"], c.double_i
    assert_equal ["16","7","12","5"], c2.double_i
  end

  def test_it_adds_items_more_than_ten
    c = CreditCheck.new("56789")
    assert_equal ["7","7","3","5"], c.adds_over_ten
  end

  def test_sums_the_array_together
    c = CreditCheck.new("56789")
    c2 = CreditCheck.new("12345")
    assert_equal 22, c.adds_together
    assert_equal 16, c2.adds_together
  end

  def test_add_last_to_sum
    c = CreditCheck.new("56789")
    assert_equal 31, c.the_total
  end

  def is_valid?
    c = CreditCheck.new("56789")
    c2 = CreditCheck.new("6011797668867828")
    assert_equal false, c.is_valid?
    assert_equal true, c2.is_valid?
  end
end