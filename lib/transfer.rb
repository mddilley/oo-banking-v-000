class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status
  attr_reader :last_transaction

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def self.all
    @@all
  end

  def save
    self.all << self
  end

  def valid?
    sender.valid? && receiver.valid? && (sender.balance - @amount > 0)
  end

  def execute_transaction
    if self.valid? && @status = "pending"
      sender.balance -= @amount
      receiver.deposit(@amount)
      @status = "complete"
      @amount = 0
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    #save
  end

  def reverse_transfer
    #binding.pry
    # if @@all.last.status == "complete"
    #   sender.balance += self.all.last.amount
    #   receiver.balance -= sender.balance += self.all.last.amount
    #   @status = "reversed"
    # end
  end

end
