# Ruby API template for microservices
Uses basic mix of frameworks/libraries to setup production-ready applications

 - Grape: the API Framework
 - dry-rb bundle: as IOC (checkout <a href="https://dry-rb.org">https://dry-rb.org</a> for details)
 - Sequel: database handler (remove it if you don't need it)

TODO:
`Update documentation for exception handling and service methods`

## Setup
```bash
bundle install
```
### Run tests
```bash
bundle exec rake test
```
### Run linter
```bash
bundle exec rake rubocop
```
### Run linter & tests
```bash
bundle exec rake release
```
### Run server
```bash
bundle exec rackup
```
