class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
        @pages = Page.all
    end

    def show
        # render plain: @page.body
    end

    def new
        @page = Page.new
    end

    def create
       @page = Page.new(page_params)
       @page.save
       redirect_to @page
    end

    def edit 
        @page = Page.find(params[:id])
    end

    def update
       @page = Page.find(params[:id])  
       @page.update(page_params)
       redirect_to @page
    end

    def destroy
        @page = Page.find(params[:id])
        @page.destroy
        redirect_to pages_path
    end

    private
    #only used in pages_controller class
        def page_params
            params.require(:page).permit(:title, :body, :slug)
        end

        def set_page
            @page = Page.find(params[:id])
        end
end
