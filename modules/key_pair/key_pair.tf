# Create a key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)

  tags = {
    Name = var.key_pair_tag
  }
}
