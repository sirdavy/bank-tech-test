# Bank Tech Test #

**This is my attempt at the Makers Academy Bank Test, a tech test designed to flex your OO design and TDD skills and to be completed alone. The specifications for the test is as below**

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Design & Planning ##

* Built user stories out from the test specifications as if they were a client brief
* Flagged up nouns and verbs in order to identify Classes, Methods and Variables
* A long session of spitball-diagramming; open-minded, nothing set in stone.
![Diagramming](https://github.com/sirdavy/bank-tech-test/blob/main/bank_test_diagram.png)
* Classes and functions outlined in template along with test examples.

## Approach to Structure ##
* Test could have been fulfilled with a single class but settled on a two class system for futureproofing.
* Transaction Class (deals with date, credit, debit) 
* BankAccount Class (deals with functions of deposit, withdraw, getting all transactions with balance, and printing statements)
* For security reasons I thought it was a good idea *not* to have a instance variable containing the balance 


## Installing & Running the code ##

* Install Ruby & RVM - visit here https://rvm.io/

* In the root folder install the latest Ruby
```
; rvm get stable
; rvm use ruby --latest --install --default
```
* Navigate to lib folder and open IRB 
```
cd lib
irb
```
* Require the files
```
require './bank_account.rb'
require './transaction.rb'
```
* Commands 
The amount is an integer, which, inside the code, is transformed into a currency format with two decimal spaces.
```
BankAccount.deposit(amount)
```
Again, the withdrawal amount is an integer.
```
BankAccount.withdraw(amount)
```
The statement is printed, ommitting spaces for credit or debits if they are not present (as required in the test specification).
```
BankAccount.print_statement
```
![Screenshot of program](https://github.com/sirdavy/bank-tech-test/blob/main/bank_test_working.png)

# Testing #
Testing was carried out using rspec and SimpleCov. 
All tests pass with a 100% coverage.
![Test results](https://github.com/sirdavy/bank-tech-test/blob/main/bank_test_tests.png)
