class User < ActiveRecord::Base
	has_many :connections
	has_many :devices, through: :connections

	validates :name, presence: true
end
