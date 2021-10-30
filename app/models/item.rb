class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :is_active, presence: true

  attachment :image

  def with_tax_price
    (price * 1.1).floor
  end

  def self.search(search)
      if search
        Item.where(['name LIKE ?', "%#{search}%"])
      else
        Item.all
      end
  end

end
