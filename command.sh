# Download The Docker Compose
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.7.2/docker-compose.yaml'

# Monitoring The Airflow apps
docker compose --profile flower up

# Setting the right Airflow user
mkdir -p ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)" > .env

# Initialize the database
docker compose up airflow-init

# Cleaning-up the environment
# The docker-compose environment we have prepared is a “quick-start” one. It was not designed to be used in production and it has a number of caveats - one of them being that the best way to recover from any problem is to clean it up and restart from scratch.
docker compose down --volumes --remove-orphans
rm -rf '<DIRECTORY>'

# AFTER CLEAN, RUN THE FOLLOWING COMMANDS
# Start the environment
docker compose up

# Access the Environment
    # CLI
    curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.7.2/airflow.sh'
    chmod +x airflow.sh

    # Webserver
    http://localhost:8080

# Cleaning UP
docker compose down --volumes --rmi all