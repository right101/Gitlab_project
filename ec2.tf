resource "aws_instance" "gitlab" {
    ami                    = data.aws_ami.ubuntu.id 
    instance_type          = var.instance_type
    subnet_id              = aws_subnet.public_subnet[0].id
    vpc_security_group_ids = [aws_security_group.project_sg.id]
    key_name               = aws_key_pair.bastion_key.key_name
    user_data              = file("gitlab.sh")
}