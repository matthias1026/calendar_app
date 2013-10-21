class Event < ActiveRecord::Base
	before_save { self.name = name.downcase } 
	validates :name, presence: true, length: { maximum: 50 }
	validates :description, presence: true, uniqueness: { case_sensitive: false }
end
