module ApplicationHelper
  def price(float)
    "$#{sprintf '%.2f', float}"
  end
end
