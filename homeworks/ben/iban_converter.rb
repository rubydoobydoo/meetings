# converting long IBANs to short keys
class IBAN
  attr_accessor :iban, :simple_iban
  require 'radix'
  def initialize(iban)
    @iban = iban
    #@simple_iban =
  end

  def compress(number)
    base = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ§$%&/!?".split("")
    count = base.count
    number.b(count)
  end

  def decompress(number)
    number.to_i(36)
  end

  def encrypt(number)
    number += 48635
  end

  def decrypt(number)
    number -= 48635
  end

end


i =
puts p.inspect
