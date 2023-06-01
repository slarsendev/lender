class InvoicesController < ApplicationController
    before_action :set_invoice, only: [:show, :update, :destroy]

    attr_accessor :invoice

    def index
        status = params[:status]

        invoices = Invoice.includes(:borrower).where(status_condition(status))

        render json: InvoiceSerializer.new(
            invoices
        ), status: 200
    end

    def create
        invoice = Invoice.new(invoice_params)

        invoice_numbers = Invoice.all.pluck :number
        characters = [('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
        number = ''

        loop do
            number = (0...11).map { characters[rand(characters.length)] }.join
            break unless invoice_numbers.include?(number)
        end

        invoice.number = number

        if invoice.save
            head 201
        else
            render json: invoice.errors, status: 422
        end
    end

    def show
        render json: InvoiceSerializer.new(
            invoice
        ), status: 200
    end

    def update
        if invoice.update(invoice_params)
            head 202
        else
            render json: invoice.errors, status: 422
        end
    end

    def destroy
        if invoice.destroy
            head 200
        else
            render json: invoice.errors, status: 422
        end
    end

    private

    def invoice_params
        params.require(:invoice).permit(:amount, :due_date, :status, :borrower_id, :scan)
    end

    def set_invoice
        @invoice = Invoice.find(params[:id])
    end

    def status_condition(status)
        "status = #{Invoice.statuses[status]}" unless Invoice.statuses[status].blank?
    end
end
