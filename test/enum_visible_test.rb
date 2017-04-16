require 'test_helper'

class EnumVisibleTest < ActiveSupport::TestCase
  setup do
    @user_hide = User.new(name: 'thadeu', email: 'tadeu@gmail.com', visible: 0, status: 0)
  end

  test 'when method respond_to class' do
    assert_respond_to @user_hide, :visible_translable
  end

  test 'when user is hide in i18n portuguese' do
    I18n.locale = :pt
    assert_equal 'Oculto', @user_hide.visible_translable
  end

  test 'when user is hide in i18n english' do
    I18n.locale = :en
    assert_equal 'Hide', @user_hide.visible_translable
  end

  test 'when user is hide in i18n germany' do
    I18n.locale = :de
    assert_equal 'verstecken', @user_hide.visible_translable
  end

  test 'enums list type visible in english' do
    I18n.locale = :en
    assert_equal %w[Hide Show], User.enum_list(:visible)
  end

  test 'enums list type visible in portuguese' do
    I18n.locale = :pt
    assert_equal %w[Oculto Visível], User.enum_list(:visible)
  end
end
