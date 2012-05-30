require 'waveform'

class WaveformGenerator
  @queue = :waveform_queue

  def self.perform(mix_id)
    mix = Mix.find(mix_id)

    options = {
      method: :rms,
      width: 1800,
      height: 280,
      background_color: "#ffffff",
      color: "#3333ff",
      force: true,
      quiet: true
    }

    waveform = "./public/waveforms/#{File.basename(mix.sound_file.to_s, File.extname(mix.sound_file.to_s))}.png"
    ::Waveform.new("./public" + mix.sound_file.to_s, nil).generate(waveform, options)
  end
end
