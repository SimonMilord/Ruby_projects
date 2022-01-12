class Calculator
  def add(*numbers)
    sum = 0

    for i in 0 ...numbers.length
      sum = sum + numbers[i]
    end
    return sum
  end

  def multiply(number1, number2)
    return number1 * number2
  end

  def substract(number1, number2)
    return number1 - number2
  end

  def division(number1, number2)
    return number1 / number2
  end

end