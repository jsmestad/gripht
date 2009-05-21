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
      resource = RestClient::Resource.new 'http://www.pivotaltracker.com/services/v2/projects', :headers => { 'X-TrackerToken' => ENV['TRACKER_TOKEN']}
      @projects = Nokogiri::XML.parse(resource.get).xpath('//project').collect { |r| { :id => r.at('id').content, :name => r.at('name').content } }
      
      haml :index
    end
    
  end
end
