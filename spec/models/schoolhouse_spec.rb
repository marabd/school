require 'rails_helper'

RSpec.describe Schoolhouse, type: :model do
	describe 'validations' do
		it { should validate_presence_of :name }
		it { should validate_presence_of :level }
		it { should validate_presence_of :enrollment }
	end

	describe '#school_info' do
		it 'returns name and enrollment message' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 500, level: 'Elementary')
			expect(schoolhouse.school_info).to eq("#{schoolhouse.name} has #{schoolhouse.enrollment} students")
		end
	end

	describe '#school_size' do
		it 'returns large if school size is > 2000' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 5000, level: 'Elementary')
			expect(schoolhouse.school_size).to eq('large')
		end

		it 'returns large if school size is == 2000' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 2000, level: 'Elementary')
			expect(schoolhouse.school_size).to eq('large')
		end

		it 'returns medium if school size is > 800' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 1000, level: 'Elementary')
			expect(schoolhouse.school_size).to eq('medium')
		end

		it 'returns small if school size is < 800' do
			schoolhouse = Schoolhouse.create(name: 'Orrington', enrollment: 100, level: 'Elementary')
			expect(schoolhouse.school_size).to eq('small')
		end
	end
end