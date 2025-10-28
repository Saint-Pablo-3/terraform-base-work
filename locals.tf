locals {
  vms_resources = var.vms_resources

  vm_web_full_name = "${var.vpc_name}-${var.vm_web_name}-${var.default_zone}"
  vm_db_full_name  = "${var.vpc_name}-${var.vm_db_name}-ru-central1-b"

  metadata = var.metadata
}

