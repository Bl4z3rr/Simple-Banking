class BankAccount
  attr_reader :name
  attr_writer :balance, :overdraft

  def initialize(name, balance)

    @name         = name
    @balance      = balance
    @overdraft    = 0
  end

  def withdraw(amount)
    if amount <= @balance
      @balance -= amount
      "You've just withdrawn #{amount} euros. Your balance is: #{@balance}"
    elsif amount > @balance && @overdraft == 0
      "Insufficient funds. To request €150 overdraft type: account.overdraft"
    elsif (@balance - amount) >= @overdraft
      @balance -= amount
      "You've just withdrawn #{amount} euros. Your balance is: #{@balance}"
    elsif (@balance - amount) <= @overdraft
      "Amount exceeds an overdraft limit"
    end
  end

  def deposit(amount)
    @balance += amount
    "You've just deposited #{amount} euros. Your balance is: #{@balance}"
  end

  def overdraft
    @overdraft = -150
    "You've been granted an overdraft: €150"
  end
end

p account = BankAccount.new("Ben", 100)
p account.withdraw(150)
p account.overdraft
p account.withdraw(350)
p account.withdraw(150)
p account.deposit(1000)
