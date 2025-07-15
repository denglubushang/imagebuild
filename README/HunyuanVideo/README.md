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
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/78b7e094-7f57-4424-3478-2bb645d3d500/public)  
Step 3: Infrastructure Setup  
Configure computing parameters including memory allocation, storage requirements, and network settings. Select Deploy to implement.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/120ac44e-039b-4071-14a6-ee6bf7132400/public)  
Step 4: Review and Create  
Double-check your configuration details and cost summary. When satisfied, click Deploy to start the creation process.
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/f5be2e66-420e-4d1d-a1b4-5309edb8dd00/public)  
Step 5: Wait for Creation  
After initiating deployment, the system will automatically redirect you to the instance management page. Your instance will be created in the background.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/ff771c16-1c95-4de4-bf61-fe765635f500/public)  
Step 6: Monitor Download Progress  
Track the image download progress in real-time. Your instance status will change from Pulling to Running once deployment is complete. You can view detailed progress by clicking the arrow icon next to your instance name.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/0c77a1e6-113b-4f6a-c743-03e5a855ed00/public)  
Step 7: Verify Instance Status  
Click the Logs button to view instance logs and confirm that the Comfyui service has started properly.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/60c3c84e-7c82-4141-d651-81ab37729b00/public)  
Step 8: Environment Access  
Launch development space through Connect interface, then initialize Start Web Terminal.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/8a29c4c6-4cbf-475f-bfd6-8060b18dfe00/public)  
Step 9: Development Ready  
Your HunyuanVideo environment is prepared for advanced development tasks. Note: Suspend instance when inactive to preserve computing resources.
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/9a976cb8-41e4-44e2-1989-dca45b61ff00/public)  
## How to use
### Demo
Step 1: Click on 'connection to HTTP server[Port 8188]' in the Connect interface,and you will enter the corresponding service
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/1ed50c15-edd9-43e9-f765-11fd6d86bb00/public)  
Step 2: Select the provided basic workflow for testing
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/33894eb6-ae09-41a1-a54f-56816f7f7200/public)  
### Advanced Usage
You can learn detailed usage instructions in the [official documentation of Comfyui](https://docs.comfy.org/)  