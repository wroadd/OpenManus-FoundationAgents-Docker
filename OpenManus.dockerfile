FROM python:3.12-slim

WORKDIR /app

RUN git clone https://github.com/mannaandpoem/OpenManus.git
WORKDIR /app/OpenManus

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# COPY config/config.toml config/config.toml

# EXPOSE 8000

CMD ["python", "main.py"]
