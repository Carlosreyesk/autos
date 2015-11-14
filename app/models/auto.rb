class Auto < ActiveRecord::Base
	validates :marca, presence: true,
                      length: { minimum: 2 }
end
