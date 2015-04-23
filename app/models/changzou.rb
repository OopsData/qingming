class Changzou
  MAX_COUNT = 100
  MIN_HOUR = 9
  
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :mobile, type: String
  field :finger,type:String

  scope :today, ->{ where(:created_at.gt => Time.now.beginning_of_day) }

  validates :mobile, 
    :format => { :with => /1[3|4|5|8][0-9]\d{4,8}/, :message =>'请输入正确的手机号码.', :multiline => false},
    :presence => { :message => '手机号不能为空.'}
  validates :name, 
    :presence => { :message => '手机号不能为空.'}, 
    :length => { :in => 2..20, :message => '名字不能太长!'}

  
end
