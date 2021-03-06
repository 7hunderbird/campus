class User < ActiveRecord::Base
  # Model relationships
  has_many :study_plans
  has_many :courses
  has_many :enrollments, :dependent => :destroy
  has_many :homeworks, :dependent => :destroy

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

end
