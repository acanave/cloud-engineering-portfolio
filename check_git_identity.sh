#!/bin/bash

# Set expected values
EXPECTED_USER="acanave"
EXPECTED_EMAIL="cape915@gmail.com"
EXPECTED_REMOTE="git@github-account2:acanave/cloud-engineering-portfolio.git"
EXPECTED_SSH_HOST="git@github-account2"
SSH_KEY_PATH="~/.ssh/id_rsa_github_acanav"

echo "🔍 Checking Git identity and SSH configuration..."

# Check Git user.name
CURRENT_USER=$(git config --get user.name)
if [[ "$CURRENT_USER" != "$EXPECTED_USER" ]]; then
    echo "❌ Incorrect Git user.name ($CURRENT_USER). Fixing..."
    git config user.name "$EXPECTED_USER"
    echo "✅ Git user.name set to $EXPECTED_USER"
else
    echo "✅ Git user.name is correct ($CURRENT_USER)"
fi

# Check Git user.email
CURRENT_EMAIL=$(git config --get user.email)
if [[ "$CURRENT_EMAIL" != "$EXPECTED_EMAIL" ]]; then
    echo "❌ Incorrect Git user.email ($CURRENT_EMAIL). Fixing..."
    git config user.email "$EXPECTED_EMAIL"
    echo "✅ Git user.email set to $EXPECTED_EMAIL"
else
    echo "✅ Git user.email is correct ($CURRENT_EMAIL)"
fi

# Check Git remote URL
CURRENT_REMOTE=$(git remote get-url origin 2>/dev/null)
if [[ "$CURRENT_REMOTE" != "$EXPECTED_REMOTE" ]]; then
    echo "❌ Incorrect Git remote ($CURRENT_REMOTE). Fixing..."
    git remote set-url origin "$EXPECTED_REMOTE"
    echo "✅ Git remote set to $EXPECTED_REMOTE"
else
    echo "✅ Git remote is correct ($CURRENT_REMOTE)"
fi

# Check SSH authentication
echo "🔑 Testing SSH authentication..."
SSH_TEST=$(ssh -T "$EXPECTED_SSH_HOST" 2>&1)
if [[ "$SSH_TEST" == *"Hi $EXPECTED_USER!"* ]]; then
    echo "✅ SSH authentication successful: $SSH_TEST"
else
    echo "❌ SSH authentication failed. Attempting to fix..."
    ssh-add "$SSH_KEY_PATH"
    sleep 2
    SSH_TEST_RETRY=$(ssh -T "$EXPECTED_SSH_HOST" 2>&1)
    if [[ "$SSH_TEST_RETRY" == *"Hi $EXPECTED_USER!"* ]]; then
        echo "✅ SSH authentication fixed!"
    else
        echo "❌ SSH authentication still failing. Manually check your SSH key."
    fi
fi

echo "✅ All checks completed!"
