require "./bank_account.rb"
describe BankAccount do
  context "with all minimum balance requirement met" do
    before(:each) do
      @account1 = BankAccount.new(1000, "Juan")
      @account2 = BankAccount.new(1000, "Sarah")
    end

    it "is created with an opening balance and the name of the client" do
      expect(@account1).to be_a(BankAccount)
    end

    it "can report it's balance" do
      expect(@account1.balance).to eq(1000)
    end

    it "can make deposits" do
      expect(@account1.deposit(500)).to eq(1500)
    end

    it "can make withdrawals" do
      expect(@account1.withdrawal(500)).to eq(500)
    end

    it "can transfer funds to another bank account" do
      @account1.transfer(100, @account2)
      expect(@account1.balance).to eq(900)
      expect(@account2.balance).to eq(1100)
    end

    it "throws an error if minimum opening balance of 200 is not met" do
      expect{ BankAccount.new(100, "Sarah") }.to raise_error(ArgumentError)
    end

    it "allows the user to change the minimum balance" do
      BankAccount.minimum_balance= 500
      expect {BankAccount.new(300, "Sarah")}.to raise_error(ArgumentError)
      expect {BankAccount.new(500, "Sarah")}.to_not raise_error(ArgumentError)
    end
  end
end
