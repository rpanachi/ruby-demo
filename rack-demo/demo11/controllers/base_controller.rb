class ApplicationController
  def initialize(app)
    @app = app
  end

  def render_html(file)
    content = File.read("./templates/#{file}.html.erb")
    [ERB.new(content).result(binding)]
  end

  def redirect(request, response, route)
    host = request.env["HTTP_ORIGIN"]

    response.status = 302
    response.headers["Location"] = host + route
    response.body = []
  end
end
