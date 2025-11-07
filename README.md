# ai-ui

A simple, web-based ChatGPT-style frontend for Azure OpenAI services.

## Features

- Clean, modern chat interface
- Real-time conversation with Azure OpenAI
- Configurable via environment variables
- Lightweight Docker container using nginx
- Automatic builds and publishing to GitHub Container Registry

## Docker Image

The Docker image is automatically built and published to GitHub Container Registry as `ghcr.io/mmxca/ai-ui:latest`.

## Configuration

The application is configured using environment variables:

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `OPENAI_URL` | Azure OpenAI endpoint URL | Yes | - |
| `OPENAI_TOKEN` | Azure OpenAI API key | Yes | - |
| `OPENAI_MODEL` | Model name to use | No | `gpt-3.5-turbo` |
| `PORT` | Port for the web server to listen on | No | `8080` |

## Usage

### Running with Docker

```bash
docker run -d \
  -p 8080:8080 \
  -e OPENAI_URL="https://your-instance.openai.azure.com/openai/deployments/your-deployment/chat/completions?api-version=2024-02-15-preview" \
  -e OPENAI_TOKEN="your-api-key" \
  -e OPENAI_MODEL="gpt-3.5-turbo" \
  -e PORT=8080 \
  ghcr.io/mmxca/ai-ui:latest
```

### Running with Docker Compose

Create a `docker-compose.yml` file:

```yaml
version: '3.8'

services:
  ai-ui:
    image: ghcr.io/mmxca/ai-ui:latest
    ports:
      - "8080:8080"
    environment:
      - OPENAI_URL=https://your-instance.openai.azure.com/openai/deployments/your-deployment/chat/completions?api-version=2024-02-15-preview
      - OPENAI_TOKEN=your-api-key
      - OPENAI_MODEL=gpt-3.5-turbo
      - PORT=8080
```

Then run:

```bash
docker-compose up -d
```

### Building Locally

```bash
docker build -t ai-ui .
docker run -d -p 8080:8080 \
  -e OPENAI_URL="your-url" \
  -e OPENAI_TOKEN="your-token" \
  ai-ui
```

## Access

Once running, open your browser and navigate to:
```
http://localhost:8080
```

## Azure OpenAI Setup

1. Create an Azure OpenAI resource in the Azure Portal
2. Deploy a model (e.g., gpt-3.5-turbo or gpt-4)
3. Get your endpoint URL and API key from the Azure Portal
4. Format your endpoint URL as: `https://{your-resource}.openai.azure.com/openai/deployments/{deployment-name}/chat/completions?api-version=2024-02-15-preview`

## Development

The project consists of:
- `index.html` - Single-page application with chat interface
- `nginx.conf.template` - nginx configuration template
- `Dockerfile` - Multi-stage Docker build
- `.github/workflows/docker-build.yml` - CI/CD pipeline

## License

MIT