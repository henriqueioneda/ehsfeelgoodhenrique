module PaymentsHelper
    def format_money value
        money = Money.new(value, "BRL")
        money.currency.symbol + money.to_s
    end
end
