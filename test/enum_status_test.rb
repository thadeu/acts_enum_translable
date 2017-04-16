require 'test_helper'

class EnumStatusTest < ActiveSupport::TestCase
  setup do
    @user_blocked = User.new(name: 'Thadeu', email: 'tadeu@gmail.com', status: :blocked)
    @user_inactive = User.new(name: 'Thadeu', email: 'tadeu@gmail.com', status: :inactive)
    @user_active = User.new(name: 'Thadeu', email: 'tadeu@gmail.com', status: :active)
    @enum = User.defined_enums.keys.first.to_s
  end

  test 'when method respond_to status_translable class' do
    assert_respond_to @user_active, :status_translable
  end

  test 'user status when i18n english' do
    I18n.locale = :en
    assert_equal 'Inactive', @user_inactive.status_translable
  end

  test 'user status when i18n portuguese' do
    I18n.locale = :pt
    assert_equal 'Inativo', @user_inactive.status_translable
  end

  test 'user status when not exists key i18n in germany' do
    I18n.locale = :de
    assert_not_equal 'inaktiv', @user_inactive.status_translable
  end
end
