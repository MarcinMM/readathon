class Rmgr::StudentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :denied unless current_user.admin?
  end

  def index
    @students = Array.new
    @grade = '0'

    if ['0', '1', '2', '3', '4', '5'].include? params[:grade]
      @grade = params[:grade]
    end

    @students = Student.joins(:teacher).where("teachers.grade=?", @grade)
  end

  def new
    @student = Student.new
    @student.build_teacher
    @teachers = Teacher.order(:grade).all.map { |t| ["#{t.first} #{t.last}", t.id] }
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    @teachers = Teacher.order(:grade).all.map { |t| ["#{t.first} #{t.last}", t.id] }
  end

  def create
    @student = Student.new(student_params(params))

    if @student.save
      teacher = Teacher.find(@student.teacher_id)
      redirect_to rmgr_students_path(grade: teacher.grade), notice: {title: 'Success', msg: 'Added student successfully.'}
    else
      render :new
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(student_params(params))
      teacher = Teacher.find(@student.teacher_id)
      redirect_to rmgr_students_path(grade: teacher.grade), notice: {title: 'Success', msg: 'Student was successfully updated.'}
    else
      render :edit
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to rmgr_students_path
  end

  private

  def student_params params
    params.require(:student).permit(:first, :last, :email, :teacher_id)
  end

end