terraform { 
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "morhaf"
        region = "us-east-1"
        access_key = "AKIATMHF7HG3SLSDZVP4"
        secret_key = "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"
    }

}