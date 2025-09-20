class TipoConta < ApplicationRecord
    has_many :contas, class_name: "conta"
end
