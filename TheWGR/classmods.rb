module M
  def report
    puts "'report' method in module M"
  end
end

# class C
#   include M
# end

# class D < C
# end

# obj = D.new
# obj.report

module InterestBearing
  def calculate_interest
    puts "Placeholder! We're in module InterestBearing."
  end
end

class BankAccount
  include InterestBearing
  def calculate_interest
    puts "Placeholder! We're in class BankAccount."
    puts "And we're overriding the calculate_interest method..."
    puts "which was defined in te InterestBearing module."
  end
end

account = BankAccount.new
account.calculate_interest

module N
  def report
    puts "'report' method in module N"
  end
end

class C
  include M
  # include N
  def report
    puts "'report' method in class C"
    puts "About to trigger the next higher-up report method..."
    super
    puts "Back from the 'super' call."
  end
end

c = C.new

c.report
