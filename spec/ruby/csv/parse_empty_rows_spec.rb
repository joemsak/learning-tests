require 'csv'

describe CSV do
  describe ".parse" do
    it "skips blank rows" do
      csv    = "h1,h2\na,b\n,\n,\nx,y"
      parsed = CSV.parse(csv, skip_blanks: true)

      parsed.length.should == 3
      parsed[2][1].should == 'x'
    end
  end
end
