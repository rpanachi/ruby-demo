require "./models/person"

class PeopleController < ApplicationController
  def index(request, response)
    @people = Person.all

    response.status = 200
    response.headers["Content-Type"] = "text/html"
    response.body = render_html("people/index")
  end

  def create(request, response)

  end
end
