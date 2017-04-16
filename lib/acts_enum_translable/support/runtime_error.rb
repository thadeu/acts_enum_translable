# @author Thadeu Esteves
module ActsEnumTranslable
  module Support
    module RuntimeError
      # Exception Method
      # TODO: We need improve method
      # @return [Exception] Enum key required for translation enums
      def runtime_error(enum_key)
        return raise 'Enum key required for translation enums' unless enum_key.present?
        return raise 'Enum key must be type symbol' unless enum_key.class == Symbol
      end
    end
  end
end
