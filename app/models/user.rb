class User < ActiveRecord::Base
  # Model relationships
  has_many :study_plans
  has_many :courses

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :first_name, :last_name

  # Setup roles for authentication with cancan.
  ROLES = %w[admin faculty student]

end
