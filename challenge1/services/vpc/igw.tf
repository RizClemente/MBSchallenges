resource "aws_internet_gateway" "gw" {
        vpc_id = aws_vpc.vpcrizza.id

        tags   = {
        Name   = "Internet Gateway_Rizza"
        }
  
}



