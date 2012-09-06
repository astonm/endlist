require 'endlist'

describe Endlist::Client do
  before do
    client = Endlist::Client.new
  end

  it "should save something" do
    client.save ['1','2','3']
  end

  it "should save and fetch something" do
  end
end
