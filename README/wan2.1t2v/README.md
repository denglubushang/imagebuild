# Run Wan2.1-1.3B-t2v on Novita AI
## What is Wan2.1-1.3B-t2v
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
## Run Wan2.1-1.3B-t2v on NovitaAI
Step 1: Console Entry  
Launch the GPU interface and select Get Started to access deployment management.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/6162dcd7-79a0-4677-d9f7-bee78194d100/public)  

Step 2: Package Selection  
Locate Wan2.1-1.3B-t2v in the template repository and begin installation sequence.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/2ebf98d8-9d46-40bc-26cd-b4e9dbe71b00/public)  
Step 3: Infrastructure Setup  
Configure computing parameters including memory allocation, storage requirements, and network settings. Select Deploy to implement.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/75f5709c-5ae8-4dce-2ce5-91ff285fcc00/public)  
Step 4: Review and Create  
Double-check your configuration details and cost summary. When satisfied, click Deploy to start the creation process.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/7632a683-e141-40e4-4e60-ac57fcfca700/public)  
Step 5: Wait for Creation  
After initiating deployment, the system will automatically redirect you to the instance management page. Your instance will be created in the background.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/aa3c1aa6-b88c-4a7d-7412-7e743a541500/public)  
Step 6: Monitor Download Progress  
Track the image download progress in real-time. Your instance status will change from Pulling to Running once deployment is complete. You can view detailed progress by clicking the arrow icon next to your instance name.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/79a3afac-be00-4084-a851-e15e48a89300/public)  
Step 7: Verify Instance Status  
Click the Logs button to view instance logs and confirm that the Comfyui service has started properly.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/7e4a9305-0809-4527-9aa7-2d5a1d493b00/public)  
Step 8: Environment Access  
Launch development space through Connect interface, then initialize Start Web Terminal.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/248f8259-135e-404b-f133-6e5cfbb82000/public)  
Step 9: Development Ready  
Your Wan2.1-1.3B-t2v environment is prepared for advanced development tasks. Note: Suspend instance when inactive to preserve computing resources.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/3abfa0f7-687d-4cfa-84aa-5778bc798a00/public)  
## How to use
### Demo
Step 1: Click on 'connection to HTTP server[Port 8188]' in the Connect interface,and you will enter the corresponding service
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/bc288b38-ebe7-4a70-ab07-227bb5fbd500/public)  
Step 2: Select the provided basic workflow for testing
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/541db94b-ccb5-4ad7-d0a2-f02eda705f00/public)  
### Advanced Usage
You can learn detailed usage instructions in the [official documentation of Comfyui](https://docs.comfy.org/)  