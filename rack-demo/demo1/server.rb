require "rack"

app = Proc.new do |env|
  [200, {"Content-Type" => "text/plain"}, ["Hello World!"]]
end

Rack::Server.start(app: app)
