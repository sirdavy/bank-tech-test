require "bank_account"

RSpec.describe BankAccount do
  
  it "returns an empty transaction array" do 
    my_account = BankAccount.new
    expect(my_account.get_transactions_with_balance).to eq([])
  end

end

describe BankAccount do
  let(:transaction_double_1) { double("Transaction", date: "22/03/2023", credit: 100, debit: 0) }
  let(:transaction_double_2) { double("Transaction", date: "23/03/2023", credit: 0, debit: 50) }
  let(:transaction_double_3) { double("Transaction", date: "24/03/2023", credit: 200, debit: 0) }
  let(:transactions) { [transaction_double_1, transaction_double_2, transaction_double_3] }

  it "tests get_transactions_with_balance in isolation" do
    my_account = BankAccount.new
    my_account.instance_variable_set(:@transactions, transactions)
    expect(my_account.get_transactions_with_balance).to eq([
      {date: "22/03/2023", credit: 100, debit: 0, balance: 100},
      {date: "23/03/2023", credit: 0, debit: 50, balance: 50},
      {date: "24/03/2023", credit: 200, debit: 0, balance: 250}
    ])
  end

  it "tests get_transactions_with_balance in isolation" do
    my_account = BankAccount.new
    my_account.instance_variable_set(:@transactions, transactions)
    expected_output = "Date || Credit || Debit || Balance\n24/03/2023 || 200.00 ||  || 250.00\n23/03/2023 ||  || 50.00 || 50.00\n22/03/2023 || 100.00 ||  || 100.00\n"
    expect { my_account.print_statement }.to output(expected_output).to_stdout
  end
  
end



