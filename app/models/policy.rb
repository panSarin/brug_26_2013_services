class Policy < ActiveRecord::Base
  attr_accessible :number, :client, :commission, :collection, :user_id
  has_many :policies_products
  has_many :products, through: :policies_products
end
