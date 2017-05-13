class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.inject(0) {|sum, li| sum + li.item.price * li.quantity}
  end

  def add_item(itemid)
    if items.find_by(id: itemid)
      @li = line_items.find_by(item_id: itemid)
      @li.quantity += 1
      @li
    else
      @li = LineItem.new(cart_id: self.id, item_id: itemid, quantity: 1)
    end
    # @li = line_items.find_or_create_by(item_id: itemid)
    # @li.quantity += 1
    # @li
  end

end
