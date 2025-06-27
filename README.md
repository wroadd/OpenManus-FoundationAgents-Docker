# OpenManus-FoundationAgents-Docker-WEB

updated [Docker](https://www.docker.com/) image for [OpenManus](https://github.com/mannaandpoem/OpenManus) and the [OpenManusWeb](https://github.com/YunQiAI/OpenManusWeb)

If you want to play with OpenManus from a web browser in a safe environment, you may run it in a Docker container using the Dockerfile from this repository.
The repository uses the new location of OpenManus

## Instructions ##

In order to build and run Docker images you must have Docker installed - for most people, installing the [Docker Desktop](https://www.docker.com/products/docker-desktop/) will be the best way to do so.

Once done, download this repository and unpack it into a folder of your choice (e.g., `OpenManus`).

Now, open file `./config/config.toml` with your favourite editor and enter your configuration details. If you plan to use [Ollama](https://ollama.com/) with a locally installed LLM (e.g., `qwen2.5-coder:14b`), the first lines of your configuration may look as follows:

```
# Global LLM configuration
[llm]
model = "qwen2.5-coder:14b"
base_url = "http://host.docker.internal:11434/v1"
api_key = "ollama"
max_tokens = 4096
temperature = 0.0
```

Save your changes, then open your terminal, navigate to your OpenManus folder and run the following command:

```
docker compose up
```

Docker will now download all required files (which may take a while, when run for the first time) and finally start the freshly built image.
The docker container expose the web server port at 8000.

## License ##

[MIT License](LICENSE.md)
