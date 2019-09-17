require "rack"
require "./app"

use Rack::Static,
  root: "public",
  urls: %w(/favicon.ico /stylesheets)

run MyWebApp
