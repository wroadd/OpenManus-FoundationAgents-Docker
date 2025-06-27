FROM python:3.12-slim

RUN apt-get update && apt-get install -y git

WORKDIR /app

RUN git clone https://github.com/FoundationAgents/OpenManus.git
WORKDIR /app/OpenManus

RUN pip install --no-cache-dir -r requirements.txt

RUN conda create -n open_manus_web python=3.12
RUN conda activate open_manus_web

RUN playwright install
RUN playwright install-deps

RUN git clone https://github.com/YunQiAI/OpenManusWeb.git
WORKDIR /app/OpenManus/OpenManusWeb
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "web_run.py"]
# CMD ["bash"]
