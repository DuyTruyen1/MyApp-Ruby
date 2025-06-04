#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Run migrations for all databases
bundle exec rails db:migrate
bundle exec rails db:migrate:cache
bundle exec rails db:migrate:queue
bundle exec rails db:migrate:cable 