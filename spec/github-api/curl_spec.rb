require 'json'
require 'net/http'

describe 'CURLing github stats api' do
  it 'returns contributor json' do
    uri = URI('https://api.github.com/repos/joemsak/learning-tests/stats/contributors')
    json = Net::HTTP.get(uri)
    JSON.parse(json)[0]['author']['login'].should == 'joemsak'
  end
end
