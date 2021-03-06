# README

## Requirement

- ruby 2.4.1
- node.js
- postgresql

## Setup

- ruby
  ```sh
  $ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
  $ $SHELL -l
  $ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  $ rbenv install 2.4.1
  ```

- postgresql
  ```sh
  $ brew install postgresql
  $ bin/pg init
  $ bin/pg start
  ```

- rails
  ```
  $ gem install bundler
  $ bundle install
  $ bundle exec rails db:setup
  $ bundle exec rails db:migrate
  $ bundle exec rails s
  $ ./bin/webpack-dev-server
  ```

## Development Utility

- insert default data
  ```sh
  $ rails db:seed
  ```

- generate dummy data
  ```sh
  $ rails dummy:generate
  ```
