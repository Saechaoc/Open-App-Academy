require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = {}
        @employees = []
        salaries.each do |title, salary|
            @salaries[title] = salary
        end
    end

    def valid_title?(title)
        @salaries.key?(title)
    end

    def >(startup2)
        self.funding > startup2.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees.push(Employee.new(employee_name,title))
        else
            raise StandardError.new "Invalid title"
        end
    end

    def size
        @employees.count
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise StandardError.new "Insufficient Funds"
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        ct = 0
        @employees.each do |employee|
            salary = @salaries[employee.title]
            sum += salary
            ct += 1.0
        end
        sum/ct
    end

    def close
        @employees.clear
        @funding = 0    
    end

    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |title, salary|
            #check if the job exists at the current startup
            #add new jobs to the existing startup if they don't exist
            if !@salaries.key?(title)
                @salaries[title] = salary
            end
        end

        @employees.concat startup.employees
        startup.close
    end
end
