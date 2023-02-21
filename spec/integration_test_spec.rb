require "bank_account"
require "transaction"

RSpec.describe BankAccount do
  it "returns an array containing one transaction" do
    my_account = BankAccount.new
    my_account.deposit(1000.00)
    expect(my_account.get_transactions_with_balance.length).to eq(1)
  end
end