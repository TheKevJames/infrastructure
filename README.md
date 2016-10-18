# Infrastructure

This project is used to configure routing of my various projects and their
status checks.

## Usage

    docker-compose build
    docker-compose up -d

## Notes

This project relies on my personal projects having specific port bindings by
default. This ensures any combination of services can run on a single machine
without needing to reconfigure. Currently, the mapping is as follows:

| Port  | Service             |
| ----- | ------------------- |
| 80    | nginx               |
| 2003  | carbon collector    |
| 3000  | sensu (uchiwa)      |
| 4567  | sensu (api)         |
| 6379  | redis               |
| 9000  | phabricator         |
| 28001 | devstat             |
| 28002 | devstat (api)       |
| 28003 | youshouldread       |
| 28004 | youshouldread (api) |
| 28005 | thekev.in           |
| 28006 | graphite-web        |
