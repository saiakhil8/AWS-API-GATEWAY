output "api_gw_endpoint" {
  value = aws_apigatewayv2_api.api_gw_api.api_endpoint
}

output "api_gw_id" {
  value = aws_apigatewayv2_api.api_gw_api.id
}

output "api_gw_arn" {
  value = aws_apigatewayv2_api.api_gw_api.arn
}

output "api_gw_integration_id"{
  value = aws_apigatewayv2_integration.api_gw_integration.id
}

output "api_gw_routes_ids"{
  value = aws_apigatewayv2_route.api_gw_routes.*.id 
}