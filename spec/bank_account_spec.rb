require "bank_account"

RSpec.describe BankAccount do
  it "returns an empty transaction array" do 
  my_account = BankAccount.new
  expect(my_account.get_transactions_with_balance).to eq([])
  end
end

