variable "location" {
    type = string
    default = "westus"
}
variable "prefix" {
    type = string
    default = "demo"
}
variable "ssh-source-address" {
    type = string
    default = "*"
}
variable "ip-config" {
    default = [
        {
        name = "instance-ip1"
        allocation = "Dynamic"
        primary = true
        },
        {
        name = "instance-ip2"
        allocation = "Dynamic"
        primary = false 
        },
    ]
}
variable "project_tags" {
    type = map(string)
    default = {
        component = "Frontend"
        environment = "Production"
    }
}