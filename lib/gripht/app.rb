module Gripht
  class App < Sinatra::Default
    set :views, File.dirname(__FILE__) + '/views'

    helpers do
      def resource
        RestClient::Resource.new 'http://www.pivotaltracker.com/services/v2/projects', :headers => { 'X-TrackerToken' => ENV['TRACKER_TOKEN']}
      end
      
      def fetch_stories(project_id, limit=10, options={})
        options = {:state => 'started'} if options.empty?
        params = "limit=#{limit}&filter="
        options.each { |key, value| params << "#{key.to_s}%3A%22#{CGI::escape(value)}%22%20" }
        stories = Nokogiri::XML(resource["#{project_id}/stories?#{params}"].get).xpath('//story')
        #Gripht::Log.logger.error CGI::escape(params)
        { options[:state].to_sym => stories.collect do |story|
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
      @projects.each { |project| project.merge!(fetch_stories(project[:id], 10, {:state => 'finished'})) }
      haml :index
    end
    
  end
end
