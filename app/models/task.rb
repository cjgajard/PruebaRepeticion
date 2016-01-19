class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  enum status: [:todo, :doing, :done]

  scope :sort_by_date, -> { order('created_at DESC') }
end
