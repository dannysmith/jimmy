# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Create basic user
User.create! username: 'dannysmith', primary_email: 'hi@danny.is', name: 'Danny Smith', metadata: {note: 'This is a seed account'}
