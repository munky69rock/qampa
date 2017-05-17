# frozen_string_literal: true

module Admin
  class InformationController < BaseController
    def index
      @information = Information.all
    end

    def show
      @information = Information.find(params[:id])
    end

    def new
      @information = Information.new
    end

    def create
      @information = Information.new(information_param)
      if @information.save
        redirect_to admin_information_path(@information)
      else
        render :new
      end
    end

    def edit
      @information = Information.find(params[:id])
    end

    def update
      @information = Information.new(information_param)
      if @information.save
        redirect_to admin_information_path(@information)
      else
        render :edit
      end
    end

    def destroy; end

    private

    def information_param
      params.require(:information).permit(:title, :syntax, :body, :published_at).tap do |params|
        params[:syntax] = params[:syntax].to_i if params[:syntax].present?
      end
    end
  end
end
