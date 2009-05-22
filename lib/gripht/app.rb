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
      @projects = Nokogiri::XML(resource.get).xpath('//project').collect { |r| { :id => r.at('id').content, :name => r.at('name').content } }
      @projects.each do |project|
        project.merge!({ :stories => Nokogiri::XML(resource["#{project[:id]}/stories?limit=10&filter=state%3Astarted"].get).xpath('//story').collect do |story|
                           {
                             :name => story.at('name').content,
                             :owner => story.at('owned_by').content,
                             :created_at => story.at('created_at').content,
                             :description => story.at('description').nil? ? "" : story.at('description').content,
                             :url => story.at('url').content,
                             :type => story.at('story_type').content
                           }
                         end
                       })
      end
      
      haml :index
    end
    
  end
end
