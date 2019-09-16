require "./controllers/base_controller"
require "./controllers/home_controller"
require "./controllers/people_controller"
require "./router"

class MyWebApp
  def self.call(env)
    request  = Rack::Request.new(env)
    response = Rack::Response.new

    self.dispatch(request, response)

    response.finish
  end

  def self.dispatch(request, response)
    verb   = request.request_method
    path   = request.path

    route  = Router.instance.routes.dig(verb, path)
    if route.nil?
      raise StandardError, "Route not found"
    end

    controller, action = route.values_at(:controller, :action)
    controller_class = eval(controller[0].upcase + controller[1..-1] + "Controller")

    instance = controller_class.new(self)
    instance.send(action, request, response)

  rescue StandardError => ex
    response.status = 404
    response.body = ["Not found"]
  end
end
