class MixesController < ApplicationController
  def index
  end

  def new
    @mix = Mix.new
  end

  def create
    @mix = Mix.new(params[:mix])
    if @mix.save
      meta = WaveformGenerator.enqueue(@mix.id)

      @mix.update_attributes({waveform_job_id: meta.meta_id})

      flash[:success] = "Mix successfully uploaded"
      redirect_to mix_url(@mix)
    else
      render :new
    end
  end

  def show
    @mix = Mix.find(params[:id])

    @meta = WaveformGenerator.get_meta(@mix.waveform_job_id)
    @waveform = "/assets/#{@mix.id}-#{File.basename(@mix.sound_file.to_s, File.extname(@mix.sound_file.to_s))}.png"
  end
end
