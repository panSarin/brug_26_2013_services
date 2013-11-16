class PoliciesProduct < ActiveRecord::Base
  attr_accessible :product_id, :policy_id
  belongs_to :product
  belongs_to :policy
end
