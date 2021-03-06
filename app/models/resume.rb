class Resume < ActiveRecord::Base
  require 'docx'
  require 'msworddoc-extractor'
  mount_uploader :attachment, AvatarUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
end
