class Design < ApplicationRecord
	validates :name, presence: true
	# Prevents user saving same design twice
	validates :name, uniqueness: { message: "You have already bookmarked this design!" }
end
