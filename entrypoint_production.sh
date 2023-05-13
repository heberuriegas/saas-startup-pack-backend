#!/bin/sh
set -e

bundle exec rails db:migrate:with_data
bundle exec rails db:seed

exec "$@"