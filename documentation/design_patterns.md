# Design Patterns

Be ruthless in your application of the SOLID principles (don't be scared of creating new classes!):

- **Single Responsibility**
- **Open/Closed**
- **Liskov Substitution**
- **Interfact Segregation** - Not really relevant in ruby.
- **Dependancy Inversion**

## Business Logic and The 12 Factors

Apps hold two sorts of code. Some encodes app-specific stuff, like handling requests and responses. Rails excels at handling this. Some encodes **business logic**. We should strive to seperate that business logic from the other stuff, so that it is portable and easy to comprehend.

Tthe principles of [Clean Architecture]() and [DDD]() help with this, and the [12-Factor Function](https://www.youtube.com/watch?v=U0K9G3Eig2w) is a good model too:

> If you isolate your functional code according to the 12 factors, your will be able to change the meaning of your software with minimal impact on the magic that moves information from one place to another, and be able to change the magic (in our case, Rails) with minimal impact on the meaning.

A 12-factor function:

1.  **Produces meaning** (in other words, it should take stuff in and produce something more meaningful as an output)
2.  **Takes arguments**
3.  **Does not reference deployment strategy**
4.  **Does not reference presistance startegy**
5.  Referentially transparent
6.  Side-effect free
7.  Composable
8.  Tested alone
9.  Tested from the consumer's perspective
10. Robust
11. Runtime agnostic
12. Optimizable

The first four are the core of this idea - the rest are just refinements.

---

## Types of Class

### Models

### Controllers

### Service and Value Objects

### Query Objects

### Error/Exceptions

### Workers

### Mailers

### Presenters

### Views

### Routing Constraints
