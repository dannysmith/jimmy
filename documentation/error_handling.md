# Error Handling

Custom erros like this can be used alongside the ErrorHandler

Where the error is raised:

```ruby
raise Jimmy::ExampleError.new('Whoops, an error occured',
                            :fatal,
                            {details: 'Some data here'})
```

Where the error is handled:

```ruby
rescue Jimmy::ExampleError => e
  Jimmy::ErrorHandler.handle(e, nil, e.metadata)
  flash[:error] = e.user_message
  redirect_to :somewhere
end
```
