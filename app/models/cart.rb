class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total = 0
    line_items.each do |li|
      total = total + (li.item.price * li.quantity)
    end
    total
  end

  def add_item(itemid)
    @line_item = LineItem.new(cart_id: self.id, item_id: itemid)

    if items.find_by(id: itemid)
      @li = line_items.find_by(item_id: itemid)
      @li.quantity += 1
      @li.save
    end
  end

end
