require "webrick"

server = WEBrick::HTTPServer.new(:Port => 8080)
server.start
