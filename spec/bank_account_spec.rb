require "bank_account"

describe BankAccount do
  let(:account) { BankAccount.new("John Lennon", 200) }

  describe 'Getters' do
    it 'has a way to access the account name' do
      expect(account.name).to eq 'John Lennon'
    end

    it 'has a way to access the account balance' do
      expect(account.balance).to be_a Integer
    end
  end

  describe '#add_transaction (private)' do
    it 'add transactions to your account' do
      account.send(:add_transaction, 200)
      expect(account.instance_variable_get(:@transactions).length).to eq 2
    end

    it 'update its balance when a new transaction is made' do
      account.send(:add_transaction, -100)
      expect(account.balance).to eq 100
    end
  end

  describe '#withdraw' do
    it 'changes the account balance' do
      account.withdraw(50)
      expect(account.balance).to eq 150
    end

    it 'returns a message containing the withdrawn amount' do
      expect(account.withdraw(150)).to match /150/
    end
  end

  describe '#deposit' do
    it 'changes the account balance' do
      account.deposit(200)
      expect(account.balance).to eq 400
    end

    it 'returns a message containing the deposit amount' do
      expect(account.deposit(150)).to match /150/
    end
  end
end
