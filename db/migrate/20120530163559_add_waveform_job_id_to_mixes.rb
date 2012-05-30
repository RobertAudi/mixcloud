class AddWaveformJobIdToMixes < ActiveRecord::Migration
  def change
    add_column :mixes, :waveform_job_id, :string
  end
end
