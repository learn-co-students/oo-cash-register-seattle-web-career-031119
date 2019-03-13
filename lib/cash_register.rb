require 'pry'

class CashRegister
  attr_accessor :discount
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount ||= discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @total += (price * quantity)
    quantity.times do @items << {item => price}
    end
  end

  def apply_discount
    #binding.pry
    if @discount == 0
      p "There is no discount to apply."
    else
      @total *= (1 - (discount/100.0))
      p "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items.map {|item| item.keys[0]}
  end

  def void_last_transaction
    @total -= @items[-1].values[0]
    @items.pop
  end

end
    # if discount == 0
    #   puts "There is no discount to apply."
    # else
    #   @total *= 1 - discount
    # end
