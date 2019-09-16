require "webrick"
require "./app"

server = WEBrick::HTTPServer.new(:Port => 8080)

server.mount "/", MyWebApp
server.start
