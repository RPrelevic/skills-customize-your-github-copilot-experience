# 📘 Assignment: Building REST APIs with FastAPI

## 🎯 Objective

Build a complete REST API using the FastAPI framework to create, read, update, and delete (CRUD) operations for managing a digital library system. This assignment will teach you modern web development practices, API design principles, and Python web frameworks.

## 📝 Tasks

### 🛠️	Setup FastAPI Environment

#### Description
Set up your development environment with FastAPI and all necessary dependencies. Create the basic project structure and ensure your development server is running properly.

#### Requirements
Completed setup should:

- Install FastAPI and uvicorn server using pip
- Create a virtual environment for the project
- Set up a basic FastAPI application that runs without errors
- Display a welcome message at the root endpoint (/)
- Start the development server and access it in your browser
- Include proper project structure with separate files for different components


### 🛠️	Create Book Management API

#### Description
Implement a complete CRUD API for managing books in a digital library. Each book should have an ID, title, author, publication year, and genre.

#### Requirements
Completed API should:

- Create endpoints for all CRUD operations (GET, POST, PUT, DELETE)
- Handle book data with proper data models using Pydantic
- Implement GET /books to retrieve all books
- Implement GET /books/{book_id} to retrieve a specific book
- Implement POST /books to create a new book
- Implement PUT /books/{book_id} to update an existing book
- Implement DELETE /books/{book_id} to remove a book
- Include proper HTTP status codes (200, 201, 404, etc.)
- Add input validation and error handling
- Store data in memory (no database required for this assignment)


### 🛠️	Add Search and Filter Features

#### Description
Enhance your API with advanced features including search functionality, filtering by genre or author, and pagination for large result sets.

#### Requirements
Completed features should:

- Implement GET /books/search?query=title to search books by title
- Add filtering by author: GET /books?author=author_name
- Add filtering by genre: GET /books?genre=genre_name
- Implement pagination with limit and offset parameters
- Add endpoint to get books published in a specific year range
- Include proper query parameter validation
- Return meaningful error messages for invalid requests
- Add automatic API documentation (FastAPI provides this automatically)


### 🛠️	Testing and Documentation

#### Description
Create comprehensive tests for your API endpoints and enhance the automatically generated documentation with detailed descriptions and examples.

#### Requirements
Completed testing should:

- Write unit tests for all API endpoints using pytest
- Test successful operations and error cases
- Include tests for data validation and edge cases
- Add detailed descriptions to all endpoints using docstrings
- Provide example request and response data in the documentation
- Include proper response models for consistent API responses
- Test the API using the interactive documentation (Swagger UI)
- Create a simple client script that demonstrates API usage