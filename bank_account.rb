class BankAccount

  attr_accessor :balance, :name

  @@minimum_balance = 200

  def self.minimum_balance= (min)
    @@minimum_balance = min
  end

  def initialize(balance=200, name)
    raise ArgumentError if balance < @@minimum_balance
    @balance = balance
    @name = name
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(amount)
    @balance -= amount
  end

  def transfer(amount, account)
    @balance -= amount
    account.balance += amount
  end

end
