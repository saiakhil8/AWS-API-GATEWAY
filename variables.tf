variable "vpc_link_name" {
  type = string
  description = "VPC link name"
}


variable "security_group_ids" {
  type = list(string)
  description = "List of security groupIds to be associated to vpc link"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnets to be associated to vpc link"
}

variable "tags" {
  type = map(string)
  description = "Tags"
}

variable "api_gw_name" {
  type = string
  description = "Name of the Api gateway"
}

variable "api_gw_protocol" {
  type = string
  description = "Api gateway protocol"
}


variable "api_gw_stage_name" {
  type = string
  description = "Name of the Api gateway stage"
}

variable "api_gw_stage_auto_deploy" {
  type = bool
  description = "Api gateway stage Auto Deploy?"
}


# variable "api_gw_authorizer_type" {
#   type = string
#   description = "Api gateway authorizer type"
# }

# variable "api_gw_authorizer_enable_simple_responses" {
#   type = bool
#   description = "Api gateway authorizer enable simple responses"
# }

# variable "api_gw_authorizer_payload_format_version" {
#   type = string
#   description = "Api gateway authorizer payload format version (2.0)"
# }

# variable "api_gw_authorizer_result_ttl_in_seconds" {
#   type = number
#   description = "Api gateway authorizer result ttl in seconds"
# }

# variable "api_gw_authorizer_name" {
#   type = string
#   description = "Api gateway authorizer name"
# }

variable "api_gw_integration_description" {
  type = string
  description = "Api gateway integration description"
}

variable "api_gw_integration_type" {
  type = string
  description = "Api gateway integration type"
}

variable "api_gw_integration_method" {
  type = string
  description = "Api gateway integration method"
}

variable "api_gw_integration_connection_type" {
  type = string
  description = "Api gateway integration connection type"
}

variable "api_gw_route_keys" {
  type = list(string)
  //"ANY /"
  description = "Api gateway route keys list"
}variable "vpc_link_name" {
  type = string
  description = "VPC link name"
}


variable "security_group_ids" {
  type = list(string)
  description = "List of security groupIds to be associated to vpc link"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnets to be associated to vpc link"
}

variable "tags" {
  type = map(string)
  description = "Tags"
}

variable "api_gw_name" {
  type = string
  description = "Name of the Api gateway"
}

variable "api_gw_protocol" {
  type = string
  description = "Api gateway protocol"
}


variable "api_gw_stage_name" {
  type = string
  description = "Name of the Api gateway stage"
}

variable "api_gw_stage_auto_deploy" {
  type = bool
  description = "Api gateway stage Auto Deploy?"
}


# variable "api_gw_authorizer_type" {
#   type = string
#   description = "Api gateway authorizer type"
# }

# variable "api_gw_authorizer_enable_simple_responses" {
#   type = bool
#   description = "Api gateway authorizer enable simple responses"
# }

# variable "api_gw_authorizer_payload_format_version" {
#   type = string
#   description = "Api gateway authorizer payload format version (2.0)"
# }

# variable "api_gw_authorizer_result_ttl_in_seconds" {
#   type = number
#   description = "Api gateway authorizer result ttl in seconds"
# }

# variable "api_gw_authorizer_name" {
#   type = string
#   description = "Api gateway authorizer name"
# }

variable "api_gw_integration_description" {
  type = string
  description = "Api gateway integration description"
}

variable "api_gw_integration_type" {
  type = string
  description = "Api gateway integration type"
}

variable "api_gw_integration_method" {
  type = string
  description = "Api gateway integration method"
}

variable "api_gw_integration_connection_type" {
  type = string
  description = "Api gateway integration connection type"
}

variable "api_gw_route_keys" {
  type = list(string)
  //"ANY /"
  description = "Api gateway route keys list"
}

variable "elb_integration_uri"{
  type = string
  description = "ELB Integration URI"
}