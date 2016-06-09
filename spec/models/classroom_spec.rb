require 'rails_helper'

RSpec.describe Classroom, type: :model do
	describe 'validations' do
		it { should validate_presence_of :name }
		it { should validate_presence_of :teacher }
		it { should validate_presence_of :size }
	end

	describe '#class_info' do
		it 'returns teacher name and class size' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
			classroom = schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Johnson', size: 20)
			expect(classroom.class_info).to eq("#{classroom.teacher} has a class of #{classroom.size} students")
		end
	end

	describe '#class_size' do
		it 'returns large if classroom size is > 25' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
			classroom = schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Johnson', size: 27)
			expect(classroom.class_size).to eq('large')
		end

		it 'returns large if classroom size is == 25' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
			classroom = schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Johnson', size: 25)
			expect(classroom.class_size).to eq('large')
		end

		it 'returns medium if classroom size is > 18' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
			classroom = schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Johnson', size: 19)
			expect(classroom.class_size).to eq('medium')
		end

		it 'returns small if classroom size is < 18' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
			classroom = schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Johnson', size: 14)
			expect(classroom.class_size).to eq('small')
		end
	end
end
