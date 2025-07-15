# Run HunyuanVideo on Novita AI
## What is HunyuanVideo
A novel open-source video foundation model that exhibits performance in video generation that is comparable to, if not superior to, leading closed-source models. In order to train HunyuanVideo model, we adopt several key technologies for model learning, including data curation, image-video joint model training, and an efficient infrastructure designed to facilitate large-scale model training and inference. Additionally, through an effective strategy for scaling model architecture and dataset, we successfully trained a video generative model with over 13 billion parameters, making it the largest among all open-source models.
## HunyuanVideo Overall Architecture
HunyuanVideo is trained on a spatial-temporally compressed latent space, which is compressed through a Causal 3D VAE. Text prompts are encoded using a large language model, and used as the conditions. Taking Gaussian noise and the conditions as input, our generative model produces an output latent, which is then decoded to images or videos through the 3D VAE decoder.
## Features
### Unified Image and Video Generative Architecture
HunyuanVideo introduces the Transformer design and employs a Full Attention mechanism for unified image and video generation. Specifically, we use a "Dual-stream to Single-stream" hybrid model design for video generation. In the dual-stream phase, video and text tokens are processed independently through multiple Transformer blocks, enabling each modality to learn its own appropriate modulation mechanisms without interference. In the single-stream phase, we concatenate the video and text tokens and feed them into subsequent Transformer blocks for effective multimodal information fusion. This design captures complex interactions between visual and semantic information, enhancing overall model performance.
### MLLM Text Encoder  MLLM
Some previous text-to-video models typically use pre-trained CLIP and T5-XXL as text encoders where CLIP uses Transformer Encoder and T5 uses an Encoder-Decoder structure. In contrast, we utilize a pre-trained Multimodal Large Language Model (MLLM) with a Decoder-Only structure as our text encoder, which has the following advantages: 
(i) Compared with T5, MLLM after visual instruction finetuning has better image-text alignment in the feature space, which alleviates the difficulty of the instruction following in diffusion models; 
(ii) Compared with CLIP, MLLM has demonstrated superior ability in image detail description and complex reasoning; 
(iii) MLLM can play as a zero-shot learner by following system instructions prepended to user prompts, helping text features pay more attention to key information. 
In addition, MLLM is based on causal attention while T5-XXL utilizes bidirectional attention that produces better text guidance for diffusion models. Therefore, we introduce an extra bidirectional token refiner to enhance text features.
### 3D VAE
HunyuanVideo trains a 3D VAE with CausalConv3D to compress pixel-space videos and images into a compact latent space. We set the compression ratios of video length, space, and channel to 4, 8, and 16 respectively. This can significantly reduce the number of tokens for the subsequent diffusion transformer model, allowing us to train videos at the original resolution and frame rate.
## Run HunyuanVideo on Novita AI
Step 1: Console Entry  
Launch the GPU interface and select Get Started to access deployment management.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/6162dcd7-79a0-4677-d9f7-bee78194d100/public)  

Step 2: Package Selection  
Locate HunyuanVideo in the template repository and begin installation sequence.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/f75ad6c2-4382-4b8e-b249-719136832200/public)  
Step 3: Infrastructure Setup  
Configure computing parameters including memory allocation, storage requirements, and network settings. Select Deploy to implement.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/e60769af-adbf-4a0e-7c20-f3c7e69ed900/public)  
Step 4: Review and Create  
Double-check your configuration details and cost summary. When satisfied, click Deploy to start the creation process.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/05c582fc-8680-4466-c6f6-4cff8da18c00/public)  
Step 5: Wait for Creation  
After initiating deployment, the system will automatically redirect you to the instance management page. Your instance will be created in the background.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/dbe97358-89d4-4b8d-45d0-bd28539e2500/public)  
Step 6: Monitor Download Progress  
Track the image download progress in real-time. Your instance status will change from Pulling to Running once deployment is complete. You can view detailed progress by clicking the arrow icon next to your instance name.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/8fc92cff-9de7-4615-a64a-30928c8f5200/public)  
Step 7: Verify Instance Status  
Click the Logs button to view instance logs and confirm that the Comfyui service has started properly.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/7955ab29-e812-4ab8-8a34-08884ebb3100/public)  
Step 8: Environment Access  
Launch development space through Connect interface, then initialize Start Web Terminal.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/ebeb7c75-3599-4565-3ec8-f6682a3cc400/public)  
Step 9: Development Ready  
Your HunyuanVideo environment is prepared for advanced development tasks. Note: Suspend instance when inactive to preserve computing resources.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/057b2121-9fac-47a6-cfca-eaa026d7de00/public)  
## How to use
### Demo
Step 1: Click on 'connection to HTTP server[Port 8188]' in the Connect interface,and you will enter the corresponding service
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/4911e916-e194-4b4c-7e99-8358529f2900/public)  
Step 2: Select the provided basic workflow for testing
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/33894eb6-ae09-41a1-a54f-56816f7f7200/public)  
### Advanced Usage
You can learn detailed usage instructions in the [official documentation of Comfyui](https://docs.comfy.org/)