

class CashRegister

  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def discount
    @discount
  end

  def add_item(title, price, quantity = 1)
    @last = (price * quantity)
    quantity.times { @items << title }
    @total += @last
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total = total - (total * (discount.to_f / 100))
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last
  end

end
