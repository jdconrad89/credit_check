require 'pry'

class CreditCheck
  attr_reader :digits, :double, :remove, :deleted

  def short_card_number(number)
    if number.to_s.length < 15
      puts "The card number is invalid"
    end
  end

  def split_digits(number)
    number.to_s.split(//).map(&:to_i)

  end

  def double_numbers(number)
    digits = split_digits(number)
    @deleted = digits.delete_at(-1)
    @double = digits.each_slice(2).flat_map do |a, b|
      [a, (b.to_i * 2)]
    end

  end

  def remove_double_digit_numbers(number)
    double_numbers(number).delete_at(-1)
    @remove = double.compact.map do |num|
      if num > 9
        num - 9
      else
        num
      end
    end
  end

  def sum_of_numbers (number)
    remove_double_digit_numbers(number)
    number_sum = remove.insert(-1, deleted).reduce(:+)
    if number_sum % 10 == 0
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
end
