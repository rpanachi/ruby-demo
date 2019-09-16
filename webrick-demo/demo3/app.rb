class MyWebApp < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response['Content-Type'] = 'text/plain'
    response.body = 'Hello World!'
  end
end
