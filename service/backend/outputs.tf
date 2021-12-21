output "instance_id" {
    value = aws_spot_instance_request.comroom-spot.spot_instance_id
}

output "public_ip" {
    value = aws_spot_instance_request.comroom-spot.public_ip
}