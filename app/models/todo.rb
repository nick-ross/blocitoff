class Todo < ActiveRecord::Base
  belongs_to :list
  attr_accessible :completed, :title
end
