class Attendance < ApplicationRecord

	belongs_to :user 
	belongs_to :event 
	belongs_to :administrator, class_name: "User"
	after_create :participation
	
	 def participation
    AttendanceMailer.participation_bienvenue(self.event.administrator, self.user).deliver_now #l'admin appartient à l'event, et le self user pour appeler le user email dans le html
 	 end



end
