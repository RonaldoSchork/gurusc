class Admin::PostCategoriesController < Admin::AdminController

  def index
    @categories = PostCategory.all
    respond_with @categories
  end

  def show
    @category = PostCategory.find(params[:id])
    respond_with @category
  end

  def new
    @category = PostCategory.new
    respond_with @category
  end

  def edit
    @category = PostCategory.find(params[:id])
  end

  def create
    @category = PostCategory.new(params[:post_category])
    flash[:notice] = 'Categoria criada com sucesso' if @category.save
    respond_with @post, :location => admin_post_categories_path
  end

  def update
    @category = PostCategory.find(params[:id])
    flash[:notice] = 'Categoria atualizada com sucesso.' if @category.update_attributes(params[:post_category])
    respond_with @category, :location => admin_post_categories_path
  end

  def destroy
    @category = PostCategory.find(params[:id])
    @category.destroy
    respond_with @category, :location => admin_post_categories_path
  end
end
