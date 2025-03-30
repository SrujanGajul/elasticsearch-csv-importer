# Importing CSV Data into Elasticsearch using `curl`

- The data that I have used for testing/practise is DylanCastillo's [7k Books]("https://www.kaggle.com/datasets/dylanjcastillo/7k-books-with-metadata")

## Prerequisites

- Ensure you have `curl` and `awk` installed on your system. These are usually available by default on Linux. If not, you can install them using a package manager or by searching online.

## Step 1: Convert CSV to NDJSON Format

Convert your CSV data into NDJSON format using the `format_csv.sh` script. Configure the following variables in the script:

- `INDEX_NAME`: Elasticsearch index to import into.
- `CSV_FILE`: Path to the CSV file.
- `BULK_FILE`: Name of the output NDJSON file.

Run the `format_csv.sh` script to perform the conversion.

## Step 2: Index the Data into Elasticsearch

Use the `index_data.sh` script to send the NDJSON data to your Elasticsearch cluster. Configure the following variables in the script:

- `ES_HOST`: Elasticsearch cluster URL (e.g., `https://my-elastic-host:9200`).
- `BULK_FILE`: Matches the `BULK_FILE` name from Step 1.
- `INDEX_NAME`: Same as in Step 1.
- **Authentication:** Configure authentication method (username/password, API Key, or none).

Comment out the index creation command in `index_data.sh` if the index already exists.

Run the `index_data.sh` script to perform the import.

## Verification

Check the `curl` output for errors. The script includes a command to verify the document count in the target index.
