class Invoice < ApplicationRecord
    belongs_to :borrower

    validates :number, presence: true, uniqueness: true
    validates :amount, :due_date, :borrower_id, :status, presence: true


    enum :status, [:created, :rejected, :approved, :purchased, :closed]
end
