# ActsEnumTranslable
ActsEnumTranslable convention translate enums with .yml file.

## Usage
* Install Gem
* Configure enum native Rails
* Add acts_enum_translable in Model class
* Configure active_record attributes in file .yml
* Use methods

## Install Gem for Ruby on Rails
Add this line to your application's Gemfile:

```ruby
gem 'acts_enum_translable'
```

After:
```bash
$ bundle install
```

## Configure enum native Rails
More details, please visit [ActiveRecord::Enum](http://api.rubyonrails.org/classes/ActiveRecord/Enum.html)

```ruby
# example model
# user.rb

class User < ApplicationRecord
  enum status: { inactive: 0, active: 1, blocked: 2 }
  enum visible: [:hide, :show]
end
```
## Add acts_enum_translable in Model class

Add in Model for inherit methods

```ruby
# exemple model
# user.rb

class User < ApplicationRecord
  enum status: { inactive: 0, active: 1, blocked: 2 }
  enum visible: [:hide, :show]

  # Add in Model for inherit methods
  acts_enum_translable
end
```

## Configure active_record attributes in file .yml

More details, please visit section [4.5 Translations for Active Record Models](http://guides.rubyonrails.org/i18n.html#translations-for-active-record-models)

Configure *Locale English* for exemple

```ruby
# config/locales/en.activerecord.yml
en:
  activerecord:
    attributes:
      users:
        status:
          inactive: "Inactive"
          active: "Active"
          blocked: "Blocked"
        visible:
          hide: 'Hide'
          show: 'Show'
```

Configure *Locale Portuguese* for exemple

```ruby
# config/locales/pt.activerecord.yml
pt:
  activerecord:
    attributes:
      users:
        status:
          inactive: "Inativo"
          active: "Ativo"
          blocked: "Bloqueado"
        visible:
          hide: 'Oculto'
          show: 'Visível'
```

## Use methods sufix _translable enums key
```ruby
# print status
user = User.new(status: :blocked, visible: :show)
user.status_translable
# english: Blocked
# portuguese: Bloqueado

# print visible
user.visible_translable
# english: Show
# portuguese: Visível
```

## Contributing

We have a long list of valued contributors. Check them all at: https://github.com/Thadeu/acts_enum_translable.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
