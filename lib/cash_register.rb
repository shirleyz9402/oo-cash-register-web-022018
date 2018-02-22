require'pry'
class CashRegister
  attr_accessor :discount, :total, :item, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @item =[]
  end

  def add_item(title, price, quantity = 1)
      self.total += price * quantity
      quantity.times do
        @item << title
      end
      @last_transaction = price * quantity
  end
  def apply_discount
    if self.discount == nil
      return "There is no discount to apply."
    else
      self.total = (@total * (1 - self.discount.to_f/100)).to_i
      return "After the discount, the total comes to $#{@total}."
    end
  end
  def items
    self.item
  end

  def void_last_transaction
    @total = self.total - self.last_transaction
  end
end
