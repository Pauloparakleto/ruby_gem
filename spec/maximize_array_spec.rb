RSpec.describe Algorithymsolver::MaximizeArray do
  it "should sum 10" do
    array = [-2, 0, 5, -1, 2]
    k = 4
    expect(Algorithymsolver::MaximizeArray.new(array, k).maximize).to eql(10)
  end

end