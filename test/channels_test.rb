require_relative "test_helper"

#know need to to test intialize
describe "Channel Class" do
  before do
    VCR.use_cassette("channel_list") do
      @channel = Channel.list_channels
    end
  end

  it "Test List Channels Method " do
    #testing that we are return an Array
    #testing that we are return a channel array
    #test that the channel is count is an Integer
    #there are currently 3 channels on
    expect(@channel).must_be_kind_of Array
    expect(@channel[0]).must_be_kind_of Channel
    expect(@channel.length).must_be_kind_of Integer
    expect(@channel.length).must_be :>, 0
    @channel.each do |channel|
      expect(channel).must_be_kind_of Channel
    end
  end
  it "can make collect details of Channels" do
    @channels = Channel.new("CUTE4M96W","general", "Company-wide announcements and work-based matters",5)
    # expect(@channels.details.name).must_equal "general"
    expect(@channels.details[0].split(":")[1]).must_equal("general") #array implementation of details
    # expect(details[name]).must_equal("general") #hash implementation of details
    # expect(details[1]).must_equal("CUTE4M96W")
  end
end
describe "Return an error" do
  it "Returns error if incorrect querty given" do
    VCR.use_cassette("bogus") do
      expect { Channel.list_users.must_raise SlackAPI::SlackAPIError }
    end
  end
end
