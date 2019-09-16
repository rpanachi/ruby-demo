require "./controllers/base_controller"
require "./controllers/home_controller"
require "./controllers/people_controller"

class MyWebApp
  def self.call(env)
    request  = Rack::Request.new(env)
    response = Rack::Response.new

    if request.get? && request.path == "/people"
      controller = PeopleController.new(self)
      controller.index(request, response)

    elsif request.post? && request.path == "/people"
      controller = PeopleController.new(self)
      controller.search(request, response)

    elsif request.get? && request.path == "/"
      controller = HomeController.new(self)
      controller.index(request, response)

    else
      response.status = 404
      response.body = ["Not found"]
    end

    response.finish
  end
end
