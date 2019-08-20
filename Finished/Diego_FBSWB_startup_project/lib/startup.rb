require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = {}
        salaries.each {|title, pay| @salaries[title] = pay}
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title) ? true : false
    end

    def >(nova_startup)
        self.funding > nova_startup.funding ? true : false
    end

    def hire(employee_name, title)
        return @employees << Employee.new(employee_name, title) if self.valid_title?(title)
        raise "Invalid Title"
    end

    def size
        @employees.size
    end

    def pay_employee(employee)
        pay = @salaries[employee.title]
        if @funding > pay
            employee.pay(pay)
            @funding -= pay
        else
            raise "Not enough funding to pay you, sorry! =("
        end
    end

    def payday
        @employees.each {|emp| self.pay_employee(emp)}
    end

    def average_salary
        salaries = 0
        @employees.each {|employee| salaries += @salaries[employee.title]}
        salaries / self.size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(new_startup)
        @funding += new_startup.funding
        @salaries = new_startup.salaries.merge (@salaries)
        @employees += new_startup.employees
        new_startup.close
    end
end
