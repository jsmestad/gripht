module Gripht
  class App < Sinatra::Default
    get '/' do
      haml "%h2= 'Hello There, buddy!'"
    end
  end
end
