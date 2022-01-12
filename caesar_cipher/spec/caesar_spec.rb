#spec/caesar_spec.rb
require './lib/caesar_cipher'

describe Caesar do
  describe "#caesar_cipher" do
    # test string all lower case with positive key
    it "returns the code encrypted" do
      caesar = Caesar.new
      expect(caesar.caesar_cipher('my name is simon', 5)).to eql('rd sfrj nx xnrts')
    end
    # # test string all lowercase with negative key
    it "returns the code encrypted" do
      caesar = Caesar.new
      expect(caesar.caesar_cipher('my name is simon', -5)).to eql('ht ivhz dn ndhji')
    end
    # test string with uppercase with positive key
    it "returns the code encrypted" do
      caesar = Caesar.new
      expect(caesar.caesar_cipher('My Name is Simon', 5)).to eql('Rd Sfrj nx Xnrts')
    end
    # test string with uppercase with negative key
    it "returns the code encrypted" do
      caesar = Caesar.new
      expect(caesar.caesar_cipher('My Name is Simon', -5)).to eql('Ht Ivhz dn Ndhji')
    end
    # test string with numbers and symbols with positive key
    it "returns the code encrypted" do
      caesar = Caesar.new
      expect(caesar.caesar_cipher('my name is $imon 91', 5)).to eql('rd sfrj nx $nrts 91')
    end
    # test string with numbers and symbols with negative key
    it "returns the code encrypted" do
      caesar = Caesar.new
      expect(caesar.caesar_cipher('my name is $imon 91', -5)).to eql('ht ivhz dn $dhji 91')
    end
    # test empty string
    it "returns the code encrypted" do
      caesar = Caesar.new
      expect(caesar.caesar_cipher('', 5)).to eql('')
    end
  end
end

