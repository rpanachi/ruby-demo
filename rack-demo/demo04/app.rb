class MyWebApp
  def self.call(env)
    request  = Rack::Request.new(env)

    @current_time = Time.now
    rendered = render_html("home")

    response = Rack::Response.new
    response.status  = 200
    response.headers["Content-Type"] = "text/html"
    response.body = rendered
    response.finish
  end

  def self.render_html(file)
    content = File.read("./templates/#{file}.html.erb")
    [ERB.new(content).result(binding)]
  end
end
