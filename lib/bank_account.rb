class BankAccount
  def initialize
    @transactions = []
  end

  def deposit(amount)
    transaction = Transaction.new(Time.now.strftime("%d/%m/%Y"), amount, 0)
    @transactions << transaction
  end

  def withdraw(amount)
    transaction = Transaction.new(Time.now.strftime("%d/%m/%Y"), 0, amount)
    @transactions << transaction
  end

  def get_transactions_with_balance
    transactions_with_balance = []
    balance = 0
    @transactions.each do |transaction|
      if transaction.credit > 0
        balance += transaction.credit
        transactions_with_balance << {
          date: transaction.date,
          credit: transaction.credit,
          debit: 0,
          balance: balance
        }
      else
        balance -= transaction.debit
        transactions_with_balance << {
          date: transaction.date,
          credit: 0,
          debit: transaction.debit,
          balance: balance
        }
      end
    end
    transactions_with_balance
  end


  def print_statement
    puts "Date || Credit || Debit || Balance"
    transactions_with_balance = get_transactions_with_balance.reverse
    transactions_with_balance.each do |transaction|
      credit = transaction[:credit] == 0 ? "" : "%.2f" % transaction[:credit]
      debit = transaction[:debit] == 0 ? "" : "%.2f" % transaction[:debit]
      puts "#{transaction[:date]} || #{credit} || #{debit} || #{'%.2f' % transaction[:balance]}"
    end
  end
  




end
