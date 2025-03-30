ES_HOST="https://<hostname>:<port>"

# Set path to the bulk file
BULK_FILE="books.json"

# Name of the index in the elastic search
# NOTE: It should match with the INDEX_NAME provided in the format_csv.sh
INDEX_NAME="books"

# --- If using username/password authentication ---
ES_USER="username"
ES_PASS="password"
AUTH_HEADER="-u ${ES_USER}:${ES_PASS}"

# --- If no authentication ---
# AUTH_HEADER=""

# --- If using an API Key ---
# API_KEY="your_base64_encoded_api_key" # CHANGE THIS
# AUTH_HEADER="-H \"Authorization: ApiKey ${API_KEY}\""

# Send the command to create the index
# Comment the below line if the index is already created
curl -X PUT "${ES_HOST}/${INDEX_NAME}" ${AUTH_HEADER}

# Execute the curl command
# Optional: Add -s for silent mode or -v for verbose mode
curl -X POST "${ES_HOST}/_bulk" \
     -H 'Content-Type: application/x-ndjson' \
     ${AUTH_HEADER} \
     --data-binary "@${BULK_FILE}"
echo ""
echo ""
echo ""
curl -X GET \"${ES_HOST}/${INDEX_NAME}/_count\" ${AUTH_HEADER}