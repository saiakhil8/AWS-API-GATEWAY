output "api_gw_endpoint" {
  description = "Api Gateway endpoint"
  value = module.api_gateway.api_gw_endpoint
}


output "api_gw_id" {
  description = "Id of the API gateway"
  value = module.api_gateway.api_gw_id
}

output "api_gw_arn" {
  description = "Address of the cluster"
  value = module.api_gateway.api_gw_arn
}