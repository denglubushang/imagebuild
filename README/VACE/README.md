# Run Wan2.1-VACE-1.3B on Novita AI
## What is Wan2.1-VACE-1.3B
a comprehensive and open suite of video foundation models that pushes the boundaries of video generation.
## Features
### Sota Performance
Wan2.1 consistently outperforms existing open-source models and state-of-the-art commercial solutions across multiple benchmarks.
### Supports Consumer-grade GPUs
The T2V-1.3B model requires only 8.19 GB VRAM, making it compatible with almost all consumer-grade GPUs. It can generate a 5-second 480P video on an RTX 4090 in about 4 minutes (without optimization techniques like quantization). Its performance is even comparable to some closed-source models.
### Multiple Tasks
Wan2.1 excels in Text-to-Video, Image-to-Video, Video Editing, Text-to-Image, and Video-to-Audio, advancing the field of video generation.
### Visual Text Generation
Wan2.1 is the first video model capable of generating both Chinese and English text, featuring robust text generation that enhances its practical applications.
### Powerful Video VAE
Wan-VAE delivers exceptional efficiency and performance, encoding and decoding 1080P videos of any length while preserving temporal information, making it an ideal foundation for video and image generation.
## Run Wan2.1-VACE-1.3B on NovitaAI
Step 1: Console Entry  
Launch the GPU interface and select Get Started to access deployment management.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/6162dcd7-79a0-4677-d9f7-bee78194d100/public)  
Step 2: Package Selection  
Locate Wan2.1-vace-1.3B in the template repository and begin installation sequence.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/6cf9bdc4-55d8-48f7-b334-499205ca4600/public)  
Step 3:Infrastructure Setup  
Configure computing parameters including memory allocation, storage requirements, and network settings. Select Deploy to implement.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/98da0a59-ab27-4fef-5db0-65ec1b142f00/public)  
Step 4: Review and Create  
Double-check your configuration details and cost summary. When satisfied, click Deploy to start the creation process.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/7e544ac9-6f0f-444d-b323-5e71bfc0a200/public)  
Step 5: Wait for Creation  
After initiating deployment, the system will automatically redirect you to the instance management page. Your instance will be created in the background.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/105259c3-c302-4918-8c6c-308ac1d4d700/public)  
Step 6: Monitor Download Progress  
Track the image download progress in real-time. Your instance status will change from Pulling to Running once deployment is complete. You can view detailed progress by clicking the arrow icon next to your instance name.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/a7ab8e5d-8c23-4cab-1ae7-e6bbfef9fb00/public)  
Step 7: Verify Instance Status  
Click the Logs button to view instance logs and confirm that the Comfyui service has started properly.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/d3c2a679-9eb1-4389-ab20-f3fe82766600/public)  
Step 8: Environment Access  
Launch development space through Connect interface, then initialize Start Web Terminal.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/841708e0-3b5d-41ab-0c49-392808a8b000/public)  
Step 9: Development Ready  
Your Wan2.1-VACE-1.3B environment is prepared for advanced development tasks. Note: Suspend instance when inactive to preserve computing resources.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/17facaca-aa02-4ad5-da83-8aa16d244e00/public)  
## How to use
### Demo
Step 1: Click on 'connection to HTTP server[Port 8188]' in the Connect interface,and you will enter the corresponding service
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/e5998040-499c-421e-2a95-3ad52939df00/public)  
Step 2: Select the provided basic workflow for testing
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/dd83fbc6-0f4e-44d8-8ee4-dad534886e00/public)
### Advanced Usage
You can learn detailed usage instructions in the [official documentation of Comfyui](https://docs.comfy.org/)  
