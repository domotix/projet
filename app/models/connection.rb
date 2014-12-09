class Connection < ActiveRecord::Base
	belongs_to :user
	belongs_to :device

	validates :user_id, :device_id, presence: true
end
