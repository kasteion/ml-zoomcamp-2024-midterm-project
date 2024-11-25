# Fraud Detection in Energy Consumption

In industries with high volumes of transactional data, detecting anomalies such as fraud is a critical task for maintaining operational integrity and reducing financial losses. The goal of this model is to identify fraudulent activity among clients based on historical data, including demographic information and usage patterns.

The dataset comprises two key components:

1. **Client Data**: This dataset contains general information about the clients, such as their unique IDs, categories, regional and district assignments, and the date when they were onboarded. This data also includes a binary target column that indicates whether a client has been flagged for fraud in the past.

2. **Invoice Data**: This dataset records detailed transactional information for each client. It includes various consumption levels, tariff types, and other metrics related to utility usage, such as meter readings, consumption coefficients, and the duration of billing cycles.

These datasets are complementary: client data provides high-level demographic information, while invoice data captures granular details of client behavior over time.

The primary challenge is to predict and identify fraudulent clients based on patterns in their behavior and transaction history. Fraudulent behavior often manifests in specific patterns, such as:

1. Abnormally high or low consumption levels.
2. Frequent discrepancies in meter readings.
3. Multiple tariff types or unusual invoice configurations for the same client.
4. The location of the client could also be an important factor.

However, distinguishing fraudulent clients from legitimate ones is non-trivial due to:

1. **Data Complexity**: The invoice dataset contains multiple interdependent features that need to be aggregated and interpreted in the context of client-level data.
2. **Data Imbalance**: Fraud cases typically represent a small fraction of the overall dataset, which poses challenges for model training and evaluation.

This solution will be used by operational teams to:

1. **Prioritize Investigations**: Identify high-risk clients who need further review or monitoring.
2. **Improve Resource Allocation**: Focus efforts on clients most likely to be fraudulent, optimizing the use of investigative resources.

# Dataset

The dataset can be found in [data/archive.zip](data/archive.zip)

Or in [kaggle](https://www.kaggle.com/datasets/mrmorj/fraud-detection-in-electricity-and-gas-consumption?select=client_train.csv)

# Installation and Setup

This project uses Pipenv for dependency management and virtual environment creation. Follow these steps to set up the environment and install the required dependencies:

## Prerequisites

1. Ensure you have Python 3.7 or later installed.

```bash
python --version
```

2. Install Pipenv if it's not already installed:

```bash
pip install pipenv
```

3. Install the dependencies

```bash
pipenv install
```

4. Activate the virtual environment

```bash
pipenv shell
```

5. Unzip data/archive.zip

```bash
unzip data/archive.zip
```

6. Run the train script

```bash
python3 train.py
```

7. Run the prection service

```bash
gunicorn --bind 0.0.0.0:9696 predict:app
```

8. Deactivating the environment

```bash
exit
```

# Docker

1. Build the Docker image

```bash
docker build -t ml-zoomcamp-midterm .
```

2. Run the Docker image

```bash
docker run -p 9696:9696 -d ml-zoomcamp-midterm
```
