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
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/1b50b81b-9564-4ef9-868c-203225349e00/public)  
Step 3: Infrastructure Setup  
Configure computing parameters including memory allocation, storage requirements, and network settings. Select Deploy to implement.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/c9f01150-6ee3-4243-e4ff-67d04333ce00/public)  
Step 4: Review and Create  
Double-check your configuration details and cost summary. When satisfied, click Deploy to start the creation process.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/9a6191aa-1e42-434b-9aa8-017a8bd42300/public)  
Step 5: Wait for Creation  
After initiating deployment, the system will automatically redirect you to the instance management page. Your instance will be created in the background.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/0c3b4fe3-76bf-4176-0181-e6d5dd215300/public)  
Step 6: Monitor Download Progress  
Track the image download progress in real-time. Your instance status will change from Pulling to Running once deployment is complete. You can view detailed progress by clicking the arrow icon next to your instance name.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/5b3a38f4-a3fa-4105-c919-d0625d8f7b00/public)  
Step 7: Verify Instance Status  
Click the Logs button to view instance logs and confirm that the Comfyui service has started properly.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/661cea40-73d7-4a82-e911-c6532a059c00/public)  
Step 8: Environment Access  
Launch development space through Connect interface, then initialize Start Web Terminal.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/bdc97306-9c41-4c2c-00e5-938fd6bd2d00/public)  
Step 9: Development Ready  
Your InvokeAI environment is prepared for advanced development tasks. Note: Suspend instance when inactive to preserve computing resources.  
![enter image description here](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/ea656f9d-0f82-4f68-63df-fce9a3f1a900/public)  
## How to use
### Demo
Step 1: Click on 'connection to HTTP server[Port 9090]' in the Connect interface,and you will enter the corresponding service  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/d5fea4e0-4c0d-4da7-13db-85900612c100/public)  
Step 2: Entering the service interface, you can first browse the quick launch model bundle package in the model management interface and select an installation (various functions require model files as the basis, and this template does not pre fabricate the initial model)  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/d8d408c2-7969-4747-ee45-a74974202900/public)  
Step 3: After selecting an installation package, its progress will be displayed in the install queue  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/bb41a040-ff76-453e-dfa5-5dd053d9e000/public)  
Step 4: Some downloads require the HuggingFace URL token, which can be set in the HuggingFace module  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/6669f2b4-1639-4840-3346-62d374f36c00/public)  
Step 5: Afterwards, in the generation interface, you can enter text and select a Prompt Template, then click Invoke to generate an image  
![](https://imagedelivery.net/GFvwKVAtCfKnMHdvDobR4A/0569b9a6-c354-4530-7c63-1e5982a69b00/public)  
### Advanced Usage
You can learn more usage methods in the [official documentation of Invoke AI](https://invoke-ai.github.io/InvokeAI/)  