resource "aws_apigatewayv2_vpc_link" "api_gw_vpclink" {
  name               = var.vpc_link_name
  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids
  tags = var.tags
}

resource "aws_apigatewayv2_api" "api_gw_api" {
  name          = var.api_gw_name
  protocol_type = var.api_gw_protocol
}

resource "aws_apigatewayv2_stage" "api_gw_stage" {
  api_id = aws_apigatewayv2_api.api_gw_api.id
  name   = var.api_gw_stage_name
  auto_deploy = var.api_gw_stage_auto_deploy
}

# resource "aws_apigatewayv2_authorizer" "api_gw_authorizer" {
#   api_id           = aws_apigatewayv2_api.api_gw_api.id
#   authorizer_type  = var.api_gw_authorizer_type
#   authorizer_uri   = "arn:aws:lambda:eu-west-1:493214895033:function:trial-apigateway-authorizer"
#  // enable_simple_responses = var.api_gw_authorizer_enable_simple_responses
#  // authorizer_payload_format_version = var.api_gw_authorizer_payload_format_version
#   identity_sources = ["$request.header.Authorization"]
#   //authorizer_result_ttl_in_seconds = var.api_gw_authorizer_result_ttl_in_seconds
#   name             = var.api_gw_authorizer_name
#   jwt_configuration {
#     audience = ["all"]
#     issuer   = "https://${aws_cognito_user_pool.pool.endpoint}"
#   }
# }

# resource "aws_cognito_user_pool" "pool" {
#   name = "hk-digi-user-pool"
# }

resource "aws_apigatewayv2_integration" "api_gw_integration" {
  api_id             = aws_apigatewayv2_api.api_gw_api.id
  description        = var.api_gw_integration_description
  integration_type   = var.api_gw_integration_type //"HTTP_PROXY"
  integration_uri    = var.elb_integration_uri

  integration_method = var.api_gw_integration_method //"ANY"
  connection_type    = var.api_gw_integration_connection_type //"VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.api_gw_vpclink.id

}


resource "aws_apigatewayv2_route" "api_gw_routes" {
  count     = length(var.api_gw_route_keys)
  api_id    = aws_apigatewayv2_api.api_gw_api.id
  route_key = var.api_gw_route_keys[count.index]
  target    = "integrations/${aws_apigatewayv2_integration.api_gw_integration.id}"
}