require "securerandom"

class RequestIdMiddleware
  def initialize(app, **options)
    @app    = app
    @format = options.fetch(:format, :uuid)
  end
  def call(env)
    env["request_id"] = SecureRandom.send(@format)

    @app.call(env)
  end
end

