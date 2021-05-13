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
  //"$default"
  auto_deploy = var.api_gw_stage_auto_deploy
}

resource "aws_apigatewayv2_authorizer" "api_gw_authorizer" {
  api_id           = aws_apigatewayv2_api.api_gw_api.id
  authorizer_type  = var.api_gw_authorizer_type
  authorizer_uri   = "arn:aws:lambda:eu-west-1:493214895033:function:trial-apigateway-authorizer"
 // enable_simple_responses = var.api_gw_authorizer_enable_simple_responses
 // authorizer_payload_format_version = var.api_gw_authorizer_payload_format_version
  identity_sources = ["$request.header.Authorization"]
  //authorizer_result_ttl_in_seconds = var.api_gw_authorizer_result_ttl_in_seconds
  name             = var.api_gw_authorizer_name
  jwt_configuration {
    audience = ["all"]
    issuer   = "https://${aws_cognito_user_pool.pool.endpoint}"
  }
}

resource "aws_cognito_user_pool" "pool" {
  name = "hk-digi-user-pool"
}

resource "aws_apigatewayv2_integration" "api_gw_integration" {
  api_id           = aws_apigatewayv2_api.api_gw_api.id
  description      = "Example with a load balancer"
  integration_type = "HTTP_PROXY"
  integration_uri  = aws_lb_listener.example.arn

  integration_method = "ANY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.api_gw_vpclink.id

  tls_config {
    server_name_to_verify = "example.com"
  }

  request_parameters = {
    "append:header.authforintegration" = "$context.authorizer.authorizerResponse"
    "overwrite:path"                   = "staticValueForIntegration"
  }

  response_parameters {
    status_code = 403
    mappings = {
      "append:header.auth" = "$context.authorizer.authorizerResponse"
    }
  }

  response_parameters {
    status_code = 200
    mappings = {
      "overwrite:statuscode" = "204"
    }
  }
}

resource "aws_apigatewayv2_route" "api_gw_route" {
  api_id    = aws_apigatewayv2_api.api_gw_api.id
  route_key = var.api_gw_route_key
  target = "integrations/${aws_apigatewayv2_integration.api_gw_integration.id}"
}