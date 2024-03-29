# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :enrollments,
           foreign_key: :student_id,
           primary_key: :id,
           class_name: :Enrollment

  has_many :enrolled_courses, through: :enrollments, source: :course

  has_many :taught_courses,
           foreign_key: :instructor_id,
           primary_key: :id,
           class_name: :Course

  has_many :taught_students, through: :taught_courses, source: :enrolled_students

  has_many :prerequisites, through: :enrolled_courses, source: :prerequisite

end
