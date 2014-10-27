#!/bin/bash
ruby build-scripts/create-rollups.rb
bundle exec rerun --pattern "**/*.{rb,erb,ru}" 'unicorn -c ./config/unicorn.rb'