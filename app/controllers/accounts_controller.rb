class AccountsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @student = Student.new
    @student.teacher = Teacher.new(id: -1)
    @teachers = Teacher.order(:grade).all.map { |t| ["#{t.name} (#{t.grade})", t.id] }
  end

  def add_student
    @student = Student.new(student_params(params))
    @student.user = current_user

    if @student.teacher.nil?
      @student.teacher = Teacher.new
    end

    @teachers = Teacher.order(:grade).all.map { |t| ["#{t.name} (#{t.grade})", t.id] }

    if @student.save
      redirect_to account_path, notice: {title: 'Success', msg: 'Added student successfully.'}
    else
      render :index
    end
  end

  private

  def student_params params
    params.require(:student).permit(:first, :last, :teacher_id)
  end

end
