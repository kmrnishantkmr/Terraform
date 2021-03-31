output "Jenkins_Main_Node_Public_IP" {
  value = aws_instance.jenkins-master.public_ip
}

output "Jenkins_Worker_Public_IPs" {
  value = {
    for instance in aws_instance.jenkins-worker-oregon :
    instance.id => instance.public_ip
  }

}

#Add LB DNS to output
output "LB-DNS-NAME" {
  value = aws_lb.application-lb.dns_name
}

output "url" {
  value = aws_route53_record.jenkins.fqdn
}
