require 'pry'
class CashRegister

  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(item, price, quantity = 1)
    @total += price * quantity
    quantity.times do
      items << item
    end
    @transactions << {
      :item => item,
      :price => price,
      :quantity => quantity
    }
  end

  def apply_discount
    if discount != 0
      @total *= 1- @discount/100.0
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    most_recent_transaction = @transactions.pop
    @total -= most_recent_transaction[:price] * most_recent_transaction[:quantity]
    @items.reject {|item| item == most_recent_transaction[:item]}
  end

end
