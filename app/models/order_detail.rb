class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: { impossible: 0, waiting: 1, making: 2, complete: 3 }

  def with_tax_price
    (price * 1.1).floor
  end

end
