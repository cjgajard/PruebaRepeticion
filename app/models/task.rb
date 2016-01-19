class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  enum status: [:todo, :done, :doing]
end
