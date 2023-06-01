class BorrowersController < ApplicationController
    before_action :set_borrower, only: [:udpate]

    attr_accessor :borrower

    def index
        borrowers = Borrower.all

        render json: BorrowerSerializer.new(
            borrowers
        ), status: 200
    end
    
    def create
        borrower = Borrower.new(borrower_params)

        if borrower.save
            head 201
        else
            render json: borrower.errors, status: 422
        end
    end

    def update
        if borrower.update(borrower_params)
            head 202
        else
            render json: borrower.errors, status: 422
        end
    end

    private

    def set_borrower
        @borrower = Borrower.find(params[:id])
    end

    def borrower_params
        params.require(:borrower).permit(:name)
    end
end
