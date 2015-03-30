class App
  include Mongoid::Document
  field :view_count, type: Integer, :default => 0
end
