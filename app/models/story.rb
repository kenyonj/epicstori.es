class Story < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user

  def self.active
    where(active: true)
  end

  def self.inactive
    where(active: false)
  end
end
