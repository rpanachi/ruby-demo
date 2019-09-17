require "rack"
require "rack/contrib"

require "./app"

use Rack::Static,
  root: "public",
  urls: %w(/favicon.ico /stylesheets)

# use Rack::Printout
# use SampleMiddleware

run MyWebApp
