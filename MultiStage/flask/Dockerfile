# ---------- builder stage ----------
FROM python:3.13-slim AS builder

WORKDIR /app

COPY requirements.txt .

# Create a Python3 custom-named virtual environment called 'pyvenv'
RUN python -m venv /pyvenv \
    && /pyvenv/bin/pip install --upgrade pip \
    && /pyvenv/bin/pip install --no-cache-dir -r requirements.txt

# ---------- runtime stage ----------
FROM python:3.13-slim

WORKDIR /app

# Copy the virtual environment from the builder
COPY --from=builder /pyvenv /usr/local/pyvenv

# Copy app source code
COPY app.py .
COPY static ./static

# Ensure the virtual environment is first in PATH
ENV PATH="/usr/local/pyvenv/bin:$PATH"

EXPOSE 5000

CMD ["python", "app.py"]