resource "aws_route53_zone" "this" {
  name = "isitisekai.com"
}

# # terragrunt import aws_route53_record.soa Z02301153SP9F00BOPX69_isitisekai.com_SOA
# resource "aws_route53_record" "soa" {
#   name    = aws_route53_zone.this.name
#   ttl     = "360"
#   type    = "SOA"
#   zone_id = aws_route53_zone.this.zone_id

#   records = [
#     "ns-787.awsdns-34.net.",
#     "ns-1829.awsdns-36.co.uk.",
#     "ns-401.awsdns-50.com.",
#     "ns-1194.awsdns-21.org."
#   ]
# }

# # terragrunt import aws_route53_record.ns Z02301153SP9F00BOPX69_isitisekai.com_NS
# resource "aws_route53_record" "ns" {
#   name    = aws_route53_zone.this.name
#   ttl     = "360"
#   type    = "SOA"
#   zone_id = aws_route53_zone.this.zone_id

#   records = [
#     "ns-787.awsdns-34.net.",
#     "awsdns-hostmaster.amazon.com.",
#     "1",
#     "7200",
#     "900",
#     "1209600",
#     "86400"
#   ]
# }
