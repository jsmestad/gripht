require File.dirname(__FILE__) + '/spec_helper'

describe "Gripht" do
  
  it "fetch_stories should return valid hash" do
    result = fetch_stories('1234')
    
  end

  it "should do nothing" do
    get '/'
    last_response.should have_selector("h2:contains('Hello There, buddy!')")
  end
end
