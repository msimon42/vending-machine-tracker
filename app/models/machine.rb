class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines

  def avg_price
    snacks.average(:price)
  end

  def snack_count
    snacks.length
  end
end
