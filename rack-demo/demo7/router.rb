class Router
  def self.instance
    @@router ||= self.new
  end

  attr_reader :routes

  def initialize
    get  "/",       to: "home"
    get  "/people", to: "people#index"
    post "/people", to: "people#create"
  end

  private

  def get(path, **options)
    add("GET", path, options)
  end

  def post(path, **options)
    add("POST", path, options)
  end

  def add(method, path, to: nil)
    controller, action = to.split("#")
    action ||= "index"

    @routes ||= {}
    @routes[method] ||= {}
    @routes[method][path] ||= {controller: controller, action: action}
    @routes
  end
end
