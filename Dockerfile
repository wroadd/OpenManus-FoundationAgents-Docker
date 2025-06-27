FROM python:3.12-slim

RUN apt-get update && apt-get install -y git

WORKDIR /app

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN uv venv --python 3.12
RUN source .venv/bin/activate 

RUN git clone https://github.com/FoundationAgents/OpenManus.git
WORKDIR /app/OpenManus

RUN uv pip install -r requirements.txt

# RUN conda create -n open_manus_web python=3.12
# RUN conda activate open_manus_web

RUN playwright install
RUN playwright install-deps

RUN git clone https://github.com/YunQiAI/OpenManusWeb.git
WORKDIR /app/OpenManus/OpenManusWeb
RUN uv pip install --no-cache-dir -r requirements.txt

CMD ["python", "web_run.py"]
# CMD ["bash"]
