require 'rubygems'
gem 'google-api-client', '>0.7'
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'omniauth'
require 'omniauth-google-oauth2'

require 'fileutils'
require 'json'

# REPLACE WITH VALID REDIRECT_URI FOR YOUR CLIENT
REDIRECT_URI = 'http://localhost'
APPLICATION_NAME = 'YouTube Data API Ruby Tests'

# REPLACE WITH NAME/LOCATION OF YOUR client_secrets.json FILE
CLIENT_SECRETS_PATH = '../client_secret.json'

# REPLACE FINAL ARGUMENT WITH FILE WHERE CREDENTIALS WILL BE STORED
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                   "youtube-quickstart-ruby-credentials.yaml")

# SCOPE FOR WHICH THIS SCRIPT REQUESTS AUTHORIZATION
SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_READONLY

class Project::Channel

  @@all_channels = []
  @@all_channels_and_items = []

  attr_accessor :name, :id, :view_count, :date_created, :description, :video_count, :subscriber_count, :all_items

  def initialize(channel_name)
    @name = channel_name
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize
    channels_info_by_username(service, 'snippet,contentDetails,statistics', for_username: @name)
    @all_items = []
    @@all_channels << "#{self.name}"
    @@all_channels_and_items << ["#{self.name}", ["#{(self.video_count)}", "#{(self.date_created)}", "#{(self.description)}", "#{(self.video_count)}", "#{(self.subscriber_count)}"]]
  end

  def authorize
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(
      client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    url = authorizer.get_authorization_url(base_url: REDIRECT_URI)
    puts "Open the following URL in the browser and enter the " +
        "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: REDIRECT_URI)
    credentials
  end

  def channels_info_by_username(service, part, **params)
    response = service.list_channels(part, params).to_json
    item = JSON.parse(response).fetch("items")[0]
    @name = item.fetch("snippet").fetch("title")
    #@id = item.fetch("id")
    @view_count = "The total views for #{name} is: #{item.fetch("statistics").fetch("viewCount")}."
    @date_created = "#{name} was created: #{item.fetch("snippet").fetch("publishedAt")}."
    @description = "#{name}'s description is the following: '#{item.fetch("snippet").fetch("description")}'."
    @video_count = "#{name} has a total number of #{item.fetch("statistics").fetch("videoCount")} videos."
    @subscriber_count = "#{name} has around #{item.fetch("statistics").fetch("subscriberCount")} total subscribers."
  end

  def all_instance_items
    @all_items << @view_count
    @all_items << @date_created
    @all_items << @description
    @all_items << @video_count
    @all_items << @subscriber_count
    @all_items
  end

  def self.all_channels
    @@all_channels
  end

  def self.all_channels_and_items 
    @@all_channels_and_items 
  end
  
end
