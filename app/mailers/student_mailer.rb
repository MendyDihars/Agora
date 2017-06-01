class StudentMailer < ApplicationMailer

  def notification(student, teacher)
    @student = student
    @teacher = teacher
    @greeting = "Hi"

    mail(to: @student.email, subject: "#{@teacher.first_name} can teach you #{@teacher.own_skills.first.name} !")
  end
end
