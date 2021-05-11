
tags={
    "CreatedBy"="Terraform"
}
subnet_ids=[]
security_group_ids=[]
api_gw_name="HK-DIGI-API-GW-HTTP"
api_gw_protocol="HTTP"
api_gw_stage_name="$default"
api_gw_stage_auto_deploy=true
api_gw_authorizer_type="REQUEST"
api_gw_authorizer_enable_simple_responses=true
api_gw_authorizer_payload_format_version="2.0"
api_gw_authorizer_result_ttl_in_seconds=0
api_gw_authorizer_name="Api-GW-Authorizer"
api_gw_integration_description="Authorizer with LB"
api_gw_integration_type="HTTP_PROXY"
api_gw_integration_method="ANY"
api_gw_integration_connection_type="VPC_LINK"
api_gw_route_key="ANY /"

