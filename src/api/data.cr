require "json"

module Data
  enum Category
    VERDURA = 1
    CARNE   = 2

    def to_json(builder)
      builder.string self
    end
  end

  class Item
    JSON.mapping(
      name: String,
      price: Float64,
      category: Category
    )

    def to_s(io)
      io << "<Item #{name} $#{price}>"
    end
  end

  DATA = File.open("./src/data.json") { |json|
    Array(Item).from_json json
  }

  # Search in the `DATA` array using `q`
  def self.search(q = "", category = "")
    query = DATA.select { |item|
      item.name
        .lstrip
        .downcase
        .includes? q.lstrip.downcase
    }

    return query.select { |item| category == item.category.to_s } if category != ""

    query
  end
end
