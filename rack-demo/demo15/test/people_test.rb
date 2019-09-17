ENV["RACK_ENV"] = "test"

require "test/unit"
require "rack/test"
require "./app"

class PeopleTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file("./config.ru").first
  end

  def test_people_ok_response
    get '/people'

    assert last_response.ok?
  end

  def test_people_list_all
    Person.dataset.delete
    Person.create(name: "Random Person", age: 80)

    get '/people'

    assert last_response.body.match(/Random Person/)
  end

  def test_create_person
    Person.dataset.delete

    post '/people', {name: "New Person", age: 32}, {}

    person = Person.last
    assert person.name == "New Person"
  end
end
