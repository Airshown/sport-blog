class Article < ActiveRecord::Base
  belongs_to :categorie
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :photo, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_with AttachmentSizeValidator,
     attributes: :photo,
     less_than: 1.megabytes
  do_not_validate_attachment_file_type :photo
end
