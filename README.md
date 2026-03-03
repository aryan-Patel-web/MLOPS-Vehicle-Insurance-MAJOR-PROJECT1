# MLOPS-Vehicle-Insurance-MAJOR-PROJECT1

Developed a production-ready end-to-end MLOps pipeline for vehicle insurance prediction using Python, MongoDB, and Scikit-learn. Implemented modular components including data ingestion, validation, transformation, model training, and prediction pipeline with robust logging and exception handling. Automated CI/CD and deployment using Docker, AWS S3, EC2, ECR, and GitHub Actions to enable scalable model versioning, containerization, and continuous delivery.

Tech Stack: Python, Scikit-learn, MongoDB Atlas, AWS S3, EC2, ECR, Docker, GitHub Actions, Flask, MLOps, CI/CD


🚗 Vehicle Insurance Prediction – End-to-End MLOps Project

An end-to-end Machine Learning + MLOps production-ready system that predicts whether a customer will respond to vehicle insurance offers.

This project demonstrates:

Modular ML pipeline architecture

MongoDB Atlas integration

Data validation & transformation

Model training & evaluation

AWS S3 model registry

Docker containerization

CI/CD using GitHub Actions

Deployment on AWS EC2

FastAPI web application

🏗️ Project Architecture
Vehicle Insurance ML System
│
├── Data Ingestion (MongoDB)
├── Data Validation
├── Data Transformation
├── Model Trainer
├── Model Evaluation
├── Model Pusher (AWS S3)
├── Prediction Pipeline
├── FastAPI Web App
└── CI/CD + Docker + EC2 Deployment
🌐 Web Application

The application is built using:

FastAPI

Jinja2 Templates

HTML + CSS (Static files)

Uvicorn server

Routes:
Route	Description
/ (GET)	Render prediction form
/ (POST)	Predict response
/train	Trigger model training
🛠️ Tech Stack

Python 3.10

FastAPI

Scikit-learn

MongoDB Atlas

AWS S3

Docker

GitHub Actions

EC2 (Ubuntu)

Conda

⚙️ Project Setup
1️⃣ Create Project Template
python template.py
2️⃣ Setup Packaging

Write setup.py

Write pyproject.toml

Install local packages

Reference: crashcourse.txt

3️⃣ Create Virtual Environment
conda create -n vehicle python=3.10 -y
conda activate vehicle
pip install -r requirements.txt

Verify installation:

pip list
🍃 MongoDB Setup

Create MongoDB Atlas account

Create new project

Create M0 Cluster

Add DB user (username/password)

Add Network Access:

0.0.0.0/0

Copy Python connection string

Set Environment Variable
For Bash
export MONGODB_URL="mongodb+srv://<username>:<password>@cluster..."
echo $MONGODB_URL
For PowerShell
$env:MONGODB_URL="mongodb+srv://<username>:<password>@cluster..."
echo $env:MONGODB_URL
📊 ML Pipeline Components
🔹 Data Ingestion

Fetch data from MongoDB

Convert JSON → DataFrame

Save artifacts

🔹 Data Validation

Validate schema

Detect missing columns

Schema defined in schema.yaml

🔹 Data Transformation

Feature engineering

Encoding & scaling

Train/Test split

🔹 Model Trainer

Train classification model

Save trained model

🔹 Model Evaluation

Compare with previous production model

Threshold: 0.02

🔹 Model Pusher

Push model to AWS S3 Bucket

☁️ AWS Setup
IAM Configuration

Create IAM user

Attach AdministratorAccess

Create Access Keys

Set environment variables:

export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."
S3 Bucket

Bucket Name:

my-model-mlopsproj

Used for:

Model registry

Version control

🐳 Docker Setup
Build Image
docker build -t vehicleproj .
Run Container
docker run -p 5080:5000 vehicleproj
🚀 CI/CD Pipeline
GitHub Actions Workflow

Triggers on:

Every push to main branch

Pipeline:

Build Docker Image

Push to AWS ECR

Deploy to EC2

Restart container

🖥️ EC2 Deployment
Instance Config:

Ubuntu Server 24.04

t2.medium

30GB storage

Port 5080 enabled

Access App:
http://<EC2-Public-IP>:5080
▶️ Run Application Locally
python app.py

Access:

http://localhost:5000

⚠️ Do NOT use 0.0.0.0 in browser.

🎯 Model Training

Trigger training manually:

http://localhost:5000/train

Or in production:

http://<EC2-IP>:5080/train
📁 Project Structure
src/
│
├── components/
│   ├── data_ingestion.py
│   ├── data_validation.py
│   ├── data_transformation.py
│   ├── model_trainer.py
│   ├── model_evaluation.py
│   └── model_pusher.py
│
├── configuration/
├── entity/
├── aws_storage/
├── pipeline/
├── utils/
│
app.py
Dockerfile
requirements.txt
setup.py
pyproject.toml
🔥 Key Features

✔ Modular ML architecture
✔ Production-ready structure
✔ Model registry on AWS
✔ Fully containerized
✔ CI/CD automated deployment
✔ Scalable cloud hosting
✔ Real-time prediction UI

📈 Resume Highlights

Built end-to-end MLOps pipeline from scratch

Integrated MongoDB Atlas for data ingestion

Implemented schema validation and feature engineering

Deployed model registry using AWS S3

Containerized application using Docker

Automated deployment using GitHub Actions

Hosted application on AWS EC2

🏆 Outcome

A fully production-ready ML system capable of:

Automated retraining

Model version control

Cloud deployment

Real-time predictions