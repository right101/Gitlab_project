output ec2 {
    value = aws_instance.gitlab.public_ip
}