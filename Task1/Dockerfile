# Use a minimal Python image
FROM python:3.11-slim

# Create non-root user
RUN useradd -m appuser

# Set working directory
WORKDIR /app

# Copy source code
COPY app.py .

# Install Flask
RUN pip install flask

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]
