class Todo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :completed, :title

  def days_left
    distance_of_time_in_words(@user.created_at)
  end
end
