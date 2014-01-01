require 'octokit'

describe "Auth" do
  let!(:client) { Octokit::Client.new netrc: true }

  it "should read from the .netrc" do
    client.login.should == "infoactive"
  end
end

describe "GET a repo" do
  it "returns the JSON response of the resource" do
    repo = Octokit.repo 'mongodb/mongo'

    repo.name.should == 'mongo'
  end
end

describe "GET a repo Graph" do
  it "should be found in the repo attrs" do
    repo = Octokit.repo 'mongodb/mongo'
    author = repo.rels[:contributors].get.data[0]

    author.attrs[:login].should == 'erh'
  end
end
