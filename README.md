# todo-list-api
## project setup

### Install gems:
```
$ bundle install
```

### Update the database by running migrations:
```
rails db:migrate
```

### Feed the database with default seeds:
```
rails db:seed
```

### Start the web server on http://localhost:3000 by default:
```
rails server
```

### Run all RSpec tests
```
rspec -f documentation spec/
```

## Usage
| HTTP Verbs | paths      | reason             |
| ---------- | ---------- | ------------------ |
| GET        | /tasks     | list all tasks     |
| GET        | /tasks/:id | list specific task |
| POST       | /tasks     | create a task      |
| PATCH      | /tasks/:id | update a task      |
| DELETE     | /tasks/:id | delete a task      |

## Use case examples
#### list all tasks
```
curl -X GET -H 'Content-type: application/json' http://localhost:3000/tasks
```

#### list specific task
```
curl -X GET -H 'Content-type: application/json' http://localhost:3000/tasks/1
```

#### create a new task
```
$ curl -X POST -H 'Content-type: application/json' -d '{"name": "new task", "content": "new content"}' localhost:3000/tasks
```

#### update a task
```
curl -X PATCH -H 'Content-type: application/json' -d '{"name": "updated task", "content": "updated content"}' localhost:3000/tasks/1
```

#### delete a task
```
curl -X DELETE -H 'Content-type: application/json' localhost:3000/tasks/1
```
