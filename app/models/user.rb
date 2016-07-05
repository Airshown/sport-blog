class User < ActiveRecord::Base
  rolify
  resourcify

  has_many :articles, :foreign_key => 'user_id'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def to_s
      self.username
   end
end
