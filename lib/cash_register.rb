require 'pry'

class CashRegister

  attr_accessor :total, :discount, :price, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end


  def add_item(item, price, quantity = 1)
    @price = price
    @total += (price * quantity)
      if quantity > 1
        record = 0
        until record >= quantity
          @items << item
          record += 1
        end
      else
        @items << item
    end
  end


  def apply_discount
    if @discount > 0
      @amount_discount = (@price * @discount)/100
      @total -= @amount_discount
        return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end


  def void_last_transaction
    @total -= @price
  end

end
