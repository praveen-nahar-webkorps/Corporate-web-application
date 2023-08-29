class DocumentsController < ApplicationController
    before_action :set_document, only: [:edit, :show, :update, :destroy]

    def index
        @documents = Document.eager_load(:employee)
    end

    def new
        @document = Document.new
    end

    def create
        @document = Document.new(document_params)

        if @document.save
            redirect_to documents_path, notice: 'Document has been created Successfully'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @document.update(document_params)
            redirect_to employees_path, notice: 'Documents has been updated successfully'
        else
            render :new
        end
    end

    def show 
    end

    def destroy
        if @document.destroy
            redirect_to documents_path, notice: 'Document has been Deleted Successfully'
        end
    end

    def show_by_employee
        @document = Document.find_by(employee_id: params[:id])
    rescue ActiveRecord::RecordNotFound => error
        redirect_to employees_path, notice: error
    end

    def edit_by_employee
        @document = Document.find_by(employee_id: params[:id])
    rescue ActiveRecord::RecordNotFound => error
        redirect_to employees_path_path, notice: error
    end

    def destroy_by_employee
        @document = Document.find_by(employee_id: params[:id])
        if @document.destroy
            redirect_to employees_path, notice: 'Document has been Deleted Successfully'
        end
    end

    private

    def document_params
        params.require(:document).permit(:name, :doc_type, :employee_id,:img)
    end

    def set_document
        @document = Document.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
        redirect_to documents_path, notice: error
    end

end
