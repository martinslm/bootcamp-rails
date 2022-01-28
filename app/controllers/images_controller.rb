class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]

  # GET /images or /images.json
  def index
    @images = current_user.images
  end

  # GET /images/1 or /images/1.json
  def show;  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit;end

  # POST /images or /images.json
  def create
    @image = Image.new(image_params)
      if @image.save
        ImageProcessWorker.perform_async(@image.id)
        redirect_to @image, notice: "Imagem Criada"
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
      if @image.update(image_params)
        ImageProcessWorker.perform_async(@image.id)
        redirect_to @image, notice: "Imagem atualizada." 
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy

      redirect_to images_url, notice: "Imagem deletada."
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:title, :file, :user_id)
    end
end
