server:
	DEV_PORT=3001 ./bin/dev

bundle:
	./bin/bundle

db_reset:
	./bin/rails db:reset

application_setup: bundle db_reset

test:
	./bin/bundle exec rspec