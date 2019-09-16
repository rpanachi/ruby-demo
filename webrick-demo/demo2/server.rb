require "webrick"

server = WEBrick::HTTPServer.new(:Port => 8080)

server.mount_proc "/" do |request, response|
  response.status = 200
  response.body = 'Hello World!'
end

server.start
