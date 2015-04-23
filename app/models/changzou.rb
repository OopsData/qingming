class Changzou
  MAX_COUNT = 100
  MIN_HOUR = 9
  
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :mobile, type: String
  field :finger,type:String
  scope :today, ->{ where(:created_at.gt => Time.now.beginning_of_day) }

  
end
