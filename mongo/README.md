# MongoDB instance for development

Uses Docker Compose to Mongo and Mongo Express to provide a GUI.

Server: http://localhost:27017/

GUI: http://localhost:8081/

## Data

Data is stored locally, not in the server container.

This means we don't have to persist the container state, plus it's easier to make backups.
