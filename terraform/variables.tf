variable "credentials" {
  description = "My Credentials"
  default     = "./keys/my-creds.json"
}

variable "project" {
  description = "Project name"
  default     = "ark-terraform-demo"
}

variable "region" {
  description = "Project region"
  default     = "us-central1"
}

variable "location" {
  description = "Project location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "flight_status_dataset"
}

variable "gcs_bucket_name" {
  description = "My storage bucket name"
  default     = "flight-status-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}