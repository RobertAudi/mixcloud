class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.string :title

      t.timestamps
    end
  end
end
