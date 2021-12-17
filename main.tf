
resource "genesyscloud_integration_action" "LambdaDataAction" {
  name           = "${local.resource_name_prefix}-data-action"
  category       = "${local.resource_name_prefix}-Lambda"
  integration_id = var.genesys_integration_id
  secure         = var.secure_data_action

  contract_input  = var.data_action_input
  contract_output = var.data_action_output

  config_request {
    request_url_template = var.lambda_arn
    request_type         = "POST"
  }

  config_response {
    translation_map          = {}
    translation_map_defaults = {}
    success_template         = "$${rawResult}"
  }
}
