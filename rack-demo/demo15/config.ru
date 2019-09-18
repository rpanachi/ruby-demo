require "rack"
require "rack/contrib"

require "./app"
require "./lib/request_id_middleware"

use Rack::Static,
  root: "public",
  urls: %w(/favicon.ico /stylesheets)

use RequestIdMiddleware, format: :hex

run MyWebApp
