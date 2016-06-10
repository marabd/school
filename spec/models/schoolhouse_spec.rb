require 'rails_helper'

RSpec.describe Schoolhouse, type: :model do
	let(:large_schoolhouse) { FactoryGirl.create(:schoolhouse, :large) }
	let(:schoolhouse) { FactoryGirl.create(:schoolhouse, :medium) }
	let(:small_schoolhouse) { FactoryGirl.create(:schoolhouse, :small) }

	describe 'validations' do
		it { should validate_presence_of :name }
		it { should validate_presence_of :level }
		it { should validate_presence_of :enrollment }
	end

	describe '#school_info' do
		it 'returns name and enrollment message' do
			expect(schoolhouse.school_info).to eq("#{schoolhouse.name} has #{schoolhouse.enrollment} students")
		end
	end

	describe '#school_size' do
		it 'returns large if school size is > 2000' do
			expect(large_schoolhouse.school_size).to eq('large')
		end

		it 'returns medium if school size is > 800' do
			expect(schoolhouse.school_size).to eq('medium')
		end

		it 'returns small if school size is < 800' do
			expect(small_schoolhouse.school_size).to eq('small')
		end
	end
end