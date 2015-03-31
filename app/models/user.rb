class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets
  has_many :replies
  after_create :send_welcome_message
  # before_create :user_skip_confirm

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
  #
  # def user_skip_confirm
  #   if user.save
  #     @user.skip_confirmation!
  #   end
  # end

end
