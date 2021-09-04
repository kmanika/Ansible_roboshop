output "spot_price" {
  value = data.aws_ec2_spot_price.spot_details.spot_price
}