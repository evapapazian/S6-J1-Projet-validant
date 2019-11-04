class Event < ApplicationRecord
	validates :start_date, presence: true , no_past_event: {message: "la date de départ ne peut pas être dans le passé"}
	validates :duration, presence: true, multiple_of_5: {message: "la durée doit être un multiple de 5"}
	validates :title, presence: true , length: { minimum: 5 }, length: { maximum: 140}
	validates :description, presence: true, length: {minimum: 20}, length: { maximum: 1000}
	validates :price, presence: true, numericality: {greater_than: 0, less_than: 1001}
	validates :location, presence: true 


	
def multiple_of_5

    errors.add(:duration, "la durée doit être un multiple de 5") unless
    self.duration %5 == 0 
end


def no_past_event
	errors.add(:start_date, "la date de départ ne peut pas être dans le passé") unless
	self.start_date > Time.now 
end 


has_many :attendances
has_many :users ,through: :attendance 
belongs_to :user #à supprimer potentiellement, stay tuned 