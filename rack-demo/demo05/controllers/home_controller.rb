class HomeController

  def index(request, response)
    @current_time = Time.now

    response.status  = 200
    response.headers["Content-Type"] = "text/html"
    response.body = render_html("home/index")
  end

  protected

  def render_html(file)
    content = File.read("./templates/#{file}.html.erb")
    [ERB.new(content).result(binding)]
  end
end
