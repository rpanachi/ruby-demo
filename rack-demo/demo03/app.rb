class MyWebApp
  def self.call(env)
    response = Rack::Response.new
    response.status  = 200
    response.headers["Content-Type"] = "text/html"
    response.body = ["Hello World!"]
    response.finish
  end
end
