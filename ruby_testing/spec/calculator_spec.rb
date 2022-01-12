#spec/calculator_spec.rb
require './lib/calculator'

describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#multiply" do
    it "returns the product of 2 or more numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(2, 5)).to eql(10)
    end
  end

  describe "#substraction" do
    it "returns the difference of 2 or more numbers" do
      calculator = Calculator.new
      expect(calculator.substract(10, 5)).to eql(5)
    end
  end

  describe "#division" do
    it "returns the quotient of 2 or more numbers" do
      calculator = Calculator.new
      expect(calculator.division(10, 5)).to eql(2)
    end
  end
end



