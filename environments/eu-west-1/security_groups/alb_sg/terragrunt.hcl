include {
    path = find_in_parent_folders()
}

terraform {
  source = "../../../../module_sg"
}

inputs = {
    security_group_name = "alb_sg"
    vpc_id = "vpc-08530c62f6b5cb8a3"

    security_group_rules = {
        rule01 = {
            description = "HTTP allow ingress"
            direction = "ingress"
            protocol = "tcp"
            from_port = 80
            to_port = 80
            addresses = {
                type = "cidr_blocks"
                cidr_blocks = ["0.0.0.0/0"]
            }
        },

        rule02 = {
            description = "HTTPs allow ingress"
            direction = "ingress"
            protocol = "tcp"
            from_port = 443
            to_port = 443
            addresses = {
                type = "cidr_blocks"
                cidr_blocks = ["0.0.0.0/0"]
            }
        },

        rule03 = {
            description = "Allow egress"
            direction = "egress"
            protocol = "-1"
            from_port = 0
            to_port = 0
            addresses = {
                type = "cidr_blocks"
                cidr_blocks = ["0.0.0.0/0"]
            }
        },
    }
}