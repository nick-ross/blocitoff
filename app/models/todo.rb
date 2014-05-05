class Todo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :completed, :title

  def days_left
    # 7 - ((Time.now - self.created_at).to_i / 1.day)
    (7 - (Date.today - self.created_at.to_date)).to_i
  end
end