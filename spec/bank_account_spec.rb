require "./app/bank_account"

describe BankAccount do
  let(:account) { BankAccount.new("John", 200, 0) }

  describe 'Getters' do
    it 'has a way to access the account name' do
      expect(account.name).to eq 'John'
    end

    it 'has a way to access the account balance' do
      expect(account.balance).to be_a Integer
    end

    it 'has a way to access the overdraft' do
      expect(account.overdraft).to be_a Integer
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

  describe '#overdraft' do
    it 'changes the account overdraft' do
      account.set_overdraft
      expect(account.set_overdraft).to eq -150
    end
  end
end
