module ApplicationHelper
    def formatar_data(data)
        return data.to_date.strftime("%d/%m/%Y") if data.present?
    end
end
