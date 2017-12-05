# frozen_string_literal: true

DebuggingException = Class.new(StandardError)

class DebuggingController < ApplicationController
  def raise_exception
    raise DebuggingException, 'You are deliberatley raising a debugger exception'
  end
end
