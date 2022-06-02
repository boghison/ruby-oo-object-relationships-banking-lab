class BankAccount
    attr_reader :name
    attr_accessor :status, :balance
    def initialize(name)
        @name = name
        @status = "open"
        @balance = 1000
    end

    def deposit(money)
        @balance += money
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        @balance > 0 && @status == "open"
    end

    def close_account
        @status = "closed"
    end
end
