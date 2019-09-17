class ApplicationController
  def initialize(app)
    @app = app
  end
  def render_html(file)
    content = File.read("./templates/#{file}.html.erb")
    [ERB.new(content).result(binding)]
  end
end
