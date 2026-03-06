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
