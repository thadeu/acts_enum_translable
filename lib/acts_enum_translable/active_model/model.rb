# @author Thadeu Esteves
module ActsEnumTranslable
  module ActiveModel
    module Model
      extend ActiveSupport::Concern

      included do
        extend ActsEnumTranslable::Support::RuntimeError
        extend ActsEnumTranslable::Support::I18n
        # Busca todos os enums do model corrente
        # @return [Array] ["Nao Realizado", "Realizado", "Arquivado"]
        def self.enum_list(enum_key = nil)
          # runtime_error exception
          runtime_error enum_key
          defined_enums[enum_key.to_s].map do |enum|
            trans_key = i18n_key(enum_key, enum.first)
            # procura nos arquivo de traducao
            # caso nao encontre humanize o proprio enum
            if I18n.exists? trans_key
              I18n.t(trans_key, locale: I18n.locale)
            else
              # original key
              enum.first.humanize
            end
          end
        end

        # Busca todos os metodos do model corrente
        #
        # @return [Array] [["Nao Realizado", 0], ["Realizado", 1], ["Arquivado", 2]]
        def self.enum_with_keys(enum_key = nil)
          # runtime_error exception
          runtime_error enum_key

          defined_enums[enum_key.to_s].map do |enum|
            original_key = enum.first.humanize
            trans_key = i18n_key(enum_key, enum.first)

            # procura nos arquivo de traducao
            # caso nao encontre humanize o proprio enum
            if I18n.exists? trans_key
              [I18n.t(trans_key, locale: I18n.locale), enum.second]
            else
              [original_key, enum.second]
            end
          end
        end

        # Use with radio simple_form
        #
        # @return [Array] [["Nao Realizado", 0], ["Realizado", 1], ["Arquivado", 2]]
        def self.enum_form(enum_key = nil)
          # runtime_error exception
          runtime_error enum_key

          defined_enums[enum_key.to_s].map do |enum|
            original_key = enum.first.humanize
            trans_key = i18n_key(enum_key, enum.first)

            # procura nos arquivo de traducao
            # caso nao encontre humanize o proprio enum
            if I18n.exists? trans_key
              [enum.second, I18n.t(trans_key, locale: I18n.locale)]
            else
              [enum.second, original_key]
            end
          end
        end
      end
    end
  end
end
