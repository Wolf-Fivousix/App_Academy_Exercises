require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(new_startup)
        self.funding > new_startup.funding
    end

    def hire(employee_name, title)
        valid_title?(title) ? (@employees << Employee.new(employee_name, title)) : raise
        # if valid_title?(title)
        #     @employees << Employee.new(employee_name, title)
        # else
        #     raise
        # end
    end

    def size
        @employees.length
    end

    def pay_employee(staff)
        pay = @salaries[staff.title]
        raise if @funding < pay
        staff.pay(pay)
        @funding -= pay
    end

    def payday
        @employees.each do |staff|
            pay_employee(staff)
        end
    end
    
    def average_salary
    @employees.map { |staff| @salaries[staff.title] }.sum / @employees.length * 1.0
        # sum = 0
        # @employees.each do |staff|
        #     sum += @salaries[staff.title]
        # end
        # sum / @employees.length * 1.0
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(closing_startup)
        @funding += closing_startup.funding
        @employees += closing_startup.employees
        @salaries = closing_startup.salaries.merge(@salaries)
        closing_startup.close
    end
end
