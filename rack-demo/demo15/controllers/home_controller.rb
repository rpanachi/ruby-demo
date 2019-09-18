class HomeController < BaseController
  def index(request, response)
    @current_time = Time.now
    @request_id   = request.env["request_id"]

    response.status  = 200
    response.headers["Content-Type"] = "text/html"
    response.body = render_html("home/index")
  end
end
