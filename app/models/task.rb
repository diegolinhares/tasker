class Task < ApplicationRecord
  belongs_to :list

  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  
  acts_as_list scope: [:list_id, completed_at: nil], top_of_list: 0

  scope :incomplete_first, -> { order(completed_at: :desc) }

  validates :name, presence: true

  def complete?
    completed_at.present?
  end
end
