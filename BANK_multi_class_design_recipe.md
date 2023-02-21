# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

- As an account holder, so I can keep 
track of my money I want to be able 
to make deposits.

- As an account holder, so I can keep 
track of my money I want to be 
able to make withdrawals.

- As an account holder, so I can keep 
track of my money I want to be able 
to print account statements showing 
date, amount and balance

- If I make a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When I print out my bank statement I would see:

date       || credit  || debit  || balance
14/01/2023 ||         || 500.00 || 2500.00
13/01/2023 || 2000.00 ||        || 3000.00
10/01/2023 || 1000.00 ||        || 1000.00



## 2. Design the Class System

NOUNS
deposits, withrawals, 
statements, account, 
money, balance, 
date, amount, credit, debit

VERBS
print, withdraw, deposit

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
│ BankAccount                │
│                            │
│ - withdraw                 │
│ - deposit                  │
│ - print                    │
└───────────┬────────────────┘
            │
            │ owns a collection of Transactions
            ▼
┌─────────────────────────┐
│ Transactions            │
│                         │
│ - date                  │
│ - credit                │
│ - debit                 │
│                         │
└─────────────────────────┘
```

![alt text](https://github.com/[username]/[reponame]/blob/[branch]/image.jpg?raw=true)

![Alt text](/relative/path/to/img.jpg?raw=true "Optional Title")



_Also design the interface of each class in more detail._

```ruby
class BankAccount
  def initialize
    # transactions = []
  end

  def withdraw(amount) # amount is an amount of money being deposited
    # amount gets turned into instance of Transaction with date 
    # maybe Time.now.strftime("%d/%m/%Y %H:%M") #=> "14/09/2011 14:09" removing time when printing
    # is loaded into transactions array
    # Returns nothing
  end

  def deposit(amount)
    # amount gets turned into instance of Transaction with date
    # is loaded into transactions array
  end

  def gets_transactions_with_balance
    # transforms transaction object into hash with balance
  
  def print_statement # keyword is a string
    # Prints a list of transaction in descending date order
  end
end


class Transaction
  attr_reader :date, :credit, :debit

  def initialize(date, credit, debit) # date is date format, credit and debit are integers
  end

end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE


####  integration tests



# returns no transactions when there have been no deposits or withdrawals


my_account = BankAccount.new
my_account.deposit(1000.00)
expect(my_account.get_transactions.length).to eq(1)

my_account = BankAccount.new
my_account.deposit(1000.00)
my_account.withdraw(1000.00)
expect(my_account.get_transactions.length).to eq(2)

my_account = BankAccount.new
my_account.deposit(300)
result = my_account.gets_transactions_with_balance
expect(result[0][:balance])to eq (300.00)

my_account = BankAccount.new
my_account.deposit(400.00)
result = my_account.get_transactions
expect(result[0].credit).to eq (400.00)

my_account = BankAccount.new
my_account.withdraw(700.00)
result = my_account.get_transactions
expect(result[0].credit).to eq (700.00)

my_account = BankAccount.new
my_account.deposit(400.00)
expect(my_account.print_statement).to include("400.00") #not sure if this will work









```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
######## BankAccount class unit tests ########## 

#############it is empty################
my_account = BankAccount.new
expect(my_account.get_transactions_with_balance).to eq([])


########## tests get_transactions_with_balance in isolation ###########
my_account = BankAccount.new
transactions = [
        instance_double(Transaction, date: Time.now.strftime("22/03/2023"), credit: 100, debit: 0),
        instance_double(Transaction, date: Time.now.strftime("23/03/2023"), credit: 0, debit: 50),
        instance_double(Transaction, date: Time.now.strftime("24/03/2023"), credit: 200, debit: 0)
      ]
my_account.instance_variable_set(:@transactions, transactions)
 expect(my_account.get_transactions_with_balance).to eq([
        {date: Time.now.strftime("22/03/2023"), credit: 100, debit: 0, balance: 100},
        {date: Time.now.strftime("23/03/2023"), credit: 0, debit: 50, balance: 50},
        {date: Time.now.strftime("24/03/2023"), credit: 200, debit: 0, balance: 250}
      ])

########## tests print_statement in isolation ###########
my_account = BankAccount.new
transactions = [
        instance_double(Transaction, date: Time.now.strftime("22/03/2023"), credit: 100, debit: 0),
        instance_double(Transaction, date: Time.now.strftime("23/03/2023"), credit: 0, debit: 50),
        instance_double(Transaction, date: Time.now.strftime("24/03/2023"), credit: 200, debit: 0)
      ]
my_account.instance_variable_set(:@transactions, transactions)
expect(my_account.print_statement.lines[1..-1].join).to eq("24/03/2023 || 200.00 ||  || 200.00, 23/03/2023 ||   || 50.00 || 150.00, 22/03/2023 || 100.00 ||  || 250.00")

########## tests withdraw isolation ###########

?????????????????

########## tests deposit in isolation ###########

???????????????????????

################## transaction unit tests ########################

# ########## it constructs ########
transaction = Transaction.new("23/03/2023", 100, 0)
expect(transaction.date).to eq "23/03/2023"
expect(transaction.credit).to eq 100
expect(transaction.debit).to eq 0
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->
