require 'pry'

class CashRegister

  attr_accessor :previous_total, :total

  def initialize(employee_discount = 100)
    @total = 0.0
    @employee_discount = employee_discount
    @items = []
  end

  def discount
    @employee_discount
  end

  def total
    @total
  end

  def add_item(title,price,quantity = 1)
    self.previous_total = @total
    @total += (price*quantity)
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @employee_discount == 100
      return "There is no discount to apply."
    end
    @total = @total*(100.0 - @employee_discount.to_f)/100
    "After the discount, the total comes to $#{@total.to_int}."
  end

  def items
    @items
  end

  def void_last_transaction
    @total = self.previous_total
  end

end
