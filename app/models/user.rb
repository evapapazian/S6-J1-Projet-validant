class User < ApplicationRecord
	after_create :welcome_send
	has_many :attendances, dependent: :destroy
	has_many :events, through: :attendance
	has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event", dependent: :destroy #si on détruit user ça détruit l'attendance
	

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end 


