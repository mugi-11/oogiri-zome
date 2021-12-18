class Admin::ThemesController < ApplicationController

  def show
    @theme = Theme.find(params[:id])
    @answer = Answer.all
  end

  def index
    @themes = Theme.all

  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to admin_themes_path
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to admin_themes_path
  end

  private
  def theme_params
    params.require(:theme).permit(:theme)
  end

end
