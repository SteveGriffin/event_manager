class Event < ActiveRecord::Base
	belongs_to :user
	has_many :attendees

	validates :user_id, presence: true
end
