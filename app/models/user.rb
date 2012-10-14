class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :real_name
  # attr_accessible :title, :body

  has_many :stores, foreign_key: :owner_id
  has_many :orders, foreign_key: :customer_id

  def name
    real_name
  end
end
