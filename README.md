# 🚗 Vehicle Insurance — End-to-End MLOps Project

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
| `/training` | GET | Triggers full ML training pipeline |

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


> Built as a full-stack MLOps project demonstrating production ML engineering practices — modular pipelines, cloud integration, containerization, and automated deployment.
