# Pilot: Managers App

A simple application that displays all payment requests submitted by the contractor. The manager can only accept or reject the payment request. The acceptance/rejection of payment request should be handled by the manager app publishing an event and the contractor app processing the event to update the status for the contractor.

### Pre-requisites
- Ruby 3.0.3
- Postgres 14
- RabbitHQ 3.10.6

### Clone Repo
```shell
git clone git@github.com:ali-ehmed/pilot-manager-app.git
```

### Setup Application
```shell
make application_setup
```

### Start App
```shell
make server
```

### Run tests
```shell
make test
```
