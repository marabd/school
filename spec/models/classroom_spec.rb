require 'rails_helper'

RSpec.describe Classroom, type: :model do
	# @schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
	describe 'validations' do
		it { should validate_presence_of :name }
		it { should validate_presence_of :teacher }
		it { should validate_presence_of :size }
	end

	describe '#class_info' do
		before(:each) do
   		@schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
 		end
		it 'returns teacher name and class size' do
			classroom = @schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Robertson', size: 27)
			expect(classroom.class_info).to eq("#{classroom.teacher} has a class of #{classroom.size} students")
		end
	end

	describe '#class_size' do
		before(:each) do
   		@schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
 		end
		it 'returns large if classroom size is > 25' do
			classroom = @schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Robertson', size: 27)
			expect(classroom.class_size).to eq('large')
		end

		it 'returns medium if classroom size is > 18' do
			classroom = @schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Robertson', size: 20)
			expect(classroom.class_size).to eq('medium')
		end

		it 'returns small if classroom size is < 18' do
			classroom = @schoolhouse.classrooms.create(name: '3rd Grade', teacher: 'Ms. Robertson', size: 14)
			expect(classroom.class_size).to eq('small')
		end
	end
end
