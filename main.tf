data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}


resource "yandex_vpc_network" "develop" {
  name = "${var.vpc_name}-network"
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = "${var.vpc_name}-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "${var.vpc_name}-subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}


resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_full_name
  platform_id = var.vm_web_platform_id
  zone        = "ru-central1-a"

  resources {
    cores         = local.vms_resources["web"].cores
    memory        = local.vms_resources["web"].memory
    core_fraction = local.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = local.vms_resources["web"].hdd_size
      type     = local.vms_resources["web"].hdd_type
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_a.id
    nat       = true
  }

  metadata = local.metadata
}

resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_full_name
  platform_id = var.vm_db_platform_id
  zone        = "ru-central1-b"

  resources {
    cores         = local.vms_resources["db"].cores
    memory        = local.vms_resources["db"].memory
    core_fraction = local.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = local.vms_resources["db"].hdd_size
      type     = local.vms_resources["db"].hdd_type
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = true
  }

  metadata = local.metadata
}

