# Run InvokeAI on Novita AI
## What is InvokeAI
Invoke is a leading creative engine built to empower professionals and enthusiasts alike. Generate and create stunning visual media using the latest AI-driven technologies. Invoke offers an industry leading web-based UI, and serves as the foundation for multiple commercial products.
## Features
### Web Server & UI
Invoke runs a locally hosted web server & React UI with industry-leading user experience.
### Unified Canvas
The Unified Canvas is a fully integrated canvas implementation with support for all core generation capabilities, in/out-painting, brush tools, and more. This creative tool unlocks the capability for artists to create with AI as a creative collaborator, and can be used to augment AI-generated imagery, sketches, photography, renders, and more.
### Workflows & Nodes
Invoke offers a fully featured workflow management solution, enabling users to combine the power of node-based workflows with the easy of a UI. This allows for customizable generation pipelines to be developed and shared by users looking to create specific workflows to support their production use-cases.
### Board & Gallery Management
Invoke features an organized gallery system for easily storing, accessing, and remixing your content in the Invoke workspace. Images can be dragged/dropped onto any Image-base UI element in the application, and rich metadata within the Image allows for easy recall of key prompts or settings used in your workflow.
### Other features
- Support for both ckpt and diffusers models
- SD1.5, SD2.0, SDXL, and FLUX support
- Upscaling Tools
- Embedding Manager & Support
- Model Manager & Support
- Workflow creation & management
- Node-Based Architecture
## Run InvokeAI on Novita AI
Step 1: Console Entry  
Launch the GPU interface and select Get Started to access deployment management.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/6162dcd7-79a0-4677-d9f7-bee78194d100/public)  

Step 2: Package Selection  
Locate InvokeAI in the template repository and begin installation sequence.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/f7d18fb0-51cd-4cfa-0c8d-2df614aa8500/public)  
Step 3: Infrastructure Setup  
Configure computing parameters including memory allocation, storage requirements, and network settings. Select Deploy to implement.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/8c194338-4f88-4105-9971-67f96bbdc400/public)  
Step 4: Review and Create  
Double-check your configuration details and cost summary. When satisfied, click Deploy to start the creation process.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/84d3ff93-0164-4f92-ac8a-b3aa7c632800/public)  
Step 5: Wait for Creation  
After initiating deployment, the system will automatically redirect you to the instance management page. Your instance will be created in the background.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/823b288d-4b82-4aa7-ebfc-db35dc6d9000/public)  
Step 6: Monitor Download Progress  
Track the image download progress in real-time. Your instance status will change from Pulling to Running once deployment is complete. You can view detailed progress by clicking the arrow icon next to your instance name.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/95c820af-e941-41d6-6ea1-60211889d800/public)  
Step 7: Verify Instance Status  
Click the Logs button to view instance logs and confirm that the Comfyui service has started properly.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/3832e032-c72f-497d-7cbe-a37a4751b000/public)  
Step 8: Environment Access  
Launch development space through Connect interface, then initialize Start Web Terminal.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/62a524e2-c748-4c49-26aa-5e9de734d000/public)  
Step 9: Development Ready  
Your InvokeAI environment is prepared for advanced development tasks. Note: Suspend instance when inactive to preserve computing resources.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/0d369df0-8547-4600-970b-3c8da0f2a600/public)  
## How to use
### Demo
Step 1: Click on 'connection to HTTP server[Port 9090]' in the Connect interface,and you will enter the corresponding service  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/185ea096-e7fd-4fb4-6623-b658478e9c00/public)  
Step 2: Entering the service interface, you can first browse the quick launch model bundle package in the model management interface and select an installation (various functions require model files as the basis, and this template does not pre fabricate the initial model)  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/d8d408c2-7969-4747-ee45-a74974202900/public)  
Step 3: After selecting an installation package, its progress will be displayed in the install queue  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/bb41a040-ff76-453e-dfa5-5dd053d9e000/public)  
Step 4: Some downloads require the HuggingFace URL token, which can be set in the HuggingFace module  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/6669f2b4-1639-4840-3346-62d374f36c00/public)  
Step 5: Afterwards, in the generation interface, you can enter text and select a Prompt Template, then click Invoke to generate an image  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/0569b9a6-c354-4530-7c63-1e5982a69b00/public)  
### Advanced Usage
You can learn more usage methods in the [official documentation of InvokeAI](https://invoke-ai.github.io/InvokeAI/)  