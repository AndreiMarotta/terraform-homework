variable region {
  type = string
}

variable ip_on_launch {
  type = bool
}

variable route_table_names {
  type = list
}

variable internet_gateway_name {
  type = string
}

variable vpc_cidr {
  type = string
}

variable dns_support {
  type = bool
}

variable dns_hostnames {
  type = bool
}

variable subnet {
  type = list(object( {
        cidr = string
        availability_zone = string
        name = string
    }))
}

variable ec2_type {
  type = list(object( {
        name = string
        instance_type = string
    }))
}

variable port {
  type = list
}