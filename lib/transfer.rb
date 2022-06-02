class Transfer
  attr_reader :sender, :receiver, :status
  attr_accessor :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status != "complete"
      if sender.balance < amount || !self.valid?
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
      sender.balance -= amount
      receiver.deposit(amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= amount
      sender.deposit(amount)
      @status = "reversed"
    end
end
end