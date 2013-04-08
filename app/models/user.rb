class User < ActiveRecord::Base
  # Model relationships
  has_many :courses
  has_many :enrollments, :dependent => :destroy
  has_many :homeworks, :dependent => :destroy

  has_many :study_plans, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

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
  
  def self.enrolled(course)
    joins(:enrollments).where(:enrollments => {:course_id => course.id})
  end

  def feed
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
end
