class Product < ApplicationRecord

  validates :name,                presence: true, length: { maximum: 40 }
  validates :explanation,         presence: true, length: { maximum: 1000 }
  validates :condition,           presence: true
  validates :preparationdays,     numericality: { onlu_integer: true, less_than_or_equal_to: 7 }
  validates :category_id,         numericality: { only_integer: true, less_than_or_equal_to: 1000 } 
  validates :price,               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000 }
  validates :is_shipping_buyer,   inclusion: { in: [true, false] }
  
  validates_associated :pictures
  validates :pictures, presence: true

  belongs_to :user
  belongs_to :saler, class_name: "User", optional: true, dependent: :destroy
  belongs_to :buyer, class_name: "User", optional: true, dependent: :destroy
  belongs_to :category
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  enum condition: { unused: 0, near_unused: 1, no_noticeable_scratches_dirt: 2, some_scratches_dirt: 3, scratches_dirt: 4 }

end
