data "template_cloudinit_config" "config" {
    gzip          = true
    base64_encode = true
    #this will your cloud configuration file
    part {
        content_type = "text/cloud-config"
        content = "packages: ['apache2']"
    }
    
}