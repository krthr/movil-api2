require "kemal"
require "markd"
require "./middlewares.cr"
require "./data.cr"

markd_renderer = Markd::Options.new(smart: true, safe: true)

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

get "/docs" do |ctx|
  ctx.response.content_type = "text/html"
  docs = File.open("./src/docs.md") { |file| file.gets_to_end }
  Markd.to_html(docs, markd_renderer)
end
