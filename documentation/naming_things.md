# Naming Things

Naming is mega-important. You should not shy away from discussions and arguments on this subject!

## Methods

Method names should always make the methods purpose clear. Prefer short names where possible, but never at the expense of calrity.

When using an active record callback to set an instance variable in a model, **always** prefix it with `set_`. This indicates that the method sets an instance variable, rather than just returning something. In POROs, you should prefer setting instance variables in the constructor:

```ruby
# Prefer
class Thing
  def initialize(data)
    @data = parse_data(data)
  end

  private

  def parse_data(data)
    data.do_stuff
  end
end

# Over
class Thing
  def initialize(data)
    set_parsed_data(data)
  end

  private

  def set_parsed_data(data)
    @data = data.do_stuff
  end
end
```

## Variables

Local variables should always have short, descriptive names. Prefer descriptive over short. Instance variables (and class instance variables) should always be named after the thing they hold.

## Classes

Specific types of classes should always be suffixed with their type:

- Error/Exception classes should always end in `Error`.
- Worker classes should always end in `Worker`.
- Mailer classes should always end in `Mailer`.
- Service object classes should always end in `Service`.
- Value object classes should always end in `Value`.
- Factories should always end in `Factory`.
- Preseters should always end in `Presenter`.
- Faccades and Decorator classes should always end in `Facade` or `Decorator`.
- Controllers should always end in `Controller`.

Where it makes sense, concerns should be named after the way they modify the object they are mixed into: eg `Discoverable`, `Authenticatable`, `Trashable`, `Deletable`, `EditableByAdministrators`. This is a soft rule.

Models should always be named after the real-life thing they represent, with no suffix. Other POROs should be named carefully: if a class doesn't fit in one of the catagories above and you can't think of a good name for it based on what it represents, perhaps you should rethink your design.

### Overriding Fundamental Classes

Avoid overriting ruby/rails fundamental classes. Instead, create a class that inherits and modify that, or if you must, use [refinements](http://timelessrepo.com/refinements-in-ruby) to avoid bleeding your modifications into other modules.

```ruby
# Don't
class String
  def thing
    "thing"
  end
end
"something".thing

# Do
class SpecialString < String
  def thing
    "thing"
  end
end
SpecialString.new("something").thing
```

## Modules

TODO: Write about naming modules here.

`Jimmy` namespace.
Other namespaces.
