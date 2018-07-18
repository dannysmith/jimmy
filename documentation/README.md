# Documentation and Conventions

## General Guidelines

Be ruthless in your application of the SOLID principles. Don't feat creating new classes!:

* **Single Responsibility**
* **Open/Closed**
* **Liskov Substitution**
* **Interfact Segregation** - Not really relevant in ruby,
* **Dependancy Inversion**

## Core Features
We have defined a set of "core features". These are the features that, if they break, make it impossible for our users to peform their primary Jobs to Be Done. Core features should:

* Always have 100% test coverage at unit and request level.
* Be covered by an end-to-end system test, at least along the happy path.
* Have the routes covered by route specs.
* Have well-factored, defensive code.
* Have well-designed exception handling built in.
* Have had edge-cases considered and handled.
* Be thoroughly manually tested on staging before release.

Although not ideal, we accept that non-core features might sometimes ship to production with minor bugs. We're cool with the odd user encountering an edge-case bug and reporting it in this case. It is **never okay for a core feature to ship to production with bugs** (though of course, that will sometimes happen).

## Methods

Don't be [scared of local variables](http://www.soulcutter.com/articles/local-variable-aversion-antipattern.html). Sometimes they are better than endless jumping between methods:

```ruby
# Do
def do_thing(name)
  updated_name = NameAnalyzer.new.call(name)
  name_serializer = NameSerializer.new
  updated_name = name_serializer.serialize(updated_name)
  updated_name.gsub('', '_')
end

# Don't
def do_thing(name)
  substitute_underscores(name_serializer.serialize(analyze(name)))
end
def analyze(name)
  name_analyzer.analyze(name)
end
def name_analyzer
  NameAnalyzer.new
end
def name_serializer
  NameSerializer.new
end
def substitute_underscores(str)
  str.gsub('', '_')
end
```

## Naming Things

Naming is mega-important.

#### Methods
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

#### Variables
Local variables should always have short, descriptive names. Prefer descriptive over short. Instance variables (and class instance variables) should always be named after the thing they hold.

#### Classes

Specific types of classes should always be suffixed with their type:

* Error/Exception classes should always end in `Error`.
* Worker classes should always end in `Worker`.
* Mailer classes should always end in `Mailer`.
* Service object classes should always end in `Service`.
* Value object classes should always end in `Value`.
* Factories should always end in `Factory`.
* Preseters should always end in `Presenter`.
* Faccades and Decorator classes should always end in `Facade` or `Decorator`.
* Controllers should always end in `Controller`.

Where it makes sense, concerns should be named after the way they modify the object they are mixed into: eg `Discoverable`, `Authenticatable`, `Trashable`, `Deletable`, `EditableByAdministrators`. This is a soft rule.

Models should always be named after the real-life thing they represent, with no suffix. Other POROs should be named carefully: if a class doesn't fit in one of the catagories above and you can't think of a good name for it based on what it represents, perhaps you should rethink your design.

## Overriding Fundamentals
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

TK

`Jimmy` namespace.
Other namespaces.

## Testing

We use various types of test in Jimmy. Good testing is crucial to avoiding technical debt, but it's also **really important** that we never end up hating our own tests. If you ever feel like testing is a pain or is getting in the way of your work, then we have a problem with our tests.

General Rules:

* Where possible, use tests to drive your development (Red/Green/Refactor).
* Avoid long, complex tests. If you have to mock fifty objects to get your test working, you should probably rethink your design to remove the dependancies.
* Only mock classes that you own. If you need to mock a third-party library, wrap it in an interface and mock that.
* Never mock/stub the object under test.
* Make sure your tests are readable. Half the value in tests is that they *specify the behaviour* of the code in a way that's easy to comprehend.
* Avoid being clever in your tests. Repitition is totally fine, unless it makes the test hard to understand.

#### Test Types in Jimmy

**Unit Specs**
The vast majority of tests in Jimmy should be unit tests for POROs (service objects, value objects and the like). We lean havily on these because we favour decomposing the app into many small classes with a single responsibility. These calsses should be very easy to test in isolation, and have few dependancies. They should also contain the vast majority of business logic. This is our **main strategy for keeping our test suite clean and maintainable**.

Unit specs are likely to cover:

* Service Objects
* Value Objects
* Facades & Adaptors
* Decoraters
* Factories
* Concerns
* Presenters

**Model Specs**
Because much of our business logic lives in POROs, we need fewer model tests that many rails apps. That said, we still have a lot of them – together with unit tests, they provide the main defence against bugs. Model tests should always be written, both for PORO models and ActiveRecord-backed modes. When testing the latter, avoid database read/writes to keep them fast, where possible.

**Helper Specs**


**Mailer Specs**


**Worker Specs**
These live in `spec/workers` and in general, should test only the `perform` method for each worker. They should be viewed as simple integration tests, since any complext business logic should be abstracted into a seperate PORO class that is fully unit tested.

"One off" workers that make large-scale changes to the database (like those fired by rake tasks for data manipulation or migrations) should always have tests, but they should generally not be run as part of the CI build.

**Request Specs**
To quote *Rails 5 Test Prescriptions*...

> Use a request spec if you're testing the results of a single request to the rails server, there's no interaction with the user in the test, and you're checking the behaviour of the controller action or a side effect of calling the controller action.

At the moment, we don't insist on 100% coverage of controller actions for routes that return HTML. In general, you should **always** write a request spec if:

* The controller action returns JSON.
* The controller action itself contains complex logic.
* The controller action calls many models and service objects.
* The controller action is part of a core feature.

**Route Specs**
Route specs are very fast, and usually very simple to write. We aim to have 100% coverage of our "core" routes, plus any routes which deviate from the normal rails pattern or contain complex routing logic. Aside from than that we don't write route tests, since they offer very little value and are often implicitly tested by request specs.

**View Specs**

**Integration Specs**

**System Specs**

**Javascript Unit Tests**



