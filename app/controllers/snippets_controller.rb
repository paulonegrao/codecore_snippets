class SnippetsController < ApplicationController
  def show
    @snippet = Snippet.find_by_category_id(params[:category_id])
  end

  def new
    @category = Category.all
    @snippet = Snippet.new
  end

  def create
    # render text: params
    snippet_params = params.require(:snippet).permit(:title, :code)
    @category = Category.find(params[:selected_category])
    @snippet = Snippet.new(snippet_params)
    @snippet.category = @category
    if @snippet.save
      redirect_to categories_path, notice: "Snippet created successfully"
    else
      @categories = Category.all
      render "snippets/new"
    end
  end

  def edit
    @category = Category.all
    @snippet = Snippet.find(params[:id])
  end

  def update
    snippet_params = params.require(:snippet).permit(:title, :code)
    @category = Category.find(params[:selected_category])
    @snippet = Snippet.find(params[:id])
    @snippet.category = @category
    if @snippet.update(snippet_params)
      redirect_to categories_path, notice: "Snippet updated"
    else
      render :edit
    end
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    redirect_to "#{categories_path}#snippets-for-#{@snippet.category.name.downcase}", aria: {expanded: true}
  end
end
