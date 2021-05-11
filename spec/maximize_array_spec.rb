# frozen_string_literal: true

RSpec.describe Algorithymsolver::MaximizeArray do
  it "should sum 10" do
    array = [-2, 0, 5, -1, 2]
    k = 4
    expect(Algorithymsolver::MaximizeArray.new(array, k).maximize).to eql(10)
  end

  it "should sum 20" do
    array = [9, 8, 8, 5]
    k = 3
    expect(Algorithymsolver::MaximizeArray.new(array, k).maximize).to eql(20)
  end
end