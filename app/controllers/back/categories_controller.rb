class Back::CategoriesController < Back::BaseController
  def index
    if params[:id].blank? #top-level category case 没有代码说明直接点进来的，所以肯定时根分类
    @categories = Category.roots.page(params[:page]||1).per_page(params[:per_page] || 5).order(id: "desc")
    else #2nd-level category case
     @category=Category.find(params[:id])
     @categories = @category.children.page(params[:page]||1).per_page(params[:per_page] || 5).order(id: "desc")
    #change into children page
    end

  def new
    @category = Category.new
    @top_categories = Category.roots
  end

  def create
    @category = Category.new(params.require(:category).permit(:name,:tplays_ticket,:ancestry))
    @top_categories = Category.roots
   if @category.save
     flash[:notice] = "Save successful"
     redirect_to back_categories_path
   else
     flash[:notice] = "Save failed"
     redirect_to action: :new
   end
  end


  def edit
    @category=Category.find(params[:id])
    @top_categories = Category.roots
    render action: :new
  end

  def update
    @top_categories = Category.roots
    @category=Category.find(params[:id])
    @category.attributes = params.require(:category).permit(:name,:tplays_ticket,:ancestry)
    if @category.save
      flash[:notice] = "Edit successful"
      redirect_to back_categories_path
    else
      flash[:notice] = "Edit failed"
      redirect_to action: :new
  end
  end

  def destroy
    @category=Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "delete successful"
      redirect_to back_categories_path
    else
      flash[:notice] = "delete failed"
      redirect_to :back #make it redirect to previous level category page
    end
  end
  end
  end
