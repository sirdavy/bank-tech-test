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

  it "returns the correct balance" do
    my_account = BankAccount.new
    my_account.deposit(300)
    result = my_account.get_transactions_with_balance
    expect(result[0][:balance]).to eq (300.00)
  end

  it "returns the correct credit amount" do
    my_account = BankAccount.new
    my_account.deposit(400.00)
    result = my_account.get_transactions_with_balance
    expect(result[0][:credit]).to eq (400.00)
  end

  it "returns the correct debit amount" do
    my_account = BankAccount.new
    my_account.withdraw(700.00)
    result = my_account.get_transactions_with_balance
    expect(result[0][:debit]).to eq (700.00)
  end


  it "prints the correct statement to the console" do
    my_account = BankAccount.new
    my_account.deposit(1000)
    my_account.withdraw(500)
    expected_output = "Date || Credit || Debit || Balance\n" +
                      "21/02/2023 ||  || 500.00 || 500.00\n" +
                      "21/02/2023 || 1000.00 ||  || 1000.00\n"
    expect { my_account.print_statement }.to output(expected_output).to_stdout
  end

end

