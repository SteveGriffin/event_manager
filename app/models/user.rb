class User < ActiveRecord::Base
	has_many :attendees, dependent: :destroy
	has_many :events, dependent: :destroy
	has_one :subscription, dependent: :destroy

	validates :email, presence: true
end
