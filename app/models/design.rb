class Design < ApplicationRecord
	validates :name, presence: true
	# Prevents user saving same design twice
	validates :name, uniqueness: true
end
