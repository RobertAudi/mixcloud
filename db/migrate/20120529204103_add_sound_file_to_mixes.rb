class AddSoundFileToMixes < ActiveRecord::Migration
  def change
    add_column :mixes, :sound_file, :string
  end
end
