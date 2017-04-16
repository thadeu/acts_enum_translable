# @author Thadeu Esteves
module ActsEnumTranslable
  module Support
    module I18n
      # based in translations for active record models
      # http://guides.rubyonrails.org/i18n.html#translations-for-active-record-models
      # @return [String] activerecord.attributes.model_name.attribute_name.field_name
      def i18n_key(i18n_key, key)
        "activerecord.attributes.#{name.underscore.pluralize}.#{i18n_key}.#{key}"
      end
    end
  end
end
