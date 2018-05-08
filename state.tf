terraform {
  backend "gcs" {
    bucket  = "thekevjames-terraform"
    path    = "infrastructure.tfstate"
    project = "thekevjames-175823"
  }
}
