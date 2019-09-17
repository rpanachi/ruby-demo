require "./models/person"

class PeopleController < ApplicationController
  def index(request, response)
    @people = Person.all

    response.status = 200
    response.headers["Content-Type"] = "text/html"
    response.body = render_html("people/index")
  end

  def create(request, response)
    name = request.params["name"]
    age  = request.params["age"]

    Person.create(name: name, age: age)

    redirect(request, response, "/people")
  end
end
