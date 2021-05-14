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

    it 'should be 1' do

      number = 5

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(1)
    end

    it 'should be 2' do

      number = 8

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(2)
    end

    it 'should be 3' do

      number = 12

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(3)
    end
    it 'should be 2' do

      number = 23

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(5)
    end

    it 'should be 7' do

      number = 56

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(7)
    end

    it 'should be 9' do

      number = 56

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(9)
    end

    it 'should be -1' do

      number = 1

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(-1)
    end

    it 'should be -1' do

      number = 100

      expect(Algorithymsolver::BinarySearch.new(list_standard: @array, number: number).search).to eq(-1)
    end
  end

end