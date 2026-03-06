<!-- # 🚗 Vehicle Insurance — End-to-End MLOps Project

![Python](https://img.shields.io/badge/Python-3.10-blue?style=flat-square&logo=python)
![MongoDB](https://img.shields.io/badge/MongoDB-Atlas-green?style=flat-square&logo=mongodb)
![AWS](https://img.shields.io/badge/AWS-S3%20%7C%20EC2%20%7C%20ECR-orange?style=flat-square&logo=amazonaws)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue?style=flat-square&logo=docker)
![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-black?style=flat-square&logo=githubactions)
![Fastapi](https://img.shields.io/badge/Fastapi-Web%20App-lightgrey?style=flat-square&logo=Fastapi)

A production-grade, end-to-end **Machine Learning pipeline** for predicting vehicle insurance outcomes — built with modular architecture, cloud integration, and full CI/CD automation.

---

## 📌 Project Overview

This project demonstrates a complete MLOps lifecycle — from raw data ingestion through MongoDB Atlas, model training with automated evaluation, to cloud deployment on AWS via a Dockerized Fastapi application with GitHub Actions CI/CD.

**Key Highlights:**
- Modular ML pipeline with distinct components for ingestion, validation, transformation, training, evaluation, and deployment
- MongoDB Atlas as cloud data store with automated ETL
- AWS S3 for model registry; EC2 + ECR for production deployment
- Automated CI/CD pipeline triggered on every push

---

## Live Demo

🚀 Deployed Application

http://3.237.0.238:5000

This project demonstrates a production-style MLOps pipeline with:
- Docker containerization
- GitHub Actions CI/CD
- AWS ECR image registry
- AWS EC2 deployment
- FastAPI inference API

## 🗂️ Project Structure

```
MLOPS-Vehicle-Insurance-MAJOR-PROJECT1/
│
├── app.py                          # Fastapi application entry point
├── demo.py                         # Component testing script
├── template.py                     # Project scaffolding script
├── setup.py                        # Local package installation
├── pyproject.toml                  # Build system configuration
├── requirements.txt                # Project dependencies
├── Dockerfile                      # Container build definition
├── .dockerignore
├── .gitignore
├── .env
│
├── config/
│   ├── model.yaml                  # Model hyperparameter config
│   └── schema.yaml                 # Dataset schema for validation
│
├── src/
│   ├── cloud_storage/
│   │   └── aws_storage.py          # S3 push/pull operations
│   │
│   ├── components/
│   │   ├── data_ingestion.py       # MongoDB → CSV pipeline
│   │   ├── data_validation.py      # Schema & drift checks
│   │   ├── data_transformation.py  # Feature engineering & preprocessing
│   │   ├── model_trainer.py        # Model training & evaluation
│   │   ├── model_evaluation.py     # Compare new vs. production model
│   │   └── model_pusher.py         # Push best model to S3
│   │
│   ├── configuration/
│   │   ├── mongo_db_connection.py  # MongoDB Atlas connection
│   │   └── aws_connection.py       # AWS S3 session setup
│   │
│   ├── constants/
│   │   └── __init__.py             # All project-wide constants
│   │
│   ├── data_access/
│   │   └── proj1_data.py           # Fetch & transform MongoDB data to DataFrame
│   │
│   ├── entity/
│   │   ├── config_entity.py        # Dataclasses for component configs
│   │   ├── artifact_entity.py      # Dataclasses for component outputs
│   │   ├── estimator.py            # Custom model wrapper
│   │   └── s3_estimator.py         # S3-aware model loader/saver
│   │
│   ├── exception/
│   │   └── __init__.py             # Custom exception handler
│   │
│   ├── logger/
│   │   └── __init__.py             # Timestamped logging setup
│   │
│   ├── pipline/
│   │   ├── training_pipeline.py    # Orchestrates full training flow
│   │   └── prediction_pipeline.py  # Serves predictions via Fastapi
│   │
│   └── utils/
│       └── main_utils.py           # Shared utility functions
│
├── notebook/
│   ├── data.csv                    # Raw dataset
│   ├── exp-notebook.ipynb          # EDA & Feature Engineering
│   └── mongoDB_demo.ipynb          # MongoDB data push demo
│
├── templates/
│   └── vehicledata.html            # Frontend prediction form
│
├── static/
│   └── css/
│       └── style.css               # UI styling
│
├── artifact/                       # Auto-generated pipeline outputs (gitignored)
│   └── <timestamp>/
│       ├── data_ingestion/
│       ├── data_validation/
│       ├── data_transformation/
│       └── model_trainer/
│
├── logs/                           # Auto-generated timestamped logs (gitignored)
│
└── .github/
    └── workflows/
        └── aws.yaml                # GitHub Actions CI/CD pipeline
```

---

## ⚙️ ML Pipeline Components

| Step | Component | Description |
|------|-----------|-------------|
| 1 | **Data Ingestion** | Pulls raw data from MongoDB Atlas, splits into train/test CSVs |
| 2 | **Data Validation** | Validates schema, checks for drift using `schema.yaml` |
| 3 | **Data Transformation** | Applies preprocessing — encoding, scaling — saves as `.npy` + `preprocessing.pkl` |
| 4 | **Model Trainer** | Trains classifier, evaluates performance, saves `model.pkl` |
| 5 | **Model Evaluation** | Compares new model vs. production model from S3 (threshold: 0.02) |
| 6 | **Model Pusher** | Pushes winning model to AWS S3 model registry |

---

## 🛠️ Tech Stack

| Category | Tools |
|----------|-------|
| **Language** | Python 3.10 |
| **ML / Data** | Scikit-learn, Pandas, NumPy |
| **Database** | MongoDB Atlas |
| **Cloud** | AWS S3, EC2, ECR |
| **Web Framework** | Fastapi |
| **Containerization** | Docker |
| **CI/CD** | GitHub Actions |
| **Experiment Tracking** | Jupyter Notebooks |

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone
 https://github.com/aryan-Patel-web/MLOPS-Vehicle-Insurance.git
cd MLOPS-Vehicle-Insurance
```

### 2. Create & Activate Virtual Environment
```bash
conda create -n vehicle python=3.10 -y
conda activate vehicle
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
pip list   # Verify local packages are installed
```

### 4. Set Environment Variables

**Bash / macOS / Linux:**
```bash
export MONGODB_URL="mongodb+srv://<username>:<password>@cluster..."
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
```

**PowerShell (Windows):**
```powershell
$env:MONGODB_URL = "mongodb+srv://<username>:<password>@cluster..."
$env:AWS_ACCESS_KEY_ID = "your_access_key"
$env:AWS_SECRET_ACCESS_KEY = "your_secret_key"
```

### 5. Run Training Pipeline
```bash
python demo.py
```

### 6. Launch Fastapi App
```bash
python app.py
```
Visit `http://localhost:5080` in your browser.

---

## ☁️ Cloud Infrastructure Setup

### MongoDB Atlas
1. Create a free cluster on [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create a DB user and whitelist IP `0.0.0.0/0`
3. Copy the connection string and set as `MONGODB_URL` env variable
4. Run `mongoDB_demo.ipynb` to push dataset to the cloud

### AWS Services
- **IAM**: Create user `vehicleproj` with `AdministratorAccess`; generate access keys
- **S3 Bucket**: `my-model-mlopsproj` in `us-east-1` (public access enabled)
- **ECR Repository**: `vehicleproj` — stores Docker images
- **EC2 Instance**: `Ubuntu Server 24.04`, `t2.medium`, 30GB storage; open port `5080`

---

## 🔄 CI/CD Pipeline (GitHub Actions)

The `.github/workflows/aws.yaml` pipeline automates the full deployment cycle on every push:

```
Code Push → GitHub Actions Triggered
    → Build Docker Image
    → Push Image to AWS ECR
    → Pull Image on EC2 Self-Hosted Runner
    → Run Container on Port 5080
```

**Required GitHub Secrets:**
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION
ECR_REPO
```

---

## 🌐 Application Routes

| Route | Method | Description |
|-------|--------|-------------|
| `/` | GET | Home — prediction form |
| `/predict` | POST | Returns insurance prediction |
| `/train` | GET | Triggers full ML training pipeline |

---

## 📊 Artifacts & Logs

All pipeline outputs are timestamped and stored under `artifact/` and `logs/` (gitignored):

```
artifact/
└── <DD_MM_YYYY_HH_MM_SS>/
    ├── data_ingestion/feature_store/data.csv
    ├── data_ingestion/ingested/{train,test}.csv
    ├── data_validation/report.yaml
    ├── data_transformation/transformed/{train,test}.npy
    ├── data_transformation/transformed_object/preprocessing.pkl
    └── model_trainer/trained_model/model.pkl
```

---

## 🔑 Key Design Patterns

- **Entity-based config** — `config_entity.py` and `artifact_entity.py` use Python dataclasses to enforce type-safe inputs/outputs across every pipeline stage
- **Custom Logger & Exception** — Timestamped logs and descriptive tracebacks for every component
- **S3 Model Registry** — Models are versioned and stored in S3 under `model-registry/`; evaluation threshold of `0.02` prevents regression

---


> Built as a full-stack MLOps project demonstrating production ML engineering practices — modular pipelines, cloud integration, containerization, and automated deployment. -->



















<div align="center">

# 🚗 Vehicle Insurance — Production-Grade MLOps Pipeline

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.10-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white"/>
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>
  <img src="https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"/>
  <img src="https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white"/>
  <img src="https://img.shields.io/badge/Scikit--Learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Live%20%26%20Deployed-brightgreen?style=flat-square"/>
  <img src="https://img.shields.io/badge/CI%2FCD-Automated-blue?style=flat-square"/>
  <img src="https://img.shields.io/badge/Cloud-AWS%20S3%20%7C%20EC2%20%7C%20ECR-orange?style=flat-square"/>
  <img src="https://img.shields.io/badge/Database-MongoDB%20Atlas-green?style=flat-square"/>
</p>

<h3>
  A full production-grade, end-to-end Machine Learning system — from raw data in the cloud<br/>
  to a live deployed API, with automated CI/CD, containerization, and model versioning.
</h3>

### 🔴 [Live Application → http://3.237.0.238:5000](http://3.237.0.238:5000)

</div>

---

## 📌 What Is This Project?

This is **not** a notebook experiment. This is a **real-world MLOps system** that mirrors how ML is deployed in production environments at scale.

It predicts vehicle insurance outcomes using a binary classification model, wrapped in a fully automated, cloud-native pipeline. Every engineering decision — from modular components to S3 model versioning — was made to reflect **industry best practices**.

> **Think of it as:** MongoDB → ETL → ML Pipeline → Model Registry (S3) → Docker → ECR → EC2 → Live API

---

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        DATA LAYER                                        │
│   Raw CSV  ──►  MongoDB Atlas (Cloud NoSQL)  ──►  ETL  ──►  DataFrames  │
└──────────────────────────────┬──────────────────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────────────────────┐
│                       ML PIPELINE (6 Stages)                             │
│                                                                          │
│  [1] Data Ingestion  →  [2] Data Validation  →  [3] Data Transformation  │
│                                                                          │
│  [4] Model Training  →  [5] Model Evaluation →  [6] Model Pusher (S3)   │
└──────────────────────────────┬──────────────────────────────────────────┘
                               │
┌──────────────────────────────▼──────────────────────────────────────────┐
│                    DEPLOYMENT LAYER (CI/CD)                              │
│                                                                          │
│   GitHub Push  →  GitHub Actions  →  Docker Build  →  Push to ECR       │
│                                                                          │
│   EC2 Self-Hosted Runner  →  Pull Image  →  Run Container  →  Live API  │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## ⚙️ ML Pipeline — Deep Dive

Each pipeline stage is a **self-contained, modular component** with its own config entity, artifact entity, and dedicated class. Components pass typed artifact objects to each other — no hardcoded paths, no implicit state.

| # | Stage | What It Does | Key Output |
|---|-------|-------------|------------|
| 1 | **Data Ingestion** | Connects to MongoDB Atlas, fetches raw documents, converts to DataFrame, performs train/test split | `train.csv`, `test.csv` |
| 2 | **Data Validation** | Validates column count, dtypes, and detects **dataset drift** using `schema.yaml` | `validation_report.yaml` |
| 3 | **Data Transformation** | Feature engineering, label encoding, standard scaling — all wrapped in a reusable `Pipeline` | `train.npy`, `test.npy`, `preprocessing.pkl` |
| 4 | **Model Trainer** | Trains a Scikit-learn classifier with hyperparameters from `model.yaml`, evaluates on test set | `model.pkl` |
| 5 | **Model Evaluation** | Loads **production model from S3**, compares F1/accuracy — only promotes if improvement > **0.02 threshold** | Promotion decision |
| 6 | **Model Pusher** | Pushes winning model to **AWS S3 model registry** under versioned path | S3 model artifact |

### 🔍 Why This Pipeline Design Matters
- **No model regression** — the evaluation threshold prevents a worse model from reaching production
- **Reproducibility** — every run is timestamped; artifacts and logs are fully isolated per run
- **Type-safe handoffs** — Python dataclasses enforce what each component receives and returns
- **Single trigger** — one `GET /training` request kicks off the entire 6-stage pipeline

---

## 🔄 CI/CD Pipeline — GitHub Actions + AWS

```yaml
Trigger: Every push to main branch

Step 1: Checkout code
Step 2: Build Docker image
Step 3: Authenticate with AWS ECR
Step 4: Tag & Push image to ECR repository
Step 5: EC2 Self-Hosted Runner pulls latest image
Step 6: Stop old container → Start new container on port 5080
Step 7: Live at public EC2 IP :5080 ✅
```

**Zero manual deployment.** Every code change flows automatically from GitHub → Docker → ECR → EC2 → Live.

---

## 🌐 Application Routes

| Route | Method | Description |
|-------|--------|-------------|
| `/` | `GET` | Web UI — vehicle data input form |
| `/predict` | `POST` | Returns insurance prediction (JSON + HTML) |
| `/training` | `GET` | Triggers the full 6-stage ML training pipeline |

---

## ☁️ Cloud Infrastructure

```
AWS Services Used:
├── IAM          → Scoped service user with access keys (no root credentials)
├── S3           → Model registry (versioned model storage under "model-registry/")
├── ECR          → Docker image registry for containerized app
└── EC2          → Ubuntu 24.04, T2 Medium — hosts the live FastAPI container

MongoDB Atlas:
└── M0 Free Cluster → Stores raw insurance dataset as documents → queried by pipeline
```

### Why AWS S3 as a Model Registry?
Instead of committing large model files to Git, every trained model is **pushed to S3** with a versioned key. The prediction pipeline **loads the model directly from S3** at runtime — enabling rollbacks, model history, and clean separation of code and artifacts.

---

## 🗂️ Project Structure

```
MLOPS-Vehicle-Insurance/
│
├── app.py                          # FastAPI entry point (routes + startup)
├── demo.py                         # Pipeline testing script
├── template.py                     # Auto-scaffolding script for project structure
├── Dockerfile                      # Multi-stage container build
├── requirements.txt
│
├── config/
│   ├── model.yaml                  # Classifier hyperparameters
│   └── schema.yaml                 # Dataset schema for validation & drift checks
│
├── src/
│   ├── cloud_storage/
│   │   └── aws_storage.py          # Generic S3 push/pull abstraction
│   │
│   ├── components/                 # ← Core ML pipeline stages
│   │   ├── data_ingestion.py
│   │   ├── data_validation.py
│   │   ├── data_transformation.py
│   │   ├── model_trainer.py
│   │   ├── model_evaluation.py
│   │   └── model_pusher.py
│   │
│   ├── configuration/
│   │   ├── mongo_db_connection.py  # MongoDB Atlas connection singleton
│   │   └── aws_connection.py       # Boto3 S3 session factory
│   │
│   ├── constants/
│   │   └── __init__.py             # Single source of truth for all constants
│   │
│   ├── data_access/
│   │   └── proj1_data.py           # MongoDB → Pandas DataFrame transformer
│   │
│   ├── entity/
│   │   ├── config_entity.py        # Dataclasses: typed config for each component
│   │   ├── artifact_entity.py      # Dataclasses: typed outputs for each component
│   │   ├── estimator.py            # Custom model + preprocessor wrapper
│   │   └── s3_estimator.py         # S3-aware model loader/saver
│   │
│   ├── exception/                  # Custom exception with file + line tracebacks
│   ├── logger/                     # Timestamped rotating log setup
│   │
│   ├── pipline/
│   │   ├── training_pipeline.py    # Orchestrates all 6 components in sequence
│   │   └── prediction_pipeline.py  # Loads model from S3, serves predictions
│   │
│   └── utils/
│       └── main_utils.py           # YAML readers, serializers, shared helpers
│
├── notebook/
│   ├── exp-notebook.ipynb          # EDA + Feature Engineering exploration
│   └── mongoDB_demo.ipynb          # Dataset push to MongoDB Atlas
│
├── templates/
│   └── vehicledata.html            # Jinja2 prediction form (Bootstrap UI)
│
├── static/css/style.css
│
├── artifact/                       # Auto-generated (gitignored) — timestamped per run
│   └── <DD_MM_YYYY_HH_MM_SS>/
│       ├── data_ingestion/
│       ├── data_validation/
│       ├── data_transformation/
│       └── model_trainer/
│
├── logs/                           # Auto-generated timestamped logs (gitignored)
│
└── .github/
    └── workflows/
        └── aws.yaml                # Full CI/CD definition
```

---

## 🛠️ Complete Tech Stack

| Category | Technology | Purpose |
|----------|-----------|---------|
| **Language** | Python 3.10 | Core development language |
| **ML Framework** | Scikit-learn | Model training, preprocessing pipelines |
| **Data Processing** | Pandas, NumPy | ETL, feature engineering, array serialization |
| **Web Framework** | FastAPI | REST API + HTML form serving |
| **Database** | MongoDB Atlas | Cloud NoSQL raw data store |
| **Cloud Storage** | AWS S3 | Versioned model registry |
| **Compute** | AWS EC2 (T2 Medium) | Production application hosting |
| **Image Registry** | AWS ECR | Dockerized app storage & versioning |
| **Containerization** | Docker | Reproducible, portable deployment |
| **CI/CD** | GitHub Actions | Automated build → push → deploy |
| **Config Management** | YAML + Dataclasses | Type-safe config and artifact contracts |
| **Serialization** | Pickle, NumPy `.npy` | Model and transformer persistence |
| **Logging** | Python `logging` | Timestamped, component-level log files |
| **Experiment Notebooks** | Jupyter | EDA, feature engineering, MongoDB demo |

---

## 🔑 Key Engineering Patterns

### 1. Entity-Based Pipeline Contracts
Every component uses two dataclasses: a `ConfigEntity` (what it needs) and an `ArtifactEntity` (what it produces). This enforces type safety across the entire pipeline with zero ambiguity.

```python
# Example: clean, typed handoff between components
ingestion_artifact: DataIngestionArtifact = data_ingestion.initiate_data_ingestion()
validation_artifact: DataValidationArtifact = data_validation.initiate_data_validation(ingestion_artifact)
```

### 2. Automated Model Promotion Gate
The Model Evaluation component compares the newly trained model against the **currently deployed model pulled from S3**. Promotion only happens if the new model beats the baseline by > `0.02`. This prevents silent regressions from ever reaching production.

### 3. S3 as the Single Source of Truth for Models
Training, evaluation, and prediction pipelines all interact with S3 — not the local filesystem. This makes the system **stateless and horizontally scalable**.

### 4. Custom Exception Tracing
Every exception is caught and re-raised with the **filename and exact line number** where it occurred — making debugging across a multi-component pipeline fast and precise.

### 5. One-Command Pipeline Trigger
The entire 6-stage ML pipeline — from MongoDB data pull to S3 model push — is triggered with a single HTTP request to `/training`. No scripts to run, no order to remember.

---

## 🚀 Run It Locally

### Prerequisites
- Python 3.10, Conda
- MongoDB Atlas cluster + connection string
- AWS account with S3 bucket created

### Setup

```bash
# 1. Clone
git clone https://github.com/aryan-Patel-web/MLOPS-Vehicle-Insurance.git
cd MLOPS-Vehicle-Insurance

# 2. Create environment
conda create -n vehicle python=3.10 -y
conda activate vehicle

# 3. Install dependencies
pip install -r requirements.txt
pip list  # verify local packages installed

# 4. Set environment variables (Bash)
export MONGODB_URL="mongodb+srv://<username>:<password>@cluster..."
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"

# PowerShell equivalent
$env:MONGODB_URL = "mongodb+srv://..."
$env:AWS_ACCESS_KEY_ID = "your_access_key"
$env:AWS_SECRET_ACCESS_KEY = "your_secret_key"

# 5. Run training pipeline
python demo.py

# 6. Launch API
python app.py
# → http://localhost:5080
```

---

## ☁️ Cloud Setup Guide

### MongoDB Atlas
1. Create free M0 cluster → set up DB user → whitelist `0.0.0.0/0`
2. Copy connection string → set as `MONGODB_URL` env variable
3. Run `mongoDB_demo.ipynb` to push the dataset to Atlas

### AWS
1. **IAM** → Create user `vehicleproj` → attach `AdministratorAccess` → generate access keys
2. **S3** → Create bucket `my-model-mlopsproj` in `us-east-1` → uncheck "Block all public access"
3. **ECR** → Create repo `vehicleproj` → copy the URI
4. **EC2** → Launch `Ubuntu Server 24.04`, `T2 Medium`, 30GB → open inbound port `5080`

### EC2 Docker Setup
```bash
sudo apt-get update -y && sudo apt-get upgrade -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu
newgrp docker
```

### GitHub Secrets Required
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION
ECR_REPO
```

---

## 📊 Pipeline Artifacts — What Gets Generated

```
artifact/
└── 06_03_2025_14_30_00/              ← Timestamped per run
    ├── data_ingestion/
    │   ├── feature_store/data.csv    ← Full raw dataset from MongoDB
    │   └── ingested/
    │       ├── train.csv
    │       └── test.csv
    ├── data_validation/
    │   └── report.yaml               ← Drift report + schema validation results
    ├── data_transformation/
    │   ├── transformed/
    │   │   ├── train.npy             ← Preprocessed training array
    │   │   └── test.npy
    │   └── transformed_object/
    │       └── preprocessing.pkl     ← Saved sklearn Pipeline (encoder + scaler)
    └── model_trainer/
        └── trained_model/
            └── model.pkl             ← Trained classifier
```

---

## 📈 Project Highlights for Recruiters

- ✅ **Full MLOps lifecycle** — not just model training, but ingestion → validation → transformation → evaluation → deployment
- ✅ **Production deployment** — live on AWS EC2, accessible via public URL
- ✅ **Automated CI/CD** — zero-touch deployment on every Git push via GitHub Actions
- ✅ **Cloud-native** — MongoDB Atlas for data, S3 for model registry, ECR for containers, EC2 for compute
- ✅ **Model governance** — evaluation gate with threshold comparison against production model
- ✅ **Software engineering best practices** — modular architecture, custom logging, typed entities, YAML-driven config
- ✅ **Containerized** — fully Dockerized for reproducibility and portability
- ✅ **API-first** — predictions and training both served via clean REST endpoints

---

<div align="center">

**Built to demonstrate production ML engineering — not just model accuracy, but the entire system that surrounds it.**

*Modular pipelines · Cloud integration · Automated deployment · Model versioning · Clean architecture*


</div>




















<img src="https://capsule-render.vercel.app/api?type=waving&height=220&color=gradient&customColorList=6,11,20,29&text=Aryan%20Patel&fontSize=52&fontColor=fff&animation=twinkling&fontAlignY=35&desc=MLOps%20Engineer%20%7C%20AI%2FML%20Developer%20%7C%20Generative%20AI%20Engineer%20%7C%20Full-Stack%20Developer&descSize=17&descAlignY=58&textBg=false"/>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=20&duration=3500&pause=900&color=00FF41&center=true&vCenter=true&width=800&lines=Building+Production+ML+Pipelines+%F0%9F%94%A7;MLOps+%7C+DVC+%7C+MLFlow+%7C+Kubernetes+%7C+Prometheus+%F0%9F%9A%80;Deploying+AI+on+AWS+EKS+%2B+ECR+%2B+EC2+%E2%98%81%EF%B8%8F;Crafting+Generative+AI+%26+RAG+Solutions+%F0%9F%A7%A0;Data+%E2%86%92+Model+%E2%86%92+Deploy+%E2%86%92+Monitor+%E2%86%92+Live+%E2%9A%A1;Always+learning%2C+always+shipping+%F0%9F%93%A6" alt="Typing SVG" />
</p>

<p align="center">
  <a href="https://komarev.com/ghpvc/?username=aryan-Patel-web">
    <img src="https://komarev.com/ghpvc/?username=aryan-Patel-web&label=Profile%20views&color=00FFFF&style=flat-square"/>
  </a>
  <img src="https://img.shields.io/badge/Focus-MLOps%20%7C%20GenAI%20%7C%20Full--Stack-blueviolet?style=flat-square"/>
  <img src="https://img.shields.io/badge/Open%20To-Roles%20%26%20Collaborations-brightgreen?style=flat-square"/>
  <img src="https://img.shields.io/badge/Currently%20Building-EKS%20%2B%20Prometheus%20%2B%20Grafana%20MLOps-orange?style=flat-square"/>
</p>

---

## 👋 Hi, I'm Aryan Patel

I'm an **AI/ML & MLOps Engineer** who builds complete, production-ready ML systems — not just models. My work covers the full lifecycle: cloud data pipelines, experiment tracking, automated CI/CD, Kubernetes orchestration, and real-time monitoring with Prometheus + Grafana.

I don't just train models. I **architect the entire system** around them — DVC-versioned data pipelines, MLflow experiment tracking on DagsHub, model registries, EKS-deployed containerized APIs, and observability dashboards that tell you *what your model is doing right now*.

```python
aryan = {
    "roles":       ["MLOps Engineer", "AI/ML Developer", "Generative AI Engineer", "Full-Stack Dev"],
    "currently":   ["EKS + Kubernetes deployments", "Prometheus + Grafana monitoring", "Advanced RAG & Multi-Agent AI"],
    "mlops_stack": ["DVC", "MLflow", "DagsHub", "Docker", "Kubernetes", "EKS", "ECR", "GitHub Actions"],
    "ml_stack":    ["Scikit-learn", "TensorFlow", "LangChain", "ChromaDB", "Groq", "FastAPI", "Flask"],
    "cloud":       ["AWS S3", "AWS EC2", "AWS ECR", "AWS EKS", "AWS IAM", "AWS CloudFormation"],
    "monitoring":  ["Prometheus", "Grafana", "Flask metrics", "Custom dashboards", "EC2-hosted stacks"],
    "fun_fact":    "I break things fast so I can build them better — every failed experiment becomes a repo 😉"
}
```

<p align="center">
  <a href="https://www.linkedin.com/in/aryan-patel-97396524b" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white&color=00FFFF"/>
  </a>
  <a href="mailto:aryanpatel77462@gmail.com" target="_blank">
    <img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white&color=FF4444"/>
  </a>
  <a href="https://drive.google.com/file/d/1lpz0wrWENZNxHlwcs5nSPjIbI9zdyQTc/view?usp=sharing" target="_blank">
    <img src="https://img.shields.io/badge/Resume-View%20PDF-orange?style=for-the-badge&logo=googledrive&logoColor=white"/>
  </a>
  <a href="https://professional-certificati-t3sz2p5.gamma.site/" target="_blank">
    <img src="https://img.shields.io/badge/Portfolio-Visit%20Site-blueviolet?style=for-the-badge&logo=About.me&logoColor=white"/>
  </a>
  <a href="https://wa.me/919140782212" target="_blank">
    <img src="https://img.shields.io/badge/WhatsApp-Message%20Me-25D366?style=for-the-badge&logo=whatsapp&logoColor=white"/>
  </a>
</p>

---

## 🎯 Core Expertise

<table align="center">
<tr>
<td align="center" width="20%">
<h4>⚙️ MLOps & ML Engineering</h4>
DVC pipelines · MLflow tracking · DagsHub · Model versioning · S3 registry · CI/CD · Docker · GitHub Actions · Modular architecture · Cookiecutter DS
</td>
<td align="center" width="20%">
<h4>☸️ Cloud & Kubernetes</h4>
AWS EKS · EC2 · ECR · S3 · IAM · CloudFormation · eksctl · kubectl · LoadBalancer · Auto Scaling · PVC · Node Groups
</td>
<td align="center" width="20%">
<h4>📊 Monitoring & Observability</h4>
Prometheus · Grafana · Custom metric dashboards · Flask metric endpoints · EC2-hosted monitoring stacks · Real-time alerting
</td>
<td align="center" width="20%">
<h4>🧠 ML & Deep Learning</h4>
Scikit-learn · TensorFlow · Keras · LSTM · ANN · NLP · Ensemble models · Feature engineering · EDA · Model evaluation
</td>
<td align="center" width="20%">
<h4>🤖 Generative AI & LLMs</h4>
LangChain · RAG · ChromaDB · Groq · Mistral · LangGraph · CrewAI · Multi-agent systems · HuggingFace · Hallucination reduction
</td>
</tr>
</table>

---

# 🚀 Featured Projects

## ⚙️ MLOps & Machine Learning Projects

---

### 🏆 [MLOPS Vehicle Insurance — End-to-End Production Pipeline](https://github.com/aryan-Patel-web/MLOPS-Vehicle-Insurance-MAJOR-PROJECT1)

> **Flagship Project #1.** A full production-grade MLOps system — not a notebook. A real deployed system with automated CI/CD, cloud model registry, and a live FastAPI endpoint.

<p>
  <img src="https://img.shields.io/badge/Python-3.10-3776AB?style=flat-square&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/Scikit--Learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white"/>
  <img src="https://img.shields.io/badge/MongoDB%20Atlas-47A248?style=flat-square&logo=mongodb&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS%20S3%20%7C%20EC2%20%7C%20ECR-232F3E?style=flat-square&logo=amazonaws&logoColor=white"/>
  <img src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white"/>
  <img src="https://img.shields.io/badge/GitHub%20Actions-2088FF?style=flat-square&logo=githubactions&logoColor=white"/>
  <img src="https://img.shields.io/badge/FastAPI-009688?style=flat-square&logo=fastapi&logoColor=white"/>
  <img src="https://img.shields.io/badge/Status-Live%20🟢-brightgreen?style=flat-square"/>
</p>

```
MongoDB Atlas ──► ETL ──► Data Validation ──► Feature Engineering ──► Model Training
    ──► Model Evaluation (S3 threshold gate: Δ > 0.02) ──► Model Pusher ──► S3 Registry
    ──► FastAPI ──► Docker ──► ECR ──► EC2 ──► 🔴 LIVE
```

| Engineering Feature | Implementation |
|---------------------|----------------|
| 📦 **6-Stage Modular Pipeline** | Isolated components with typed `ConfigEntity` + `ArtifactEntity` — no hardcoded paths |
| ☁️ **Cloud Data Store** | Raw data in **MongoDB Atlas** — fetched, transformed, and split on every run |
| 🔒 **Model Promotion Gate** | New model only promoted if it beats the live S3 model by **> 0.02** — prevents regression |
| 🗄️ **S3 Model Registry** | Every trained model versioned and pushed to **AWS S3** under `model-registry/` |
| 🐳 **Containerized Deployment** | Fully **Dockerized** app deployed to **EC2** via **ECR** image registry |
| 🔄 **Zero-Touch CI/CD** | Git push → Actions → Docker build → ECR push → EC2 pull → live in minutes |
| 📋 **Timestamped Artifacts** | Every run generates isolated, timestamped artifacts for full reproducibility |
| 🛠️ **Custom Logger & Exception** | File + line-level tracebacks across every component for fast debugging |

**🔴 [Live Demo → http://3.237.0.238:5000](http://3.237.0.238:5000)** &nbsp;|&nbsp; **[📂 View Repository](https://github.com/aryan-Patel-web/MLOPS-Vehicle-Insurance-MAJOR-PROJECT1)**

---

### 🔥 Advanced MLOps Capstone — DVC · MLflow · EKS · Prometheus · Grafana

> **Flagship Project #2 — In Active Development 🚧** The most advanced MLOps project in this portfolio. Stacks experiment tracking, data versioning, Kubernetes orchestration, and real-time monitoring on top of the full production pipeline pattern. Expected completion: ~12 days.

<p>
  <img src="https://img.shields.io/badge/DVC-945DD6?style=flat-square&logo=dvc&logoColor=white"/>
  <img src="https://img.shields.io/badge/MLflow-0194E2?style=flat-square&logo=mlflow&logoColor=white"/>
  <img src="https://img.shields.io/badge/DagsHub-orange?style=flat-square"/>
  <img src="https://img.shields.io/badge/AWS%20EKS-FF9900?style=flat-square&logo=amazonaws&logoColor=white"/>
  <img src="https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white"/>
  <img src="https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white"/>
  <img src="https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white"/>
  <img src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white"/>
  <img src="https://img.shields.io/badge/GitHub%20Actions-2088FF?style=flat-square&logo=githubactions&logoColor=white"/>
  <img src="https://img.shields.io/badge/Flask-000000?style=flat-square&logo=flask&logoColor=white"/>
  <img src="https://img.shields.io/badge/Status-In%20Progress%20🚧-yellow?style=flat-square"/>
</p>

```
Raw Data ──► DVC Pipeline (dvc repro) ──► MLflow Experiment Tracking on DagsHub
    ──► Best Model Selected ──► Docker Build ──► Push to AWS ECR
    ──► GitHub Actions CI/CD ──► AWS EKS (Kubernetes Cluster)
    ──► LoadBalancer Service ──► External Traffic hits Flask App
    ──► Prometheus scrapes metrics (port 5000, every 15s)
    ──► Grafana Dashboards ──► Real-Time Monitoring 📊
```

**What's unique vs. Project #1 — layer by layer:**

| Layer | Tool | What It Adds |
|-------|------|-------------|
| 📁 **Data Versioning** | DVC + AWS S3 | Dataset versions tracked; full pipeline reproducibility with `dvc repro` |
| 🧪 **Experiment Tracking** | MLflow + DagsHub | All runs, params, metrics, artifacts logged — compare experiments visually on DagsHub UI |
| 🗂️ **Model Registry** | MLflow Registry | Staged model promotion: `None → Staging → Production` with full version history |
| 🐳 **Container Registry** | AWS ECR | Docker images built and pushed via GitHub Actions on every commit |
| ☸️ **Orchestration** | AWS EKS + kubectl | App runs inside Kubernetes cluster — managed node groups, rolling deployments, health checks |
| ⚖️ **Load Balancing** | EKS LoadBalancer Service | External-facing AWS load balancer distributes traffic across pods automatically |
| 🔐 **Secrets Management** | GitHub Secrets + K8s Secrets | AWS keys and app tokens injected at runtime via environment — never in code |
| 📡 **Metrics Collection** | Prometheus (EC2) | Scrapes Flask app metrics every 15s — request count, latency, error rates, uptime |
| 📊 **Visualization** | Grafana (EC2) | Real-time dashboards built over Prometheus data source — deployed on dedicated EC2 instance |
| 🏗️ **Infra as Code** | AWS CloudFormation (via eksctl) | EKS control plane + nodegroups provisioned as CloudFormation stacks — teardown in one command |

**Full System Architecture:**
```
┌──────────────────────────────────────────────────────────────────┐
│  DEVELOPER MACHINE                                               │
│  Code → dvc repro → MLflow logs params/metrics → git push       │
└────────────────────────────┬─────────────────────────────────────┘
                             │ triggers GitHub Actions
┌────────────────────────────▼─────────────────────────────────────┐
│  CI/CD LAYER (GitHub Actions)                                    │
│  pytest → Docker build → authenticate ECR → push image to ECR   │
└────────────────────────────┬─────────────────────────────────────┘
                             │ kubectl apply deployment.yaml
┌────────────────────────────▼─────────────────────────────────────┐
│  AWS EKS CLUSTER (Kubernetes)                                    │
│  Flask App Pods ◄── LoadBalancer ◄── External Traffic :5000      │
│  K8s Secrets (env vars) │ PVC (persistent storage) │ Namespaces  │
│  Node Group: t3.small · Auto Scaling · CloudFormation managed    │
└────────────────────────────┬─────────────────────────────────────┘
                             │ Prometheus scrapes :5000/metrics
┌────────────────────────────▼─────────────────────────────────────┐
│  MONITORING STACK (EC2 Instances)                                │
│  Prometheus EC2 (:9090) ──► prometheus.yml ──► scrape config     │
│  Grafana EC2 (:3000)    ──► Prometheus data source               │
│  Dashboards: Req rate · Latency · Error rate · Pod health        │
└──────────────────────────────────────────────────────────────────┘
```

---

<table>
<tr>
<td width="50%">

### 📈 LSTM Stock Price Predictor
<img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white"/>
<img src="https://img.shields.io/badge/Keras-D00000?style=flat-square&logo=keras&logoColor=white"/>
<img src="https://img.shields.io/badge/Flask-000000?style=flat-square&logo=flask&logoColor=white"/>
<img src="https://img.shields.io/badge/Chart.js-FF6384?style=flat-square&logo=chartdotjs&logoColor=white"/>

LSTM trained on 60-step sequence windows for next-day close price prediction. Saved model + scaler for reproducible inference. Live Flask dashboard with **Chart.js** actual vs. predicted visualization.

**Key:** Sequence windowing · MinMaxScaler · LSTM architecture · Flask deployment

</td>
<td width="50%">

### 💰 Customer Salary Prediction (ANN)
<img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white"/>
<img src="https://img.shields.io/badge/Keras-D00000?style=flat-square&logo=keras&logoColor=white"/>
<img src="https://img.shields.io/badge/Streamlit-FF4B4B?style=flat-square&logo=streamlit&logoColor=white"/>
<img src="https://img.shields.io/badge/Scikit--Learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white"/>

End-to-end ANN regression for salary prediction. Full preprocessing pipeline (encoding + scaling), TensorFlow/Keras training, and interactive **Streamlit** web app for real-time inference.

**[📂 View Repository](https://github.com/aryan-Patel-web/Customer-Salary-Prediction-Using_ANN_DL_Project)**

</td>
</tr>
<tr>
<td width="50%">

### 🛍️ Amazon ML Challenge — Smart Product Pricing
<img src="https://img.shields.io/badge/LightGBM-01A9DB?style=flat-square"/>
<img src="https://img.shields.io/badge/XGBoost-FF6600?style=flat-square"/>
<img src="https://img.shields.io/badge/CatBoost-yellow?style=flat-square"/>
<img src="https://img.shields.io/badge/TF--IDF-blueviolet?style=flat-square"/>

Multimodal pipeline (text + image features). **120k images fetched in 1 hour** via `ThreadPoolExecutor`. TF-IDF + image features with ensemble achieving **CV SMAPE 52%** (5-fold cross-validation).

**Key:** TruncatedSVD · Multimodal features · Parallel downloads · Ensemble stacking

</td>
<td width="50%">

### 📚 Kindle Review Sentiment Analysis
<img src="https://img.shields.io/badge/Word2Vec-Gensim-orange?style=flat-square"/>
<img src="https://img.shields.io/badge/Random%20Forest-green?style=flat-square"/>
<img src="https://img.shields.io/badge/Flask-000000?style=flat-square&logo=flask&logoColor=white"/>
<img src="https://img.shields.io/badge/NLTK-blue?style=flat-square"/>

End-to-end NLP sentiment pipeline using **Word2Vec embeddings + RandomForest**. Full preprocessing: tokenization, stopword removal, lemmatization. Deployed as lightweight Flask web app.

**Key:** Gensim Word2Vec · Feature averaging · NLP preprocessing · Flask deployment

</td>
</tr>
</table>

---

## 🤖 Generative AI Projects

<table>
<tr>
<td width="50%">

### 🌊 FloatChat AI — Ocean Intelligence Assistant
<img src="https://img.shields.io/badge/LangChain-1C3C3C?style=flat-square&logo=langchain&logoColor=white"/>
<img src="https://img.shields.io/badge/ChromaDB-FF6B35?style=flat-square"/>
<img src="https://img.shields.io/badge/Groq-red?style=flat-square"/>
<img src="https://img.shields.io/badge/Streamlit-FF4B4B?style=flat-square&logo=streamlit&logoColor=white"/>
<img src="https://img.shields.io/badge/Tesseract%20OCR-blue?style=flat-square"/>

RAG-based multimodal chatbot over ARGO ocean datasets. Achieves **90% answer parity to ChatGPT**, hallucination reduction via retrieval verification + cross-check agents, latency **typ. <2s**.

**[📂 View Repository](https://github.com/aryan-Patel-web/FloatChat_AI)**

</td>
<td width="50%">

### 🚀 PitchGroww-AI — Startup Pitch Analyzer
<img src="https://img.shields.io/badge/CrewAI-blueviolet?style=flat-square"/>
<img src="https://img.shields.io/badge/LangChain-1C3C3C?style=flat-square&logo=langchain&logoColor=white"/>
<img src="https://img.shields.io/badge/Groq-red?style=flat-square"/>
<img src="https://img.shields.io/badge/Twilio-F22F46?style=flat-square&logo=twilio&logoColor=white"/>

Multi-agent pipeline (analyzer → domain advisor → stylist) that rewrites pitch decks. Auto-generates investor-ready PDFs and delivers via **Email + WhatsApp** with agentic automation.

**[📂 View Repository](https://github.com/aryan-Patel-web/PitchGroww-AI_Startup_Pitch_Analyzer_Enhancer)**

</td>
</tr>
<tr>
<td width="50%">

### ⚡ Velocity-AI Funds — PDF to Excel Automation
<img src="https://img.shields.io/badge/LLM%20%2B%20OCR-orange?style=flat-square"/>
<img src="https://img.shields.io/badge/PyMuPDF-blue?style=flat-square"/>
<img src="https://img.shields.io/badge/Schema%20Validation-green?style=flat-square"/>

LLM + OCR extraction engine with **94% structured field accuracy** and **<15 sec end-to-end** conversion. Multi-pass extraction + schema validation for hallucination reduction.

**[📂 View Repository](https://github.com/aryan-Patel-web/Velocity-AI-Funds-PDF-to-Excel-Sheet)**

</td>
<td width="50%">

### 🔬 Auto-Research + Email Automation Agent
<img src="https://img.shields.io/badge/LangGraph-1C3C3C?style=flat-square"/>
<img src="https://img.shields.io/badge/RAG-blueviolet?style=flat-square"/>
<img src="https://img.shields.io/badge/Multi--Agent-orange?style=flat-square"/>

**LangGraph** autonomous research agent: search → summarize → verify → email. RAG grounding reduces hallucinations by **28%**. Multi-recipient batch delivery with fallback summarization mode.

</td>
</tr>
</table>

---

## 💻 Full-Stack Development Projects

<table>
<tr>
<td width="50%">

### 🏠 Airbnb Full-Stack Clone
<img src="https://img.shields.io/badge/React-61DAFB?style=flat-square&logo=react&logoColor=black"/>
<img src="https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white"/>
<img src="https://img.shields.io/badge/MongoDB-47A248?style=flat-square&logo=mongodb&logoColor=white"/>
<img src="https://img.shields.io/badge/Cloudinary-3448C5?style=flat-square"/>

Property listing, booking, wishlist, and map-based search. JWT auth, host dashboards, Cloudinary image pipeline, and fully responsive UI.

</td>
<td width="50%">

### 🚗 Ola/Uber Ride-Hailing Platform
<img src="https://img.shields.io/badge/React-61DAFB?style=flat-square&logo=react&logoColor=black"/>
<img src="https://img.shields.io/badge/Socket.IO-010101?style=flat-square&logo=socketdotio&logoColor=white"/>
<img src="https://img.shields.io/badge/Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white"/>

Real-time rider–driver matching, fare calculation, and live tracking via **Socket.IO**. JWT auth, modular backend, production-ready deployment with connection pooling.

</td>
</tr>
<tr>
<td width="50%">

### 📊 Mixpanel Enterprise UI Clone
<img src="https://img.shields.io/badge/React-61DAFB?style=flat-square&logo=react&logoColor=black"/>
<img src="https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=typescript&logoColor=white"/>
<img src="https://img.shields.io/badge/Framer%20Motion-0055FF?style=flat-square&logo=framer&logoColor=white"/>

Pixel-perfect enterprise UI with smooth **60fps animations**, scroll effects, parallax, and micro-interactions. Highly optimized component architecture.

</td>
<td width="50%">

### 💎 Google Gemini UI Clone
<img src="https://img.shields.io/badge/React-61DAFB?style=flat-square&logo=react&logoColor=black"/>
<img src="https://img.shields.io/badge/Gemini%20API-4285F4?style=flat-square&logo=google&logoColor=white"/>
<img src="https://img.shields.io/badge/Vite-646CFF?style=flat-square&logo=vite&logoColor=white"/>

Multimodal chat UI with history panel and animated components. Architecture ready for plugging in LLM inference or RAG APIs directly.

</td>
</tr>
</table>

---

## 🛠️ Full Tech Stack

<h4 align="center">⚙️ MLOps, Experiment Tracking & Data Versioning</h4>
<p align="center">
  <img src="https://img.shields.io/badge/DVC-945DD6?style=for-the-badge&logo=dvc&logoColor=white"/>
  <img src="https://img.shields.io/badge/MLflow-0194E2?style=for-the-badge&logo=mlflow&logoColor=white"/>
  <img src="https://img.shields.io/badge/DagsHub-orange?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/GitHub%20Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white"/>
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>
  <img src="https://img.shields.io/badge/Cookiecutter-D4AA00?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/pipreqs-grey?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/pytest-0A9EDC?style=for-the-badge&logo=pytest&logoColor=white"/>
</p>

<h4 align="center">☸️ Cloud, Kubernetes & Infrastructure</h4>
<p align="center">
  <img src="https://img.shields.io/badge/AWS%20EKS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS%20EC2-FF9900?style=for-the-badge&logo=amazonec2&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS%20ECR-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS%20S3-569A31?style=for-the-badge&logo=amazons3&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS%20IAM-DD344C?style=for-the-badge&logo=amazonaws&logoColor=white"/>
  <img src="https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white"/>
  <img src="https://img.shields.io/badge/eksctl-FF9900?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/kubectl-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white"/>
  <img src="https://img.shields.io/badge/CloudFormation-FF4F8B?style=for-the-badge&logo=amazonaws&logoColor=white"/>
  <img src="https://img.shields.io/badge/Google%20Cloud-4285F4?style=for-the-badge&logo=googlecloud&logoColor=white"/>
</p>

<h4 align="center">📊 Monitoring, Observability & Alerting</h4>
<p align="center">
  <img src="https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white"/>
  <img src="https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white"/>
  <img src="https://img.shields.io/badge/Flask%20Metrics-000000?style=for-the-badge&logo=flask&logoColor=white"/>
  <img src="https://img.shields.io/badge/Custom%20Dashboards-blueviolet?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/EC2%20Monitoring-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white"/>
</p>

<h4 align="center">🤖 AI / ML / Deep Learning</h4>
<p align="center">
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/Scikit--Learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white"/>
  <img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white"/>
  <img src="https://img.shields.io/badge/Keras-D00000?style=for-the-badge&logo=keras&logoColor=white"/>
  <img src="https://img.shields.io/badge/XGBoost-FF6600?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/LightGBM-01A9DB?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white"/>
  <img src="https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white"/>
  <img src="https://img.shields.io/badge/NLTK-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Seaborn-3776AB?style=for-the-badge"/>
</p>

<h4 align="center">🧠 Generative AI & LLM Stack</h4>
<p align="center">
  <img src="https://img.shields.io/badge/LangChain-1C3C3C?style=for-the-badge&logo=langchain&logoColor=white"/>
  <img src="https://img.shields.io/badge/LangGraph-1C3C3C?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/CrewAI-blueviolet?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/ChromaDB-FF6B35?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Groq-red?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Mistral-orange?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/HuggingFace-FFD21E?style=for-the-badge&logo=huggingface&logoColor=black"/>
  <img src="https://img.shields.io/badge/RAG%20Pipelines-green?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Vector%20DBs-9B59B6?style=for-the-badge"/>
</p>

<h4 align="center">🌐 Web, Backend & APIs</h4>
<p align="center">
  <img src="https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white"/>
  <img src="https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white"/>
  <img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white"/>
  <img src="https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white"/>
  <img src="https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=react&logoColor=black"/>
  <img src="https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white"/>
  <img src="https://img.shields.io/badge/Tailwind-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white"/>
  <img src="https://img.shields.io/badge/Socket.IO-010101?style=for-the-badge&logo=socketdotio&logoColor=white"/>
  <img src="https://img.shields.io/badge/Streamlit-FF4B4B?style=for-the-badge&logo=streamlit&logoColor=white"/>
</p>

<h4 align="center">🗄️ Databases, Storage & Dev Tools</h4>
<p align="center">
  <img src="https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white"/>
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black"/>
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white"/>
  <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"/>
  <img src="https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white"/>
  <img src="https://img.shields.io/badge/Zapier-FF4A00?style=for-the-badge&logo=zapier&logoColor=white"/>
  <img src="https://img.shields.io/badge/D3.js-F9A03C?style=for-the-badge&logo=d3dotjs&logoColor=white"/>
  <img src="https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white"/>
</p>

---

## 📊 GitHub Stats

<p align="center">
  <img src="https://streak-stats.demolab.com/?user=aryan-Patel-web&theme=vue&hide_border=true&cache_seconds=86400" alt="GitHub Streak" width="49%" />
  <img src="https://github-readme-stats.vercel.app/api?username=aryan-patel-web&show_icons=true&theme=vue&hide_border=true&locale=en" alt="GitHub Stats" width="49%" />
</p>
<p align="center">
  <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=aryan-Patel-web&layout=compact&theme=vue&hide_border=true&langs_count=10&cache_seconds=86400" alt="Top Languages" width="49%"/>
</p>
<p align="center">
  <img height="280em" src="https://github-readme-activity-graph.vercel.app/graph?username=aryan-Patel-web&theme=vue&radius=10" alt="Activity Graph" />
</p>

---

## 🏆 Certifications

<table align="center">
<tr>
<td align="center">
  <h4>📜 Complete Generative AI Course</h4>
  <p>With LangChain and HuggingFace</p>
  <p><strong>Udemy</strong> · UC-1c29da31-bec9-4bb6-9b42-9a8fa2275edb</p>
  <a href="https://www.udemy.com/certificate/UC-1c29da31-bec9-4bb6-9b42-9a8fa2275edb">
    <img src="https://img.shields.io/badge/View%20Certificate-Udemy-A435F0?style=for-the-badge&logo=udemy&logoColor=white"/>
  </a>
</td>
<td align="center">
  <h4>📜 Complete Data Science, ML, DL, NLP Bootcamp</h4>
  <p>End-to-End Machine Learning</p>
  <p><strong>Udemy</strong> · UC-444c073c-100e-4638-afd5-27743417fdda</p>
  <a href="https://www.udemy.com/certificate/UC-444c073c-100e-4638-afd5-27743147fdda">
    <img src="https://img.shields.io/badge/View%20Certificate-Udemy-A435F0?style=for-the-badge&logo=udemy&logoColor=white"/>
  </a>
</td>
<td align="center">
  <h4>📜 Data Analysis with Python</h4>
  <p>IBM Developer Skills Network</p>
  <p><strong>IBM CognitiveClass</strong> · IBM-DA-PYTHON-2024</p>
  <a href="https://courses.cognitiveclass.ai/certificates/IBM-DA-PYTHON-2024">
    <img src="https://img.shields.io/badge/View%20Certificate-IBM-054ADA?style=for-the-badge&logo=ibm&logoColor=white"/>
  </a>
</td>
</tr>
</table>

---

## 🔗 Let's Connect & Collaborate

<p align="center">
  <a href="https://www.linkedin.com/in/aryan-patel-97396524b" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>
  <a href="mailto:aryanpatel77462@gmail.com" target="_blank">
    <img src="https://img.shields.io/badge/Email-Say%20Hello-D14836?style=for-the-badge&logo=gmail&logoColor=white"/>
  </a>
  <a href="https://professional-certificati-t3sz2p5.gamma.site/" target="_blank">
    <img src="https://img.shields.io/badge/Portfolio-View%20Projects-blueviolet?style=for-the-badge&logo=About.me&logoColor=white"/>
  </a>
  <a href="https://drive.google.com/file/d/1lpz0wrWENZNxHlwcs5nSPjIbI9zdyQTc/view?usp=sharing" target="_blank">
    <img src="https://img.shields.io/badge/Resume-Download%20PDF-orange?style=for-the-badge&logo=googledrive&logoColor=white"/>
  </a>
  <a href="https://wa.me/919140782212" target="_blank">
    <img src="https://img.shields.io/badge/WhatsApp-Message%20Me-25D366?style=for-the-badge&logo=whatsapp&logoColor=white"/>
  </a>
</p>

<br/>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/tobiasmeyhoefer/tobiasmeyhoefer/output/github-snake-dark.svg" />
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/tobiasmeyhoefer/tobiasmeyhoefer/output/github-snake.svg" />
  <img alt="github-snake" src="https://raw.githubusercontent.com/tobiasmeyhoefer/tobiasmeyhoefer/output/github-snake.svg" />
</picture>

<div align="center">

**⭐ If you found any of my projects useful, a star means a lot! ⭐**

*Open to full-time roles, freelance collabs, and interesting AI/ML projects.*

</div>

<img src="https://capsule-render.vercel.app/api?type=waving&height=120&color=gradient&customColorList=6,11,20,29&section=footer"/>