class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def next
    post.where("id > ?", id).order("id ASC").first
  end

  def prev
    post.where("id < ?", id).order("id DESC").first
  end
end
