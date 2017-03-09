class Integrator < User
    def self.default_scope
        where(type: User.types[:integrator])
    end
end