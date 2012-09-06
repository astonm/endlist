require 'endlist'

describe Endlist::HTTP do
  it "should store something" do
    key = Endlist::HTTP.store([1,2,3])
    key.is_a?(String).should eq(true)
  end

  it "should store and fetch something" do
    key = Endlist::HTTP.store([1,2,3])
    key.is_a?(String).should eq(true)
    list = Endlist::HTTP.fetch(key)
    list.is_a?(Array).should eq(true)
    list.should eq ['1','2','3']
  end
end
