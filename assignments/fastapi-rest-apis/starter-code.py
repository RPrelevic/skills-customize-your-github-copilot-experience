from fastapi import FastAPI
from pydantic import BaseModel
from typing import List, Optional

# Create FastAPI instance
app = FastAPI(
    title="Digital Library API",
    description="A REST API for managing books in a digital library",
    version="1.0.0"
)

# Pydantic models for request/response data
class Book(BaseModel):
    id: int
    title: str
    author: str
    publication_year: int
    genre: str

class BookCreate(BaseModel):
    title: str
    author: str
    publication_year: int
    genre: str

class BookUpdate(BaseModel):
    title: Optional[str] = None
    author: Optional[str] = None
    publication_year: Optional[int] = None
    genre: Optional[str] = None

# In-memory storage for books (replace with database in production)
books_db: List[Book] = [
    Book(id=1, title="The Python Programming Language", author="Guido van Rossum", publication_year=1991, genre="Programming"),
    Book(id=2, title="Clean Code", author="Robert C. Martin", publication_year=2008, genre="Programming"),
    Book(id=3, title="The Pragmatic Programmer", author="Andrew Hunt", publication_year=1999, genre="Programming")
]

# Helper function to get next available ID
def get_next_id() -> int:
    if not books_db:
        return 1
    return max(book.id for book in books_db) + 1

# Root endpoint
@app.get("/")
async def root():
    """
    Welcome endpoint for the Digital Library API
    """
    return {
        "message": "Welcome to the Digital Library API!",
        "docs": "/docs",
        "total_books": len(books_db)
    }

# TODO: Implement the following endpoints:
# GET /books - Get all books
# GET /books/{book_id} - Get a specific book
# POST /books - Create a new book
# PUT /books/{book_id} - Update a book
# DELETE /books/{book_id} - Delete a book
# GET /books/search - Search books by title
# GET /books (with query parameters for filtering)

# Example endpoint implementation (students should complete the rest)
@app.get("/books", response_model=List[Book])
async def get_all_books():
    """
    Retrieve all books in the library
    """
    return books_db

# Run the server with: uvicorn main:app --reload