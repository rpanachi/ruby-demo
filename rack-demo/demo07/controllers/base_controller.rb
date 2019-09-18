class BaseController
  def render_html(file)
    content = File.read("./templates/#{file}.html.erb")
    [ERB.new(content).result(binding)]
  end
end
