class List < ActiveRecord::Base
  has_many :todos
  attr_accessible :body, :title, :user_id
end
