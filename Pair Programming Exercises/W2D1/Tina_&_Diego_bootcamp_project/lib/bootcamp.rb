class Bootcamp
    attr_reader :name, :slogan, :teachers, :students

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash, key| hash[key] = [] }
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        # Ternary Operator     ? : 
        #condition ? TRUE Do This : FALSE Do This
        # return false if @students.length >= @student_capacity
        # @students << student
        @students.length >= @student_capacity ? (return false) : @students << student
        true
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.count / @teachers.count
    end

    def add_grade(student, grade)
        return false if !@students.include?(student)
        @grades[student] << grade
        true
    end

    def num_grades(student)
        @grades[student].count
    end

    def average_grade(student)
        return nil if @grades[student].empty? # || !@students.include?(student)
        @grades[student].sum / num_grades(student)
    end
end
