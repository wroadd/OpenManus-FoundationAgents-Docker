# OpenManus-Docker

just a simple [Docker](https://www.docker.com/) image for [OpenManus](https://github.com/mannaandpoem/OpenManus)

If you want to play with OpenManus in a safe environment, you may run it in a Docker container using the Dockerfile from this repository.

## Instructions ##

In order to build and run Docker images you must have Docker installed - for most people, installing the [Docker Desktop](https://www.docker.com/products/docker-desktop/) will be the best way to do so.

Once done, download this repository and unpack it into a folder of your choice (e.g., `OpenManus`).

Now, open file `./config/config.toml` with your favourite editor and enter your configuration details. If you plan to use [Ollama](https://ollama.com/) with a locally installed LLM (e.g., the brand new `gemma3:12b`), the first lines of your configuration may look as follows:

```
# Global LLM configuration
[llm]
model = "gemma3:12b"
base_url = "http://127.0.0.1:11434/v1"
api_key = "ollama"
max_tokens = 4096
temperature = 0.0
```

Save your changes, then open your terminal, navigate to your OpenManus folder and run the following command:

```
docker compose up
```

Docker will now download all required files (which may take a while, when run for the first time) and finally start the freshly built image.

Since OpenManus requires some input from the command line, you should now switch to the "Docker Desktop", select the OpenManus container (named "openmanus-1") and navigate to the "TTY". Here, you may now enter your prompt and watch OpenManus working.

## License ##

[MIT License](LICENSE.md)
