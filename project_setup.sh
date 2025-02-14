# Create docs directory and files
mkdir -p docs
touch docs/architecture.md docs/setup-guide.md

# Create app directory and files
mkdir -p app
touch app/Dockerfile app/requirements.txt app/main.py

# Create infra directory structure for AWS and GCP
mkdir -p infra/aws/terraform infra/aws/cloudformation
touch infra/aws/terraform/main.tf infra/aws/terraform/variables.tf infra/aws/terraform/outputs.tf
touch infra/aws/cloudformation/template.yaml

mkdir -p infra/gcp/terraform infra/gcp/deployment-manager
touch infra/gcp/terraform/main.tf infra/gcp/terraform/variables.tf infra/gcp/terraform/outputs.tf
touch infra/gcp/deployment-manager/config.yaml

# Create CI/CD directory structure with GitHub Actions workflows
mkdir -p ci-cd/github-actions
touch ci-cd/github-actions/build.yml ci-cd/github-actions/deploy.yml

# Create scripts directory and utility scripts
mkdir -p scripts
touch scripts/deploy.sh scripts/test.sh

# Optionally add basic content to key files
echo "# Multi-Cloud Microservice Project" > README.md
echo "node_modules/\n*.log" > .gitignore

echo "#!/bin/bash\n# Deploy script" > scripts/deploy.sh
echo "#!/bin/bash\n# Test script" > scripts/test.sh
chmod +x scripts/deploy.sh scripts/test.sh

# Add all files to git and commit
git add .
git commit -m "Initial project structure setup"
