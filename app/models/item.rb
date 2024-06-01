class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_burden_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
