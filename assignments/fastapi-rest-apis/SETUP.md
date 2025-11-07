# Digital Library API - FastAPI Assignment

## Setup Instructions

1. Create a virtual environment:
   ```bash
   python -m venv venv
   ```

2. Activate the virtual environment:
   - Windows: `venv\Scripts\activate`
   - macOS/Linux: `source venv/bin/activate`

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Run the development server:
   ```bash
   uvicorn starter-code:app --reload
   ```

5. Open your browser and go to:
   - API: http://127.0.0.1:8000
   - Interactive docs: http://127.0.0.1:8000/docs
   - Alternative docs: http://127.0.0.1:8000/redoc

## Project Structure

- `starter-code.py` - Main FastAPI application with basic setup
- `requirements.txt` - Python dependencies
- `README.md` - Assignment instructions (in parent directory)

## Getting Started

The starter code includes:
- Basic FastAPI setup with welcome endpoint
- Pydantic models for Book data
- Sample data with 3 books
- One example endpoint (GET /books)

Your task is to complete the remaining CRUD operations and additional features as described in the assignment README.

## Testing Your API

Use the interactive documentation at `/docs` to test your endpoints, or use tools like:
- curl
- Postman
- Python requests library

## Need Help?

- FastAPI documentation: https://fastapi.tiangolo.com/
- Pydantic documentation: https://docs.pydantic.dev/
- Uvicorn documentation: https://www.uvicorn.org/