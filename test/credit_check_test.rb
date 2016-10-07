require_relative "test_helper"
require_relative "../lib/credit_check"


class CreditCheckTest < Minitest::Test


  def test_it_recognizes_short_card_numbers
    cc = CreditCheck.new

    assert "The card number is invalid", cc.short_card_number(345829495)
  end

  def test_number_has_been_split_into_array_or_fixnums
    cc = CreditCheck.new



    assert_equal [6, 0, 1, 1, 7, 9, 7, 6, 6, 8, 8, 6, 7, 8, 2, 8], cc.split_digits(6011797668867828)
  end

  def test_numbers_have_been_doubled
    cc = CreditCheck.new


    assert_equal [6, 0, 1, 2, 7, 18, 7, 12, 6, 16, 8, 12, 7, 16, 2, 0], cc.double_numbers(6011797668867828)
  end

  def test_double_digit_numbers_have_been_removed
    cc = CreditCheck.new

    assert_equal [6, 0, 1, 2, 7, 9, 7, 3, 6, 7, 8, 3, 7, 7, 2], cc.remove_double_digit_numbers(6011797668867828)
  end

  def test_it_finds_the_sum_of_numbers
    cc = CreditCheck.new

    
    assert number_sum = 83, cc.sum_of_numbers(6011797668867828)
  end

  def test_it_returns_valid_or_invalid
    cc = CreditCheck.new

    assert "The number is valid", cc.sum_of_numbers(4024007136512380)
    assert "The number is invalid", cc.sum_of_numbers(6011797668867828)
  end
end
