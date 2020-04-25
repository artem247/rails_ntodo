class TodoItem < ApplicationRecord
  belongs_to :todo_list

  def self.completed?
    !completed_at.blank?
  end

  def self.toggle_completion
    if completed?
     update_attribute(:completed_at, nil)
    else
     update_attribute(:completed_at, Time.now)
    end
  end

end
