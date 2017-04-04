class Back::TplayImagesController < Back::BaseController
  def index
    @tplay = Tplay.find(params[:tplay_id])
    @tplay_images= @tplay.tplay_images
  end

  def create
    @tplay = Tplay.find(params[:tplay_id])
    if params[:images].nil?
    flash[:notice] = "Empty! You havn't chose any image!"
    redirect_to :back
    else
    params[:images].each do |i|
    @tplay.tplay_images<< TplayImage.new(image: i)
    end
    flash[:notice] = "Upload successful"
    redirect_to :back
  end
  end

  def edit

  end

  def update
    @tplay = Tplay.find(params[:tplay_id])
    @tplay_images= @tplay.tplay_images.find(params[:id])
    @tplay_images.zhuci=params[:zhuci]
    if @tplay_images.save
      flash[:notice] = "Edit successful"
      redirect_to :back
    else
      flash[:notice] = "failed"
      redirect_to :back
    end
    end


  def destroy
    @tplay = Tplay.find(params[:tplay_id])
    @tplay_images= @tplay.tplay_images.find(params[:id])
    if @tplay_images.destroy
      flash[:notice] = "Delete successful"
      redirect_to :back
    else
      flash[:notice] = "Delete failed"
      redirect_to :back
    end

  end

end