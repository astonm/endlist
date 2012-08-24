require 'endlist'

describe Endlist::HTTP do
  it "should store something" do
    key = Endlist::HTTP.store([1,2,3])
    key.is_a?(String).should eq(true)
  end

  it "should fetch something" do
    list = Endlist::HTTP.fetch('9EhUL')
    list.is_a?(Array).should eq(true)
  end
end
