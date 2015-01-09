class User < ActiveRecord::Base
	has_secure_password

	#attr_accessor :email, :password
	has_many :attendees, dependent: :destroy
	has_many :events, dependent: :destroy
	has_one :subscription, dependent: :destroy

	validates :email, presence: true
	validates_uniqueness_of :email
end
