#ACM config
#Create ACM certificate and request validation vis DNS(Route 53)
resource "aws_acm_certificate" "jenkins-lb-https" {
  provider          = aws.region-master
  domain_name       = join(".", ["jenkins", data.aws_route53_zone.dns.name])
  validation_method = "DNS"
  tags = {
    Name = "Jenkins-ACM"
  }

}

#validates ACM issued certificate via route53
resource "aws_acm_certificate_validation" "cert" {
  provider                = aws.region-master
  certificate_arn         = aws_acm_certificate.jenkins-lb-https.arn
  for_each                = aws_route53_record.cert_validation
  validation_record_fqdns = [aws_route53_record.cert_validation[each.key].fqdn]
}