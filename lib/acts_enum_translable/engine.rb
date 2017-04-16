module ActsEnumTranslable
  module Engine
    ActiveSupport.on_load :active_record do
      ActiveRecord::Base.send :include, ActsEnumTranslable::ActiveModel::Concern
    end
  end
end
