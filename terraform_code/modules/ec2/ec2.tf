resource "aws_spot_instance_request" "Roboshop_spot_ec2" {
  count                           = length(var.components)
  ami                             = var.ami_id
  instance_type                   = "t2.micro"
  spot_price                      = data.aws_ec2_spot_price.spot_details.spot_price
  spot_type                       = "persistent"
  vpc_security_group_ids          = [var.sg_details]
  instance_interruption_behavior  = "stop"
  wait_for_fulfillment            = true
  tags                            = {
    Name                          = "${element(var.components,count.index)}-${var.Env}"
  }
}

resource "aws_ec2_tag" "ec2_tag" {
  count                           = length(var.components)
  key                             = "Name"
  resource_id                     = aws_spot_instance_request.Roboshop_spot_ec2.*.spot_instance_id[count.index]
  value                           = "${element(var.components,count.index)}-${var.Env}"
}
resource "aws_route53_record" "roboshop_dns" {
  count                           = length(var.components)
  name                            = "${element(var.components,count.index)}-${var.Env}"
  type                            = "A"
  ttl                             = 300
  zone_id                         = "Z09750201DUHVNHVKBJU4"
  records                         = [aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[count.index]]
}
data "aws_ec2_spot_price" "spot_details" {
  instance_type                   = "t2.micro"
  availability_zone               = "us-east-1a"

  filter {
    name                          = "product-description"
    values                        = ["Linux/UNIX"]
  }
}

/*resource "null_resource" "shell-scripts" {
  depends_on = [aws_route53_record.roboshop_dns]
  count                           = length(var.components)
  provisioner "remote-exec" {
    connection {
      host                        = element(aws_spot_instance_request.Roboshop_spot_ec2.*.public_ip,count.index)
      user                        = "centos"
      password                    = "DevOps321"
    }
    inline                       = [
      "cd /home/centos",
      "git clone https://github.com/kmanika/roboshop_Base_code.git",
      "cd roboshop_Base_code",
      "sudo make ${element(var.components,count.index)}"
    ]
  }
}*/

resource "local_file" "inventory_file" {
  depends_on = [aws_route53_record.roboshop_dns]
//  content = "[frontend]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[0]}"
  content = "[frontend]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[0]}\n[catalogue]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[1]}\n[user]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[2]}\n[shipping]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[3]}\n[cart]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[4]}\n[payment]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[5]}\n[mysql]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[6]}\n[mongodb]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[7]}\n[rabbitmq]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[8]}\n[redis]\n${aws_spot_instance_request.Roboshop_spot_ec2.*.private_ip[9]}\n"
  filename = "/tmp/inv-roboshop-${var.Env}"
}

