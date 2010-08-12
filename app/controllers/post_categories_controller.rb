class PostCategoriesController < ApplicationController

  def index
    @post_categories = PostCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_categories }
    end
  end

  def show
    @post_category = PostCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_category }
    end
  end

  def new
    @post_category = PostCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_category }
    end
  end

  def edit
    @post_category = PostCategory.find(params[:id])
  end

  def create
    @post_category = PostCategory.new(params[:post_category])

    respond_to do |format|
      if @post_category.save
        format.html { redirect_to(@post_category, :notice => 'Post category was successfully created.') }
        format.xml  { render :xml => @post_category, :status => :created, :location => @post_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @post_category = PostCategory.find(params[:id])

    respond_to do |format|
      if @post_category.update_attributes(params[:post_category])
        format.html { redirect_to(@post_category, :notice => 'Post category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post_category = PostCategory.find(params[:id])
    @post_category.destroy

    respond_to do |format|
      format.html { redirect_to(post_categories_url) }
      format.xml  { head :ok }
    end
  end
end
