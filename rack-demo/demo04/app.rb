class MyWebApp
  def self.call(env)

    response = Rack::Response.new
    response.status  = 200
    response.headers["Content-Type"] = "text/html"

    @current_time = Time.now
    response.body = [
      "<h1>Rack Demo</h1>",
      "<p>Now is #{@current_time}</p>"
    ]

    response.finish
  end
end
