module Gripht
  class App < Sinatra::Default
    set :views, File.dirname(__FILE__) + '/views'

    helpers do
      # something goes here...
    end

    errors do
      Gripht::Log.logger.info env['sinatra.error'].message
      haml :failed
    end
    
    get '/application.js' do
      @application_js ||= File.read(File.dirname(__FILE__) + '/views/application.js')
    end
    
    get '/' do
      ENV['TRACKER_TOKEN']
      haml :index
    end
    
  end
end
