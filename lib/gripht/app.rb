module Gripht
  class App < Sinatra::Default
    set :views, File.dirname(__FILE__) + '/views'

    helpers do
      def resource
        RestClient::Resource.new 'http://www.pivotaltracker.com/services/v2/projects', :headers => { 'X-TrackerToken' => ENV['TRACKER_TOKEN']}
      end
      
      def fetch_stories(project_id)
        stories = Nokogiri::XML(resource["#{project_id}/stories?limit=10&filter=state%3Astarted"].get).xpath('//story')
        { :stories => stories.collect do |story|
            {
              :name => story.at('name').content,
              :owner => story.at('owned_by').content,
              :created_at => story.at('created_at').content,
              :description => story.at('description').nil? ? "" : story.at('description').content,
              :url => story.at('url').content,
              :type => story.at('story_type').content
            }
          end
        }
      end
    end

    errors do
      Gripht::Log.logger.info env['sinatra.error'].message
      haml :failed
    end

    get '/update_project/:id' do
      @stories = fetch_stories(params[:id])
      haml :stories, :layout => false
    end
    
    get '/application.js' do
      @application_js ||= File.read(File.dirname(__FILE__) + '/views/application.js')
    end
    
    get '/' do 
      @projects = Nokogiri::XML(resource.get).xpath('//project').collect { |r| { :id => r.at('id').content, :name => r.at('name').content } }
      @projects.each { |project| project.merge!(fetch_stories(project[:id])) }
      haml :index
    end
    
  end
end
