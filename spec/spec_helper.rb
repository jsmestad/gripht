$TESTING=true

$:.push File.join(File.dirname(__FILE__), '..', 'lib')
require 'rubygems'
require 'randexp'
require 'gripht'
#require 'dm-core'
require 'rack/test'
require 'webrat/sinatra'
#require 'dm-sweatshop'
require 'fakeweb'
require 'pp'

FakeWeb.allow_net_connect = false
FakeWeb.register_uri :any, "http://www.pivotaltracker.com/services/v2/", :string => <<-eof
                    <?xml version="1.0" encoding="UTF-8"?>
                        <stories type="array" count="0" total="0" filter="'label:'needs feedback' type:bug">
                          <story>
                            <id type="integer">4567889</id>
                            <story_type>bug</story_type>
                            <url>http://www.pivotaltracker.com/story/show/STORY_ID</url>
                            <estimate type="integer">-1</estimate>
                            <current_state>started</current_state>
                            <description>Now, Scotty!</description>
                            <name>More power to shields</name>
                            <requested_by>James Kirk</requested_by>
                            <owned_by>Montgomery Scott</owned_by>
                            <created_at>Oct 16, 2008</created_at>
                            <created_at type="datetime">2008/12/10 00:00:00 UTC</created_at>
                            <accepted_at type="datetime">2008/12/10 00:00:00 UTC</accepted_at>
                            <iteration>
                              <number>3</number>
                              <start type="datetime">2009/01/05 00:00:02 UTC</start>
                              <finish type="datetime">2009/01/19 00:00:02 UTC</finish>
                            </iteration>
                            <labels>label 1,label 2,label 3</labels>
                          </story>
                        </stories>
eof


class Net::HTTPResponse 
  def body=(content) 
    @body = content 
    @read = true 
  end 
end

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)
  config.include(Webrat::Methods)
  config.include(Webrat::Matchers)
  config.include(Gripht::Helpers)

  config.before(:each) do
    #DataMapper.auto_migrate!
    FakeWeb.clean_registry
  end

  def app
    @app = Rack::Builder.new do
      run Gripht::App
    end
  end
end
