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
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/82375faf-0f88-4b45-7080-78a5a058d900/public)  
Step 3: Infrastructure Setup  
Configure computing parameters including memory allocation, storage requirements, and network settings. Select Deploy to implement.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/47e50a77-acf9-4f94-46bf-a98acfc0ca00/public)  
Step 4: Review and Create  
Double-check your configuration details and cost summary. When satisfied, click Deploy to start the creation process.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/4889351c-26e5-4954-4830-46e988313100/public)  
Step 5: Wait for Creation  
After initiating deployment, the system will automatically redirect you to the instance management page. Your instance will be created in the background.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/56ad9181-82d4-436b-ef93-0609e6036200/public)  
Step 6: Monitor Download Progress  
Track the image download progress in real-time. Your instance status will change from Pulling to Running once deployment is complete. You can view detailed progress by clicking the arrow icon next to your instance name.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/4a1331f7-5cfe-41c6-0803-036d2ebd1c00/public)  
Step 7: Verify Instance Status  
Click the Logs button to view instance logs and confirm that the Comfyui service has started properly.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/d1d776b0-9b1d-4de0-362b-19a6c60a7200/public)  
Step 8: Environment Access  
Launch development space through Connect interface, then initialize Start Web Terminal.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/aeaffdf9-186b-48e8-20cf-3549d2ac4300/public)  
Step 9: Development Ready  
Your Wan2.1-1.3B-t2v environment is prepared for advanced development tasks. Note: Suspend instance when inactive to preserve computing resources.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/f7846e7c-afeb-4942-0b16-513011c4d000/public)  
## How to use
### Demo
Step 1: Click on 'connection to HTTP server[Port 8188]' in the Connect interface,and you will enter the corresponding service
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/da0134de-bdf2-4b18-458f-689ea010f600/public)  
Step 2: Select the provided basic workflow for testing
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/541db94b-ccb5-4ad7-d0a2-f02eda705f00/public)  
### Advanced Usage
You can learn detailed usage instructions in the [official documentation of Comfyui](https://docs.comfy.org/)  