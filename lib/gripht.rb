require 'rubygems'
require 'sinatra/base'
require 'haml/util'
require 'haml/engine'
require 'rest-client'
require 'logger'

module Gripht
  module Log
    def self.logger
      if @logger.nil?
        @logger        = Logger.new("lifeline.log")
        @logger.level  = Logger::INFO 
      end
      @logger
    end
  end
end

require File.dirname(__FILE__) + '/gripht/app'
