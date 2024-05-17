
# Configuring the Remote Backend With S3
terraform {
  backend "s3" {
    bucket         = "demo-terraform.tfstate"
    key            = "key/terraform.tfstate"
    region         = "us-west-1"
    #dynamodb_table = "state_lock"
    encrypt        = true

  }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.49.0"
    }
  }
}



# Enabling Versioning 
resource "aws_s3_bucket_versioning" "versioning-state" {
  bucket = "demo-terraform.tfstate"
  versioning_configuration {
    status = "Enabled"
  }
}

# Configuring the Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "new" {
  bucket = "demo-terraform.tfstate"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}



/*AES256 (Advanced Encryption Standard 256-bit) is a symmetric encryption algorithm widely used for securing data. 
It employs a 256-bit key size, making it highly secure and suitable for protecting sensitive information. 
When you enable server-side encryption on an S3 bucket with this algorithm, AWS encrypts each object stored 
in the bucket using AES256 before saving it to disk. This ensures that the data is encrypted at rest, 
providing an additional layer of security to your stored data.
*/