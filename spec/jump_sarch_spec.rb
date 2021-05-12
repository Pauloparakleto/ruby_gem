# frozen_string_literal: true

RSpec.describe Algorithymsolver::JumpSearch do
  it "should sum 10" do
    array = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
    number = 55
    expect(Algorithymsolver::JumpSearch.new(array, number).search).to eql(10)
  end

  it "should sum 20" do
    array = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
    number = 610
    expect(Algorithymsolver::JumpSearch.new(array, number).search).to eql(15)
  end

  it "should sum 20" do
    array = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
    number = 200
    expect(Algorithymsolver::JumpSearch.new(array, number).search).to eql(-1)
  end
end
