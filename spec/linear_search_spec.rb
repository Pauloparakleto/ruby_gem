RSpec.describe Algorithymsolver::LinearSearch do
  it 'should find number index' do
    list = [10, 20, 80, 30, 60, 50, 110, 100, 130, 170]
    number = 110

    result = Algorithymsolver::LinearSearch.new(list, number).search

    expect(result).to eq(6)
  end

  it 'should be nil' do
    list = [10, 20, 80, 30, 60, 50, 110, 100, 130, 170]
    number = 200

    result = Algorithymsolver::LinearSearch.new(list, number).search

    expect(result).to eq(-1)
  end
end