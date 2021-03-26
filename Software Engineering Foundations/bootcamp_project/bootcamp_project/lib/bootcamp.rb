class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash,key| hash[key] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher 
    end
    
    #accept string as arg
    def enroll(student)
        if @students.count < @student_capacity
            students << student
            return true
        end
        return false
    end

    def enrolled?(student)
        @students.any? {|std| std.casecmp?(student)}
    end

    def student_to_teacher_ratio
        (@students.count / @teachers.count).floor()
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        end
        false
    end

    def num_grades(student)
        @grades[student].count
    end

    def average_grade(student)
        if enrolled?(student) && num_grades(student) > 0
            return (@grades[student].sum()/@grades[student].count).floor()
        end
        return nil
    end
end
