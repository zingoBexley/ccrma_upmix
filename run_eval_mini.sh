# Check if a directory was provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 /path/to/directory"
  exit 1
fi

# Directory to process
DIRECTORY="$1"

# Verify that the provided argument is a directory
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: $DIRECTORY is not a directory."
  exit 1
fi

# Loop through each file with the specified extensions in the directory
for file in "$DIRECTORY"/*.{wav,m4a,mp3}; do
  # Check if the file exists to avoid errors with empty matches
  if [ -e "$file" ]; then
    demucs --repo ./release_models -n 56aa5c4c "$file"
  fi
done