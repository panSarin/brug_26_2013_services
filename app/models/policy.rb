class Policy < ActiveRecord::Base
  audited
  attr_accessible :number, :client, :commission, :collection, :user_id, :product_ids, :audited_params, :audited_referer
  has_many :policies_products
  has_many :products, through: :policies_products
end
