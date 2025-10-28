###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gftbsd8qcsji4lvqd2"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1glt1ekpsufq10uno48"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}


variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILGxFEynH58lcgr06sT2X/XTjvFR8BAbPeznJYYakNfx macbook@192.168.1.6.non-exists.ptr.local"
  description = "ssh-keygen -t ed25519"
}

### VM web vars

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family for the VM"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform type for VM"
}

#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#  description = "Number of CPU cores"
#}

#variable "vm_web_memory" {
#  type        = number
#  default     = 1
#  description = "Amount of memory in GB"
#}

#variable "vm_web_core_fraction" {
#  type        = number
#  default     = 20
#  description = "CPU performance percentage"
#
#}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Whether the VM is preemptible"
}

variable "vms_resources" {
  description = "Resources configuration for VMs"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  }))
}


variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "DB VM name"
}

variable "metadata" {
  description = "Common metadata for all VMs"
  type        = map(string)
}
