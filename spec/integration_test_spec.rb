require "bank_account"
require "transaction"

RSpec.describe BankAccount do
  
  it "returns an array containing one deposit transaction" do
    my_account = BankAccount.new
    my_account.deposit(1000.00)
    expect(my_account.get_transactions_with_balance.length).to eq(1)
  end

  it "returns an array containing one withdrawal transaction" do
    my_account = BankAccount.new
    my_account.withdraw(1000.00)
    expect(my_account.get_transactions_with_balance.length).to eq(1)
  end

  it "returns an array containing two transactions" do
    my_account = BankAccount.new
    my_account.deposit(1000.00)
    my_account.withdraw(1000.00)
    expect(my_account.get_transactions_with_balance.length).to eq(2)
  end

end


# my_account = BankAccount.new
# my_account.deposit(300)
# result = my_account.gets_transactions_with_balance
# expect(result[0][:balance])to eq (300.00)

# my_account = BankAccount.new
# my_account.deposit(400.00)
# result = my_account.get_transactions
# expect(result[0].credit).to eq (400.00)

# my_account = BankAccount.new
# my_account.withdraw(700.00)
# result = my_account.get_transactions
# expect(result[0].credit).to eq (700.00)

# my_account = BankAccount.new
# my_account.deposit(400.00)
# expect(my_account.print_statement).to include("400.00") #not sure if this will work
