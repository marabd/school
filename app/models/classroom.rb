class Classroom < ActiveRecord::Base
	validates_presence_of :name, :teacher, :size
	belongs_to :schoolhouse

	def class_info
		"#{teacher} has a class of #{size} students"
	end

	def class_size
		if(size > 25)
			"large"
		elsif(size > 18)
			"medium"
		else
			"small"
		end
	end
end

