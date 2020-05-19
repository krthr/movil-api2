require "kemal"
require "./middlewares.cr"
require "./data.cr"

get "/" do
  {
    hi: Time.utc.to_unix_ms,
  }.to_json
end

get "/search" do |ctx|
  q = ctx.params.query.fetch("q", "")
  category = ctx.params.query.fetch("category", "")

  result = Data.search q, category

  result.to_json
end
