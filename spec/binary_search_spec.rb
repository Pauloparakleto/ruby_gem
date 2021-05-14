# frozen_string_literal: true

RSpec.describe Algorithymsolver::BinarySearch do
  xcontext 'should find' do
    before do
      @array = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
    end

    it 'should be 0' do
      number = 2

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(0)
    end

    it 'should be 9' do
      number = 56

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(9)
    end
  end

  xcontext 'not find' do
    before do
      @array = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
    end

    it 'should be -1' do
      number = 100

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(-1)
    end
  end
end
