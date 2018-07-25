# Documentation and Conventions

This directory contains documentation that should help with actually writing code. For information on tooling, deployment and project structure, see the project README. If you invent a new design pattern, or change the way our existing patterns work, be sure do update the documentation here too.

## Principles

The clenlieness of this codebase is paramount. Messy code is fine on a feature branch, but **only ever commit clean, well factored code** to `master`. We care about clenlieness because a well-structured codebase is easier to change in the future. We also have a number of conventions (or patterns) that help to keep the codebase maintainable and easy to work with.

In general, you should bear these basic principles in mind:

- Write for humans to read, not the for interpreter.
- When multiple solutions seem to solve the problem equally well, choose the simplest one (see Occams Razor)

## Basic Standards and Linting

Code Reviews are really important, but it should never be down to a human to notice an error where a machine can do the job. In light of this, we use a number of tools to enforce syntax rules and other conventions. This povides a baseline quality. These linters, along with the test suite, must always be green on `master`. We reccomend setting up your text editor to show violations as you edit, and to prettify your Javascript/Markdown on save.

Having a strict, enforced standard for the basic stuff allows us to focus on the hard part of writing clean code: the **design**...

## General Guidelines

When adding new code, refactor existing code as you go. Take [Kent Beck's advice](https://twitter.com/KentBeck/status/2507333583075000320):

> For each desired change, make the change easy (warning: this may be hard), then make the easy change.
> _[Kent Beck, 2012](https://twitter.com/KentBeck/status/2507333583075000320)_

Unless things are really urgent, start by working out what would make your change easy to implement. Refactor the existing code and tests to put yourself in that situation. Then make your change using Red/Green/Refactor. By following this approach, we ensure that constant refactoring is baked into the development process. This reduces non-strategic technical debt in the long-term.

> ⚠️ **WARNING** This doesn't mean that you should spend days implementing the cool design pattern you just read about because it will "make your change easier". As developers, we like to kid ourselves that this is useful work. [Often, it is not](https://medium.com/@plainprogrammer/programmers-dont-understand-value-508799517da0). Be sure you are refactoring to make **your change easier**, not just make the codebase more shiny.

## Guides

- General
  - [Naming Things](naming_things.md)
  - [Testing](testing.md)
  - [Core Features](core_features.md)
- Front End
  - [Components](components.md)
- Back End
  - [Design Patterns](design_patterns.md)
  - [Error Handling](error_handling.md)
  - [Model Listners](model_listners.md)
  - [Service Objects](service_objects.md)
