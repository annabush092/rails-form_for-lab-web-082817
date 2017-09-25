class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    find_student
  end

  def new
    #new form view
  end

  def create
    student = Student.create(student_params)
    redirect_to student_path(student)
  end

  def edit
    find_student
    #edit form view
  end

  def update
    find_student
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end

  def find_student
    @student = Student.find_by(id: params[:id])
  end

end
