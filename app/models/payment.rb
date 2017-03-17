class Payment < ApplicationRecord
    belongs_to :payee, class_name: "User", foreign_key: :payee_id
    belongs_to :payer, class_name: "User", foreign_key: :payer_id

    # {name: string, value: string}
    serialize :spents, Array

    def due_date
        self.created_at + 10.days
    end

    def pay
        self.paid = true
        save
    end

    def paid_at
        self.updated_at
    end

    def total_spents
        spents.map{ |spent| spent[:value] }.reduce(&:+)
    end
end
