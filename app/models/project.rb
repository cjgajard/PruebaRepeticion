class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  after_save :verify_name

  def verify_name
    if self.name.blank?
      self.name = "Proyecto #{self.id}"
    end
  end

  def pendings_count
    self.tasks.where('status <> 2').size
  end
end
