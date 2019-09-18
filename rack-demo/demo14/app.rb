require "./env"
require "./database"

require "./controllers/base_controller"
require "./controllers/home_controller"
require "./controllers/people_controller"

require "./models/person"

class MyWebApp
  def self.call(env)
    request  = Rack::Request.new(env)
    response = Rack::Response.new

    if request.request_method == "GET" && request.path == "/people"
      controller = PeopleController.new
      controller.index(request, response)

    elsif request.request_method == "POST" && request.path == "/people"
      controller = PeopleController.new
      controller.create(request, response)

    elsif request.request_method == "GET" && request.path == "/"
      controller = HomeController.new
      controller.index(request, response)

    else
      response.status = 404
      response.body = ["Not found"]
    end

    response.finish
  end
end
