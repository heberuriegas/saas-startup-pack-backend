#!/bin/sh
set -e

bundle install

rm -rf public/packs
yarn

bundle exec rails db:migrate:with_data
bundle exec rails db:seed

exec "$@"