require 'chronic'

describe Chronic do
  def assert_parsed(input, bool = true)
    (Chronic.parse(input) != nil).should == bool
  end

  it "doesn't seem to like timezones" do
    assert_parsed('11/15/2013 11:56 PST', false)
    assert_parsed('11/15/2013 11:56 -0400', false)
    assert_parsed('11/15/2013 11:56')
  end
end
