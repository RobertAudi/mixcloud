class Mix < ActiveRecord::Base
  attr_accessible :title, :sound_file

  mount_uploader :sound_file, MixUploader

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { within: 3..255 }
end
