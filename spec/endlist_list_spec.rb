require 'endlist'

describe Endlist::List do
  it "saves a list" do
    list = Endlist::List[1,2,3]
    list.key.should eq(nil)
    list.save
    list.key.is_a?(String).should eq(true)
  end

  it "finds a list" do
    list = Endlist::List.find('9EhUL')
    list.key.is_a?(String).should eq(true)
  end
end
