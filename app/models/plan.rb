class Plan < ActiveRecord::Base
	has_many :subscriptions

	validates :price, presence: true
end
