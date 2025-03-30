# Define the target index name
INDEX_NAME="books"

# Define the input CSV file
CSV_FILE="books.csv"

# Define the output Bulk API file
BULK_FILE="books.json"

awk -v index_name="$INDEX_NAME" -F',' '
NR==1 {
    for (i=1; i<=NF; i++) {
        gsub(/^"|"$/, "", $i);
        header[i]=$i;
    }
    next;
}
{
    printf "{\"index\": {\"_index\": \"%s\"}}\n", index_name;

    printf "{";
    for (i=1; i<=NF; i++) {
        field_value = $i;
        field_name = header[i];

        gsub(/^"|"$/, "", field_value);
        gsub(/\\/, "\\\\", field_value);
        gsub(/"/, "\\\"", field_value);

        printf "\"%s\":\"%s\"", field_name, field_value;

        if (i<NF) printf ",";
    }
    printf "}\n";
}' "$CSV_FILE" > "$BULK_FILE"

echo "Conversion complete. Bulk data written to $BULK_FILE"