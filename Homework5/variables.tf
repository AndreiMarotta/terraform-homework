variable region {
  type = string
}

variable ip_on_launch {
  type = bool
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
        az = string
        name = string
        rt_name = string
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