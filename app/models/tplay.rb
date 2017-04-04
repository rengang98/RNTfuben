class Tplay < ApplicationRecord
  belongs_to :category
  has_many :tplay_images, -> {order(zhuci:'desc')},dependent: :destroy #when tplays deleted, it's image delete aslo.
  # desc sort order
  has_one :main_image, -> {order(zhuci:'desc')},class_name: :TplayImage

  before_create :auto
  validates :category_id, presence: {message: "Category Cannot be empty"}
  validates :name, presence: {message: "Name Cannot be empty"}
  validates :status, presence: {message: "Status Cannot be empty"}
  validates :bprice, presence: {message: "Original price Cannot be empty"}
  validates :bprice, numericality: { message:"Original price Must be number"}
  validates :price, presence: {message: "Price of Tickets Cannot be empty"}
  validates :price, numericality: { message:"Price Must be number"}
  validates :ticket, presence: {message: "Rest of Tickets Cannot be empty"}
  validates :ticket, numericality: {only_integer: true , message:"Rest Tickets Must be integer"}

  scope :appear, -> { where(status: "on") }


  private
  def auto
    self.tplay_id = RandomCode.generate_tplay_id
end
end
