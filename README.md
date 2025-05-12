# Turbo Streams Blog

[![Tests](https://github.com/yourusername/rais8/actions/workflows/test.yml/badge.svg)](https://github.com/yourusername/rais8/actions/workflows/test.yml)

A simple blog application built with Ruby on Rails and Turbo Streams. This application demonstrates the power of Hotwire to create reactive web interfaces without writing custom JavaScript.

## Features

- Create, read, update, and delete blog posts
- Live updates with Turbo Streams
- Responsive design

## Technology Stack

- Ruby 3.4.2
- Rails 8.1.0.alpha
- Turbo Rails (Hotwire)
- SQLite

## Development Setup

1. Clone the repository
2. Install dependencies:
   ```
   bundle install
   ```
3. Set up the database:
   ```
   rails db:create db:migrate
   ```
4. Start the server:
   ```
   rails server
   ```
5. Visit `http://localhost:3000` in your browser

## Test Coverage

This project uses SimpleCov for test coverage reporting. After running the tests, you can see the coverage report in the `coverage` directory.

```
rails test
```

Current coverage: 84.62%
