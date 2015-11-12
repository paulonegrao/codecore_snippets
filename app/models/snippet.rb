class Snippet < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true, uniqueness: true
  validates :code, presence: true
end
