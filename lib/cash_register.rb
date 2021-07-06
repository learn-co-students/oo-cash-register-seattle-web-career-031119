require 'pry'

class CashRegister

  attr_accessor :total, :title, :price, :discount, :last_transaction

  def initialize(discount=0, total =0)
    @total = total
    @discount = discount
    # binding.pry
  end

  def add_item(title, price, quantity = 1)
    @total = @total + price*quantity
    @cart ||= []
    quantity.times do
      @cart << title
    end
    @last_transaction = price * quantity
  end

  def apply_discount
    # binding.pry
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total = total - total * (discount / 100.00)
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @total = total - last_transaction
  end

end
