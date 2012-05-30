class MixesController < ApplicationController
  def index
  end

  def new
    @mix = Mix.new
  end

  def create
    @mix = Mix.new(params[:mix])
    if @mix.save
      Resque.enqueue(WaveformGenerator, @mix.id)

      flash[:success] = "Mix successfully uploaded"
      redirect_to mix_url(@mix)
    else
      render :new
    end
  end

  def show
    @mix = Mix.find(params[:id])
    @waveform = "/waveforms/#{@mix.id}-#{File.basename(@mix.sound_file.to_s, File.extname(@mix.sound_file.to_s))}.png"
  end
end
