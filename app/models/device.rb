class Device < ActiveRecord::Base
	has_many :connections
	has_many :users, through: :connections

	validates :name, presence: true
end
