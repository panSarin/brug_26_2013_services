class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  has_many :roles_users
  has_many :roles, through: :roles_users
  has_many :policies

  def role?(name)
    roles.map {|role| role.name}.include?(name)
  end

end
