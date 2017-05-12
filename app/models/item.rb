class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    @ai = []
    all.each do |item|
      @ai << item unless item.inventory == 0
    end
    @ai
  end
end
