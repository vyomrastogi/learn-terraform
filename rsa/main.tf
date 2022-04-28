resource "local_file" "key_data" {
  filename        = "../results/rsa/.pki/private_key.pem"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0400"
}
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# TODO: for below file function to work, a file needs to exist at
# specified location. Workaround is to run first two blocks and then this. 
# Need to learn how such scenarios can be handled in terraform
resource "tls_cert_request" "csr" {
  key_algorithm   = tls_private_key.private_key.algorithm
  private_key_pem = file(local_file.key_data.filename)
  depends_on      = [local_file.key_data]

  subject {
    common_name  = "vr.com"
    organization = "VR Consulting Services"
  }
}