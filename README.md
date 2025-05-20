# Grouped-random-parameters-Poisson-Lindley-model-with-spatial-effects
This is the WinBUGS codes for AMAR paper: https://doi.org/10.1016/j.amar.2025.100387. It includes codes for running Grouped Random Parameters Poisson-Lindley model with spatial effects and other baseline models (e.g., Grouped Random Parameters Poisson-Lindley model).


## 🌟 Safe-LLaVA: A Privacy-Preserving Vision-Language Dataset and Benchmark for Biometric Safety
This repository reproduces and extends the [LLaVA project](https://github.com/haotian-liu/LLaVA) by systematically removing biometric information (e.g., gender, race, age) from the training data.
We introduce Safe-LLaVA, a privacy-conscious version of LLaVA, and propose a new evaluation protocol called PRISM (Privacy-aware Evaluation of Responses in Sensitive Modalities).

For more details on environment setup and advanced usage, please refer to the original [LLaVA GitHub page](https://github.com/haotian-liu/LLaVA).

### 🚀 Getting Started
#### Clone the repository
```bash
git clone https://github.com/Kimyounggun99/Safe-LLaVA.git
cd Safe-LLaVA
```

Setup environment
Follow the instructions below to set up the environment:
```bash
conda create -n safe-llava python=3.10 -y
conda activate safe-llava
pip install --upgrade pip
pip install -e .
pip install -e ".[train]"
pip install flash-attn --no-build-isolation
```
### 📂 Data Preparation
#### 1. Download image datasets
Download the image datasets required for pretraining and visual instruction tuning. 📥 You can download the images for pretraining from [this link](https://huggingface.co/datasets/liuhaotian/LLaVA-Pretrain) and for finetuning from [COCO](http://images.cocodataset.org/zips/train2017.zip), [GQA](https://downloads.cs.stanford.edu/nlp/data/gqa/images.zip), [OCR-VQA](https://drive.google.com/drive/folders/1_GYPY5UkUy7HIcR0zq3ZCFgeZN7BAfm_?usp=sharing), [TextVQA](https://dl.fbaipublicfiles.com/textvqa/images/train_val_images.zip), and [VisualGenome](https://cs.stanford.edu/people/rak248/VG_100K_2/images.zip).
```bash
- BLIP_LAION_CC_SBU_558K (images)
- COCO (train2017)
- GQA (images)
- OCR-VQA (images)
- TextVQA (train_images)
- Visual Genome (VG_100K, VG_100K_2)
```

#### 2. Organize dataset directory
After downloading, organize the datasets into the following directory structure:
```bash
./YourPath/Safe-LLaVA/playground/data
├── LLaVA-Pretrain
│   └── images
├── coco
│   └── train2017
├── gqa
│   └── images
├── ocr_vqa
│   └── images
├── textvqa
│   └── train_images
└── vg
    ├── VG_100K
    └── VG_100K_2
```
