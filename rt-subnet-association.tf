
//associating public subnet and rt

resource "aws_route_table_association" "pub-rta" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public-rt.id
  
}

//associating private subet and rt

resource "aws_route_table_association" "pri-rta" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private-rt.id
  
}