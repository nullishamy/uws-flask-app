FROM ghcr.io/benoitc/gunicorn:24.1.0

# Install app dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY --chown=gunicorn:gunicorn . .

# Gunicorn will run on 8000
EXPOSE 8000

CMD ["app:app", "--workers", "4", "--bind", "0.0.0.0:8000"]
