class SampleMiddleware
  def initialize(app, options)
    @app = app
    @options = options # could be an array of restricted URLs
  end
  def call(env)
    # verify session
    # redirect user to login
  end
end

