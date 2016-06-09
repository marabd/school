class Schoolhouse < ActiveRecord::Base
	validates_presence_of :name, :level, :enrollment
	has_many :classrooms

	def school_info
		"#{name} has #{enrollment} students"
	end

	def school_size
		if(enrollment >= 2000)
			"large"
		elsif(enrollment > 800)
			"medium"
		else
			"small"
		end
	end
end
