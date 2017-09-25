class SchoolClassesController < ApplicationController

    def index
      @sc = SchoolClass.all
      #index view
    end

    def show
      find_sc
      #show view
    end

    def new
      #new form view
    end

    def create
      sc = SchoolClass.create(sc_params)
      redirect_to school_class_path(sc)
    end

    def edit
      find_sc
      #edit form view
    end

    def update
      find_sc
      @sc.update(sc_params)
      redirect_to school_class_path(@sc)
    end

    private
    def sc_params
      params.require(:school_class).permit(:title, :room_number)
    end

    def find_sc
      @sc = SchoolClass.find_by(id: params[:id])
    end
end
