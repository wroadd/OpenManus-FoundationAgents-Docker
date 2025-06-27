FROM python:3.12-slim

RUN apt-get update && apt-get install -y git wget

WORKDIR /app
RUN wget -q -O anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2025.06-0-Linux-x86_64.sh
RUN bash anaconda.sh -b
RUN source ~/anaconda3/bin/activate
RUN conda init
RUN source ~/.bashrc

RUN git clone https://github.com/FoundationAgents/OpenManus.git
WORKDIR /app/OpenManus

RUN pip install -r requirements.txt

RUN conda create -n open_manus_web python=3.12
RUN conda activate open_manus_web

RUN playwright install
RUN playwright install-deps

RUN git clone https://github.com/YunQiAI/OpenManusWeb.git
WORKDIR /app/OpenManus/OpenManusWeb
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "web_run.py"]
# CMD ["bash"]
