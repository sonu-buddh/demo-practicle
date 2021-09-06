module ApplicationHelper
    def get_countries
        Country.pluck(:name, :id)
    end

    def get_states(id)
        State.where(country_id: id).pluck(:name, :id)
    end
end
