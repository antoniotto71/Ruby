module Convertible
  def ctf(celsius)
    celsius * 9.0 / 5 + 32
  end

  def ftc(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

class Temperature
  extend Convertible
end

f = Temperature.ctf(33)

c = Temperature.ftc(99.9)

p f

p c
