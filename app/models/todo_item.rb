class TodoItem < ApplicationRecord
  belongs_to :todo_list
  validates :todo_list_id, presence: true
  acts_as_list column: :position, scope: :todo_list

  def completed?
    !completed_at.blank?
  end

  def toggle_completion
    if completed?
     update_attribute(:completed_at, nil)
    else
     update_attribute(:completed_at, Time.now)
    end
  end

end
