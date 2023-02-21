require "transaction"

RSpec.describe Transaction do
  it "constructs" do
    transaction = Transaction.new("23/03/2023", 300, 0)
    expect(transaction.date).to eq "23/03/2023"
    expect(transaction.credit).to eq 300
    expect(transaction.debit).to eq 0
  end
end
