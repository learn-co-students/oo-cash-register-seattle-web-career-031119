require 'pry'

class CashRegister

  attr_accessor :discount, :total, :title

  def initialize (*discounts)
    @total = 0
    @item = []
    @current_item = 0
    discounts.each {|discount| @discount = discount}
  end

  def add_item(title, price, *quantity)

    quantity.each {|q| @quant = q}

    if @quant
      @current_item = price*@quant
      (0...@quant).each {|n| @item << title}
    else
      @current_item=price
      @item << title
    end
    self.total += @current_item
  end

  def apply_discount
    if discount
      discount_percent = (1-(discount.to_f/100)).to_f
      self.total *= discount_percent
      (self.total).to_i
      "After the discount, the total comes to $#{(self.total).to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item
  end

  def void_last_transaction
    self.total -= @current_item
  end

end
