# Jimmy

## Why Does Jimmy Exist?

Mainly, Jimmy is intended as an example app, for use when Danny is teaching. It also serves as a playground for testing new tools, best practices and ideas. One day, it might be good enough to actually use. That day is a long way off.

## Installation and Configuration

Ensure you have Homebrew and Ruby installed (if you are on macOS).

Now clone the project and run the setup commands

```shell
git clone git@github.com:dannysmith/jimmy.git
cd jimmy
brew tap homebrew/bundle
brew bundle
bin/setup
```

## Running the App Locally

Once you're set up, you can run this command, which will launch the processes defined in the Procfile in [Overmind](https://github.com/DarthSim/overmind):

```shell
./server
```

## Running the Tests

## Code Quality

There are a number of code quality tools available in this project. The following commands are available at the root of the project:

```shell
brakeman             # Scan for security vulnerabilities
bundler-audit        # Scan for outdated dependencies
mdl filename.md      # Scan a specific markdown file for style
rails_best_practices # Check for adherance to rails best practaces
reek                 # Scan for code smells
rubocop              # Scan for ruby styleguide violations
sandi_meter -d       # Print a report showing adherance to Sandy Metz' rules

rubycritic           # Open a browser window showing code quality metrics
rubrowser            # Run a server showing the app's node graph

bundle exec derailed bundle:mem     # Analyse memory at boottime
bundle exec derailed bundle:objects # Analyse memory at runtime

log_analyzer log/development.log -s count # Analyze the dev log for view rendering speeds
recent_ruby --gemfile Gemfile # Check wether the ruby version in the Gemfile has any security vulnerabilities.
```

## Useful Rake Tasks

```ruby
rake notes      # See TODO comments
rake traceroute # Search for unused routes and unreachable actions
```

## Commits Policy and workflow

## Deployment Pipeline

The apps deployment pipeline is managed entirely via Heroku.

## Contributors

| Github        | Name              | Email                    |
| --------------|-------------------|--------------------------|
| dannysmith    | Danny Smith       | hi@danny.is              |
