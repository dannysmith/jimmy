# frozen_string_literal: true

# frozen_string_literal: true

module Jimmy
  # Custom erros like this can be used alongside the ErrorHandler
  #
  #   Where the error is raised:
  #
  #     raise Jimmy::ExampleError.new('Whoops, an error occured',
  #                                 :fatal,
  #                                 {details: 'Some data here'})
  #
  #   Where the error is handled:
  #
  #     rescue Jimmy::ExampleError => e
  #       Jimmy::ErrorHandler.handle(e, nil, e.metadata)
  #       flash[:error] = e.user_message
  #       redirect_to :somewhere
  #     end
  class ExampleError < Jimmy::Error
    def user_message
      I18n.t('errors.example')
    end
  end
end
