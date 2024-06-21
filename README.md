# Task-Management-API

This project is a collaborative task management tool built with Django and Docker. The tool allows users to create and manage projects and tasks. It includes REST API endpoints for creating, reading, updating, and deleting projects and tasks.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## Features

- Create, read, update, and delete projects
- Create, read, update, and delete tasks associated with projects
- REST API for easy integration

## Technologies Used

- Django
- Django REST framework
- Docker
- PostgreSQL

## Setup and Installation

### Prerequisites

- Docker
- Docker Compose

### Installation Steps

1. **Clone the repository:**

    ```bash
    git clone https://github.com/FatmehS/Task-Management-API.git
    cd CollaborativeTaskTool
    ```

2. **Create a virtual environment and activate it:**

    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```

3. **Install dependencies:**

    ```bash
    pip install -r requirements.txt
    ```

4. **Build and start the Docker containers:**

    ```bash
    docker-compose up --build
    ```

5. **Apply the migrations:**

    ```bash
    docker-compose exec web bash
    python manage.py makemigrations tasks
    python manage.py migrate
    ```

## Usage

- Access the application at `http://localhost:8000`.

## API Endpoints

### Projects

- **List all projects:**
  - `GET /api/projects/`

- **Create a new project:**
  - `POST /api/projects/`
  - Request body:
    ```json
    {
      "name": "Project Name",
      "description": "Project Description"
    }
    ```

- **Retrieve a specific project:**
  - `GET /api/projects/{id}/`

- **Update a project:**
  - `PUT /api/projects/{id}/`
  - Request body:
    ```json
    {
      "name": "Updated Project Name",
      "description": "Updated Project Description"
    }
    ```

- **Delete a project:**
  - `DELETE /api/projects/{id}/`

### Tasks

- **List all tasks:**
  - `GET /api/tasks/`

- **Create a new task:**
  - `POST /api/tasks/`
  - Request body:
    ```json
    {
      "project": 1,  // Project ID
      "name": "Task Name",
      "due_date": "2024-01-01",
      "completed": false
    }
    ```

- **Retrieve a specific task:**
  - `GET /api/tasks/{id}/`

- **Update a task:**
  - `PUT /api/tasks/{id}/`
  - Request body:
    ```json
    {
      "project": 1,  // Project ID
      "name": "Updated Task Name",
      "due_date": "2024-01-02",
      "completed": true
    }
    ```

- **Delete a task:**
  - `DELETE /api/tasks/{id}/`

## Troubleshooting

### Common Issues

- **Database Connection Errors:**
  - Ensure that the PostgreSQL container is running.
  - Verify the database configuration in `backend/settings.py`.

- **Docker Build Failures:**
  - Check the Dockerfile and ensure all dependencies are correctly specified.
  - Make sure Docker is properly installed and running on your system.

### Resolving Merge Conflicts

1. **Pull the latest changes:**

    ```bash
    git pull origin main --allow-unrelated-histories
    ```

2. **Resolve any merge conflicts:**
   - Open the conflicted files and manually resolve the conflicts.
   - After resolving, stage the changes:

    ```bash
    git add .
    ```

3. **Commit the resolved changes:**

    ```bash
    git commit -m "Resolved merge conflicts"
    ```

4. **Push the changes to GitHub:**

    ```bash
    git push -u origin main
    ```

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

