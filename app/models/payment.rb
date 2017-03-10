class Payment < ApplicationRecord
    belongs_to :payee, class_name: "User", foreign_key: :payee_id
    belongs_to :payer, class_name: "User", foreign_key: :payer_id

    serialize :spents, Array

    def due_date
        self.created_at + 10.days
    end
end
