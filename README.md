# Speed Monitor
Monitor network speeds over time, for issue detection
 - TODO: Optional notifiers

## Install
Speed monitor uses docker/docker compose, so all that is necessary to
run it is to install docker, clone the project and run `docker compose build`

## Run
1) Run the rails server with `docker compose up`
2) Run webpacker dev server with `docker compose run --rm app sh -c "./bin/webpack-dev-server --host 0.0.0.0"`

Frontend should now be available at http://0.0.0.0:3035
