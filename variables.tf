# Copyright 2023 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "project_id" {
  type = string
  #default     = <project_id>
  description = "description"
}

# variable "tags" {
#   type    = list(any)
#   default = ["foo", "bar"]
# }

variable "environment" {
  type        = string
  default     = "env"
  description = "description"
}

variable "vm_params" {
  type = object({
    name                      = string
    machine_type              = string
    zone                      = string
    allow_stopping_for_update = bool
  })
  description = "vm parameters"
  default = {
    name                      = "terraform-instance"
    machine_type              = "f1-micro"
    zone                      = "us-central1-a"
    allow_stopping_for_update = true
  }

  validation {
    condition     = length(var.vm_params.name) > 3
    error_message = "VM name must be at least 4 characters."
  }
}

variable "deploy_multiple_vms" {
  type        = bool
  description = "Define if multiple VM will be deployed or not via count."
  default     = false
}
