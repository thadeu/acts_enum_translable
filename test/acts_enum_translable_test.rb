require 'test_helper'

module ActsEnumTranslable
  class Test < ActiveSupport::TestCase
    setup do
      @user_blocked = User.new(name: 'Thadeu', email: 'tadeu@gmail.com', status: :blocked)
      @user_inactive = User.new(name: 'Thadeu', email: 'tadeu@gmail.com', status: :inactive)
      @user_active = User.new(name: 'Thadeu', email: 'tadeu@gmail.com', status: :active)
      @enum = User.defined_enums.keys.first.to_s
      @status_list = User.enum_list(@enum.to_sym)
      @enum_status_english = [['Inactive', 0], ['Active', 1], ['Blocked', 2]]
      @enum_status_portuguese = [['Inativo', 0], ['Ativo', 1], ['Bloqueado', 2]]
    end

    test 'a user enum should be status' do
      assert_equal 'status', @enum
    end

    test 'a user enum status translate should be > 0' do
      assert_operator @status_list.size, :>=, 0
    end

    test 'enums list type status in english' do
      I18n.locale = :en
      assert_equal %w[Inactive Active Blocked], User.enum_list(:status)
    end

    test 'enums list type status in portuguese' do
      I18n.locale = :pt
      assert_equal %w[Inativo Ativo Bloqueado], User.enum_list(:status)
    end

    test 'enums values and keys together status in english' do
      I18n.locale = :en
      assert_equal @enum_status_english, User.enum_with_keys(:status)
    end

    test 'enums values and keys together status in portuguese' do
      I18n.locale = :pt
      assert_equal @enum_status_portuguese, User.enum_with_keys(:status)
    end
  end
end
