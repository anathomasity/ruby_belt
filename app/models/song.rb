class Song < ActiveRecord::Base
	has_many :adds
	has_many :users, through: :adds

	validates :artist, :title, presence: true
end