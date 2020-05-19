require "kemal"

before_all do |env|
  env.response.content_type = "application/json"
end
