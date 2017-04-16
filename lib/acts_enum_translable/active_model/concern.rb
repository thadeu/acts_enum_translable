# @author Thadeu Esteves
module ActsEnumTranslable
  # ActiveModel
  module ActiveModel
    # Concern for ActiveModel
    module Concern
      extend ActiveSupport::Concern
      include ActsEnumTranslable::ActiveModel::Model

      module ClassMethods
        # Pega o nome da class corrente, verifica se tem enums
        # e cria os metodos em tempo de execucao
        # == Returns:
        # @return [Method] method_translable
        def acts_enum_translable(options = {})
          cattr_accessor :class_name
          klass = (options[:class_name] || self)
          add_runtime_methods(klass) if klass.defined_enums?
        end

        private

        # Cria metodos em tempo de execucao com sufixo _translable
        #
        # == Parameters:
        # @param klass [Array] recebe um array com os enums definidos em uma class/model
        #
        # == Returns:
        # @return [Method] retorna methods com sufixo _translable baseados nas keys dos enums
        def add_runtime_methods(klass)
          klass.defined_enums.keys.each do |enum_key|
            define_method :"#{enum_key}_translable" do
              trans_key = self.class.i18n_key(enum_key, send(enum_key))
              return I18n.t(trans_key, locale: I18n.locale) if I18n.exists? trans_key
              return send(enum_key).humanize
            end
          end
        end
      end
    end
  end
end
