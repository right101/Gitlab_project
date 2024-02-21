resource "aws_route_table" "public" {
    vpc_id     = aws_vpc.main.id 
    route  {
        cidr_block = var.cidr_block_rt
        gateway_id = aws_internet_gateway.main.id
    }
    tags = {
        Name = format("%s_rt", var.Public) #var.Public_rt 
    }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.main_igw
  }
}
resource "aws_route_table_association" "task1" {
  count = 3
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
    vpc_id     = aws_vpc.main.id 
    route {
        cidr_block = var.cidr_block_rt
        nat_gateway_id = aws_nat_gateway.main.id
    }
     tags = {
        Name = format("%s_rt", var.Private) #var.Private_rt
    }
}
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.elastic.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public_subnet[0].id
  tags = {
    Name = var.main_ngw
  }
}

resource "aws_route_table_association" "task2" {
  count = 3
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}