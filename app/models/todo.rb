class Todo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :completed, :title

  def days_left
    7 - ((Time.now - self.created_at).to_i / 1.day) 
  end
end
