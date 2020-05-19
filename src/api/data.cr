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
  def self.search(q = "", category = "")
    query = DATA.select do |item|
      categoryQuery = category == "" ? true : category == item.category

      categoryQuery &&
        item.name
          .lstrip
          .downcase
          .includes? q.lstrip.downcase
    end

    query
  end
end
