class PagesController < ApplicationController
    def index
        @pages = Page.all
    end

    def show
        @page = Page.find(params[:id])
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
    end

    private
    #only used in pages_controller class
        def page_params
            params.require(:page).permit(:title, :body, :slug)
        end
end
