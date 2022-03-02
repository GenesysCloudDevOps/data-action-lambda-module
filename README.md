This Terraform module creates a Genesys Cloud Data Action for an AWS Lambda. This data action will allow you invoke an AWS Lambda from your AWS account. The documentation for the building a Genesys Cloud Integration and Data Action manually can be found here:

1. [Genesys Cloud Data Actions Integration](https://help.mypurecloud.com/articles/about-the-aws-lambda-data-actions-integration/)
2. [Example Genesys Cloud Data Action](https://help.mypurecloud.com/articles/example-aws-lambda-function-with-a-data-action/)

## Usage

Shown below is an example of how to configure the remote module.

```hcl
module "lambda_data_action" {
  source                 = "git::https://github.com/GenesysCloudDevOps/data-action-lambda-module.git?ref=main"
  environment            = "dev"
  prefix                 = "dude-order-status"
  secure_data_action     = false
  genesys_integration_id = module.lambda_data_integration.genesys_integration_id   //Example only. Use your own integration id here.
  lambda_arn             = module.lambda_order_status.lambda_arn                   //Example only.  Use your own lambda arn here
  data_action_input      = file("${path.module}/contracts/data-action-input.json") //File containing the JSON for the contract inputs
  data_action_output     = file("${path.module}/contracts/data-action-output.json")  //File containing the JSON for the contract inputs
}
```

The above snippet will create a Genesys Cloud data action called dev-dude-order-status-data-action. To review setting up a trusted role please review the [Genesys Cloud Data Action Integrations Lambda](https://help.mypurecloud.com/articles/about-the-aws-lambda-data-actions-integration/) documentation. 


## Requirements

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a>[terraform](https://www.terraform.io/) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_genesyscloud"></a> [genesyscloud](https://registry.terraform.io/providers/MyPureCloud/genesyscloud/latest) | >= 1.0|


## Inputs
| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="environment"></a> [environment](#environment)  |  A string value used in the naming conventions to indicate what environment this lambda integration for.| `string` | yes |
| <a name="prefix"></a> [prefix](#prefix) |  Name put in front of the integration created. The created name will you the environment and the prefix to create an integration call <<environment>>-<<prefix>>-Lambda-Integration | `string` | yes |
| <a name="secure_data_action"></a> [secure_data_action](#secure\_\data\_\action) | Determines if this is a secure data action. If set to true, this data action can only be invoked from a secure data action. If false, the data action can be invoked by both secure and insecure flows. | `bool` | yes |
| <a name="genesys_integration_id"></a> [genesys_integration_id](#genesys\_\integration\_\id) | Genesys Cloud integration id the data action will be associated with. There is a Terraform [resource](https://registry.terraform.io/providers/MyPureCloud/genesyscloud/latest/docs/resources/integration) and [data source](https://registry.terraform.io/providers/MyPureCloud/genesyscloud/latest/docs/data-sources/integration) for Genesys Integrations. | `string` | yes |
| <a name="lambda_arn"></a> [lambda_arn](#lambda\_\arn) | ARN for the AWS Lambda that the data action will invoke | `string` | yes |
| <a name="data_action_input"></a> [data_action_input](#data\_\action\_\input) | JSON snippet containing Data Action input contracts. | `string` | yes |
| <a name="data_action_output"></a> [data_action_output](#data\_\action\_\output) | JSON snippet containing Data Action output contracts. | `string` | yes |

## Outputs
| Name | Description | Type | 
|------|-------------|------|
| <a name="integration_data_action_category"></a> [integration_data_action_category](#integration_data_action_category)  |  The category name for the data action integration.| `string` |
| <a name="integration_data_action_name"></a> [integration_data_action_name](#integration_data_action_name) |  The data action name associated with the integration | `string`|
