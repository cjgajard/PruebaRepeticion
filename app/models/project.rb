class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  before_save :verify_name

  def verify_name
    if self.name.empty?
      self.name = "Proyecto #{self.id}"
    end
  end
end
