import zipfile
import os
from google.cloud import storage

# === Configuration ===
bucket_name = "tf-hari-bucket"  # <-- Update to match your terraform.tfvars bucket_name
destination_blob_name = "source-code.zip"

# === Step 1: Create dummy function file ===
os.makedirs("function_source", exist_ok=True)
with open("function_source/hello_world.py", "w") as f:
    f.write("""
def hello_world(request):
    return "Hello, World!"
""")

# === Step 2: Create a zip archive ===
zip_path = "source-code.zip"
with zipfile.ZipFile(zip_path, 'w') as zipf:
    zipf.write("function_source/hello_world.py", arcname="hello_world.py")

# === Step 3: Upload the zip to GCS ===
storage_client = storage.Client()
bucket = storage_client.bucket(bucket_name)
blob = bucket.blob(destination_blob_name)

blob.upload_from_filename(zip_path)

print(f"✅ Uploaded {zip_path} to gs://{bucket_name}/{destination_blob_name}")
