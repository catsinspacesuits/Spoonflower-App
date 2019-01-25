class SpoonflowerApi
  include HTTParty
  base_uri "http://search.spoonflower.com/searchv2"

  attr_accessor :name, :limit, :offset

  # Find a particular design, based on its name
  def find(name)
    self.class.get("/designs", query: { q: name }).parsed_response
  end

  def random(offset, limit)
    self.class.get("/designs", query: { offset: offset, limit: limit }).parsed_response
  end
end