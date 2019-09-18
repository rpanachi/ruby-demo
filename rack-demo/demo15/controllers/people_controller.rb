require "./models/person"

class PeopleController < BaseController
  def index(request, response)
    @people = Person.all

    response.status = 200
    response.headers["Content-Type"] = "text/html"
    response.body = render_html("people/index")
  end

  def create(request, response)
    name = request.params["name"]
    age  = request.params["age"]

    @person = Person.new(name: name, age: age)
    if @person.valid?
      @person.save
      redirect(request, response, "/people")
    else
      @errors = @person.errors
      index(request, response)
    end
  end
end
