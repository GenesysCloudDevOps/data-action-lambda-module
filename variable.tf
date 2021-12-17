variable "prefix" {
  type        = string
  description = "A name that is to be used as the resource name prefix. Usually it's the project name."
}

variable "environment" {
  type        = string
  description = "Name of the environment, e.g., dev, test, stable, staging, uat, prod etc."
}

variable "secure_data_action" {
  type        = bool
  description = "True, Secure Data Action can only be invoked from a Secure flow. False, can be called from any flow "
}

variable "lambda_arn" {
  type        = string
  description = "Arn of the Lambda that will be invoked by the data action"
}

variable "genesys_integration_id" {
  type        = string
  description = "Genesys Cloud Integration Id"
}

variable "data_action_input" {
  type        = string
  description = "Input contract for the data action"
}

variable "data_action_output" {
  type        = string
  description = "Output contract for the data action"
}
