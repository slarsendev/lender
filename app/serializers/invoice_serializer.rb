class InvoiceSerializer
    include FastJsonapi::ObjectSerializer

    attributes(
        :number,
        :amount,
        :due_date,
        :status,
        :borrower,
        :scan,
    )
end