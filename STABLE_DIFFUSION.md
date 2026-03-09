# Stable Diffusion WebUI (Automatic1111) - Local Docker Setup on NixOS

Personal reproducible setup using the ai-dock/stable-diffusion-webui image with NVIDIA GPU passthrough via CDI.

## Requirements

- NixOS with Docker enabled
- NVIDIA drivers installed and working (`nvidia-smi` shows your GPU)
- `hardware.nvidia-container-toolkit.enable = true;` in your configuration.nix
- Directories created on host:
  - `~/stable-diffusion-models/Stable-diffusion/`     → for checkpoints (.safetensors, .ckpt)
  - `~/stable-diffusion-output/`                      → generated images
  - `~/stable-diffusion-config/`                      → config / settings persistence

## One-line start command

```bash
docker run -d --name a1111 \
  --device nvidia.com/gpu=all \
  -p 7861:7860 \
  -v ~/stable-diffusion-models:/workspace/stable-diffusion-webui/models \
  -v ~/stable-diffusion-output:/workspace/stable-diffusion-webui/outputs \
  -v ~/stable-diffusion-config:/workspace/stable-diffusion-webui/config \
  -e WEBUI_ARGS="--listen --api --xformers --opt-sdp-attention --enable-insecure-extension-access" \
  -e WEB_ENABLE_AUTH=false \
  ghcr.io/ai-dock/stable-diffusion-webui:latest-cuda
```

# Access
Open in browser:
http://localhost:7861

No login required (WEB_ENABLE_AUTH=false)

# Add new checkpoint
```
cd ~/stable-diffusion-models/Stable-diffusion
wget https://civitai.com/api/download/models/[modelid] -O [desired_name].safetensors
```
To copy paste
```
cd ~/stable-diffusion-models/Stable-diffusion
wget https://civitai.com/api/download/models/[modelid] -O [desired_name].safetensors
```

# Quick Commands
### Start / restart
docker start a1111    # or just run the docker run command above again (it will recreate)

### Stop
docker stop a1111

### Remove (if you want to start fresh)
docker rm a1111

### View logs (very useful on first start)
docker logs -f a1111

### Enter container shell
docker exec -it a1111 bash

### Pull latest image version
docker pull ghcr.io/ai-dock/stable-diffusion-webui:latest-cuda

# Swarm UI

## setup
mkdir -p ~/stable-diffusion/swarmui
cd ~/stable-diffusion/swarmui
git clone https://github.com/mcmonkeyprojects/SwarmUI.git .
./launchtools/launch-standard-docker.sh
docker run -d --name swarmui \
  --runtime runc \
  --device nvidia.com/gpu=all \
  -p 7801:7801 \
  -v ~/stable-diffusion/swarmui:/app \
  -v ~/stable-diffusion-models:/app/Models \
  -v ~/stable-diffusion-output:/app/Models/Output \
  -v ~/stable-diffusion/swarmui-data:/app/Data \
  -v ~/stable-diffusion/swarmui-dlbackend:/app/dlbackend \
  -v ~/stable-diffusion/swarmui-custom_nodes:/app/dlbackend/comfy/ComfyUI/custom_nodes \
  -v ~/stable-diffusion/swarmui-models-comfy:/app/dlbackend/comfy/ComfyUI/models \
  swarmui