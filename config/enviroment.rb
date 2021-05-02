require_relative '../lib/project/channel.rb'
require_relative '../lib/project/cli.rb'

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
