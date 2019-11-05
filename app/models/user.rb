class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	after_create :welcome_send
  validates :email, uniqueness: true 
  validates_uniqueness_of :email
	has_many :attendances, dependent: :destroy
	has_many :events, through: :attendance
	has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event", dependent: :destroy #si on détruit user ça détruit l'attendance
	

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end 


