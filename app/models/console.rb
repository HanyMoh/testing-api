class Console < ActiveRecord::Base
  validates :name, presence: true
  validates :manufacture, presence: true

  scope :nintendo, -> { where(manufacture: 'Nintendo')}

  def formatted_name
    "#{manufacture} #{name}"
  end
end
