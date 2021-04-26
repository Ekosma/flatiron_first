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
CLIENT_SECRETS_PATH = 'client_secret.json'

# REPLACE FINAL ARGUMENT WITH FILE WHERE CREDENTIALS WILL BE STORED
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                   "youtube-quickstart-ruby-credentials.yaml")

# SCOPE FOR WHICH THIS SCRIPT REQUESTS AUTHORIZATION
SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_READONLY

class Channel

  attr_accessor :name, :id, :view_count, :date_created, :description

  def initialize(channel_name)
    @channel_name = channel_name
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize
    channels_info_by_username(service, 'snippet,contentDetails,statistics', for_username: @channel_name)
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

  def refresh_oauth
    strategy = OmniAuth::Strategies::GoogleOauth2.new(
      nil,
      '274331698386-li42fakf16vq6q6ctjl4hgh2k73a7jch.apps.googleusercontent.com',
      'PncVRAA3KxTm8LSCqOFYPEIF',
    )
    client = strategy.client
    token = OAuth2::AccessToken.new(
      client,
      "ya29.a0AfH6SMCMFU3NJCY1vU9ungJAZtlhfENu7MbaDXmmJ3QxCO_-YSmOntezE6_HX0KRtDYVQpLIZSiOACP-jpT9dWNBD6Lsidbheb0kyWop0lppUqCvhyyTsPbDSYOxUI1arOZ6dd0UccAhk2FsmI4WIL7zDuKF",
      refresh_token: "1//04TQMsv-C8IwQCgYIARAAGAQSNwF-L9IrNiTYlfqOWRwTUeiWeA3F29Ujp7n-Y3u_7H6EtiVjdXZOI3IGirMigBz6DGyg4fbIqE0",
    )
    token.refresh!
  end

  def channels_info_by_username(service, part, **params)
    response = service.list_channels(part, params).to_json
    item = JSON.parse(response).fetch("items")[0]
    @name = item.fetch("snippet").fetch("title")
    @id = item.fetch("id")
    @view_count = item.fetch("statistics").fetch("viewCount")
    @date_created = item.fetch("snippet").fetch("publishedAt")
    @description = item.fetch("snippet").fetch("description")
    print(item)
  end

end

#foo = service.list_playlists('contentDetails,player,snippet', {id: 'orszXGFn_9s'}).to_json
#bar = JSON.parse(foo).fetch("items")[0]

  # puts ("This channel's ID is #{item.fetch("id")}. " +
    #       "Its title is '#{item.fetch("snippet").fetch("title")}', and it has " +
    #       "#{item.fetch("statistics").fetch("viewCount")} views.")

  #    "refresh_token": 
 