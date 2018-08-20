# The `Current` Class

Jimmy implements a `Current` class that uses [Rails' CurrentAttributes](https://edgeapi.rubyonrails.org/classes/ActiveSupport/CurrentAttributes.html).

This makes data like Request UUID, IP Address, USer agent and current user available **anywhere** in the app. Prefer using `Current.user` over passing this sort of data around.

## Request Context

There is also a mechanism for adding arbitary information about a request's _context_ (imagine you are "annotating" the request).

```ruby
Current.ctx("Firing background worker with ID #{some_thing.id}")
# ...
Current.ctx("No response from ThinngyMagicService. Falling back to default")

# ...
Current.context # => ['Firing back...', 'No response fro...']
```

You can think of it as a mini log for the request. Here are some basic rules about **context**:

- Never add items via `Current.context.<<`. Instead, use the `ctx` method.
- Only add items that are likeley to be useful when debugging.
- When dealing with errors, avoid duplicating information that appears in the stack trace.
- Only use context data for logging or debugging - never store execution-critical data in it.
- Always pass a string to `Current::ctx`.

Errors handled by `Jimmy::ErrorHandler#handle` will call `Current.request_details.pretty_inspect` to log the current request details and context alongside the exception. Context information is also sent to our exception tracking service.
