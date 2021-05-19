
tags={
    "CreatedBy"="Terraform"
}
subnet_ids=[]
security_group_ids=[]
api_gw_name="HK-DIGI-API-GW-HTTP"
api_gw_protocol="HTTP"
api_gw_stage_name="$default"
api_gw_stage_auto_deploy=true
api_gw_integration_description="ELB with VPC Link Integration"
api_gw_integration_type="HTTP_PROXY"
api_gw_integration_method="ANY"
api_gw_integration_connection_type="VPC_LINK"
api_gw_route_key=["ANY /forms/health/connection"]
elb_integration_uri=""

