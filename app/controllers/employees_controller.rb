class EmployeesController < ApplicationController
    before_action :set_employee, only: [:edit, :update, :show, :destroy]
    
    def index
        @employees = Employee.all 
    end

    def new
        @employee = Employee.new(birth_date: Date.new(1995, 12, 21))
    end

    def create
        @employee = Employee.new(employee_params)

        if @employee.save
            redirect_to employees_path, notice: "Employee has been created succesfully"
        else
            render :new
        end 
    end

    def edit
    end

    def update
        if @employee.update(employee_params) 
            redirect_to employees_path, notice: "Employee has been updated succesfully"
        else
            render :edit #we can also use in string format like (render 'edit')
        end 
    end

    def show
    end

    def destroy
        if @employee.destroy
            redirect_to employees_path, notice: "Employee has been Deleted succesfully"
        end
    end


    private
    #it's a plan ruby method i'm not going to define any action
    def employee_params
        params.require(:employee).permit(:first_name, :middle_name, :last_name, :email, :city, :state, :pincode)
    end

    def set_employee
        @employee = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
        redirect_to employees_path, notice: error
    end
end
