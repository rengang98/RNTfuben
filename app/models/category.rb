class Category < ApplicationRecord
  before_validation :nilancestry
  has_ancestry orphan_strategy: :destroy #when we delete top-level category,his children will be deleted too.
  has_many :tplays, dependent:  :destroy #if this category deleted, the tplays belongs to whom will be delete alos
  validates :name, presence: {message:"Cannot be empty!"}

  private

def nilancestry
  self.ancestry=nil if self.ancestry.blank?

end

  def self.data
    self.roots.order("weight desc").inject([]) do |result, element|
      row = []
      row << element
      row << element.children.order("weight desc")
      result << row
    end
  end

end
