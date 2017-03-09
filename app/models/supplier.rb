class Integrator < User
    def self.default_scope
        where(type: User.types[:supplier])
    end
end