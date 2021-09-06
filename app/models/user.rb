class User < ApplicationRecord
  has_one_attached :profile_pic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :questions
  has_many :answers
  
  has_many :follower_followships,
    class_name: "Followship",
    foreign_key: "follower_id",
    dependent: :destroy

  has_many :followees, through: :follower_followships

  has_many :followee_followships,
    class_name: "Followship",
    foreign_key: "followee_id",
    dependent: :destroy

  has_many :followers, through: :followee_followships

  def self.follow(user)
    
    binding.pry
    
    self.followees << user
  end

  def unfollow(followed_user)
    followees.delete followed_user
  end

  def username
    "#{first_name} #{last_name}"
  end 

  def self.can_view_button(user, question)
    return true if question.user != user
  end
end
