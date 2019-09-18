require "./controllers/home_controller"

class MyWebApp
  def self.call(env)
    request  = Rack::Request.new(env)
    response = Rack::Response.new

    if request.get? && request.path == "/"
      controller = HomeController.new
      controller.index(request, response)
    else
      response.status = 404
      response.body = ["Not found"]
    end

    response.finish
  end
end
