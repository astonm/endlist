require 'endlist'

describe Endlist::Client do
  before do
    @client = Endlist::Client.new
  end

  it "should save something" do
    @client.save ['1','2','3']
    p @client
  end

  it "should save and fetch something" do
    list = ['1','2','3']
    key = @client.save list
    found_list = @client.find key
    found_list.should eq(list)
  end
end
