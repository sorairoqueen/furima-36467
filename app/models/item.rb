class Item < ApplicationRecord
  has_one_attached :image
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  validates :item_name, :content, presence: true

  validates :item_category_id, :item_status_id, :fee_resp_id, :prefecture_id, :delivery_term_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :fee_resp
  belongs_to :prefecture
  belongs_to :delivery_term

end