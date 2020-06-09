require "json"

module Data
  class Item
    JSON.mapping(
      name: String,
      price: Float64,
      category: String
    )
  end

  DATA = File.open("./src/data.json") do |json|
    Array(Item).from_json json
  end

  # Search in the `DATA` array using `q`
  def self.search(q = "", categories = [] of String)
    categories_query = categories.size > 0

    query = DATA.select do |item|
      valid_category = categories_query ? categories.includes?(item.category) : true

      valid_category &&
        item.name
          .lstrip
          .downcase
          .includes? q.strip.downcase
    end

    query
  end
end
