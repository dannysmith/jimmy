# Testing

We use various types of test in Jimmy. Good testing is crucial to avoiding technical debt, but it's also **really important** that we never end up hating our own tests. If you ever feel like testing is a pain or is getting in the way of your work, then we have a problem with our tests.

## General Rules

- Where possible, use tests to drive your development (Red/Green/Refactor).
- Avoid long, complex tests. If you have to mock fifty objects to get your test working, you should probably rethink your design to remove the dependancies.
- Only mock classes that you own. If you need to mock a third-party library, wrap it in an interface and mock that.
- Never mock/stub the object under test.
- Make sure your tests are readable. Half the value in tests is that they _specify the behaviour_ of the code in a way that's easy to comprehend.
- Avoid being clever in your tests. Repitition is totally fine, unless it makes the test hard to understand.

## Test Types in Jimmy

### Unit Specs

The vast majority of tests in Jimmy should be unit tests for POROs (service objects, value objects and the like). We lean havily on these because we favour decomposing the app into many small classes with a single responsibility. These calsses should be very easy to test in isolation, and have few dependancies. They should also contain the vast majority of business logic. This is our **main strategy for keeping our test suite clean and maintainable**.

Unit specs are likely to cover:

- Service Objects
- Value Objects
- Facades & Adaptors
- Decoraters
- Factories
- Concerns
- Presenters

### Model Specs

Because much of our business logic lives in POROs, we need fewer model tests that many rails apps. That said, we still have a lot of them – together with unit tests, they provide the main defence against bugs. Model tests should always be written, both for PORO models and ActiveRecord-backed modes. When testing the latter, avoid database read/writes to keep them fast, where possible.

### Helper Specs

### Mailer Specs

### Worker Specs

These live in `spec/workers` and in general, should test only the `perform` method for each worker. They should be viewed as simple integration tests, since any complext business logic should be abstracted into a seperate PORO class that is fully unit tested.

"One off" workers that make large-scale changes to the database (like those fired by rake tasks for data manipulation or migrations) should always have tests, but they should generally not be run as part of the CI build.

### Request Specs

To quote _Rails 5 Test Prescriptions_...

> Use a request spec if you're testing the results of a single request to the rails server, there's no interaction with the user in the test, and you're checking the behaviour of the controller action or a side effect of calling the controller action.

At the moment, we don't insist on 100% coverage of controller actions for routes that return HTML. In general, you should **always** write a request spec if:

- The controller action returns JSON.
- The controller action itself contains complex logic.
- The controller action calls many models and service objects.
- The controller action is part of a core feature.

### Route Specs

Route specs are very fast, and usually very simple to write. We aim to have 100% coverage of our "core" routes, plus any routes which deviate from the normal rails pattern or contain complex routing logic. Aside from than that we don't write route tests, since they offer very little value and are often implicitly tested by request specs.

### View Specs

### Integration Specs

### System Specs

### Javascript Unit Tests
