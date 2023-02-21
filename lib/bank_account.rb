class BankAccount

  def initialize
    @transactions = []
  end

  def deposit(amount)
    transaction = Transaction.new(Time.now.strftime("%d/%m/%Y"), 0, amount)
    @transactions << transaction
  end

  def get_transactions_with_balance
    return @transactions
  end

end